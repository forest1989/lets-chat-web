/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.jwt.api.TokenMgr;
import com.thinkgem.jeesite.modules.letsapi.jwt.config.Constant;
import com.thinkgem.jeesite.modules.letsapi.jwt.model.SubjectModel;
import com.thinkgem.jeesite.modules.letsapi.service.AppUserService;
import com.thinkgem.jeesite.modules.letsapi.utils.JsonUtils;

import net.sf.json.JSONArray;

/**
 * 用户信息Controller
 * @author tao_yonggang
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${frontPath}/letsapi/appuser")
public class AppUserController extends BaseController {

	@Autowired
	private AppUserService appUserService;
	
	@ModelAttribute
	public AppUser get(@RequestParam(required=false) String id) {
		AppUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = appUserService.get(id);
		}
		if (entity == null){
			entity = new AppUser();
		}
		return entity;
	}
	
	@RequiresPermissions("letsapi:appUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(AppUser appUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AppUser> page = appUserService.findPage(new Page<AppUser>(request, response), appUser); 
		model.addAttribute("page", page);
		return "modules/letsapi/appUserList";
	}

	@RequiresPermissions("letsapi:appUser:view")
	@RequestMapping(value = "form")
	public String form(AppUser appUser, Model model) {
		model.addAttribute("appUser", appUser);
		return "modules/letsapi/appUserForm";
	}

	@RequiresPermissions("letsapi:appUser:edit")
	@RequestMapping(value = "save")
	public String save(AppUser appUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, appUser)){
			return form(appUser, model);
		}
		appUserService.save(appUser);
		addMessage(redirectAttributes, "保存用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/appUser/?repage";
	}
	
	@RequiresPermissions("letsapi:appUser:edit")
	@RequestMapping(value = "delete")
	public String delete(AppUser appUser, RedirectAttributes redirectAttributes) {
		appUserService.delete(appUser);
		addMessage(redirectAttributes, "删除用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/appUser/?repage";
	}
	
	/**  
	* <p>Description:用户登录 </p>      
	* @author tao_yonggang  
	* @date 2018年10月17日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String  login(String password,String loginName, HttpServletResponse response, Model model){
		AppUser user=new AppUser();
		user.setLoginName(loginName);
		AppUser appUser=appUserService.login(user);
		if(appUser!=null){
			if(StringUtils.equals(password, appUser.getPassword())){
				if(StringUtils.equals(appUser.getLoginFlag(), "1")) {
					model.addAttribute("code", "500");
					model.addAttribute("message", "您已经被禁止登录");
					return renderString(response, model);
				}
				// 生成TOKEN
				SubjectModel sub = new SubjectModel(appUser.getId(), appUser.getLoginName());//用户信息
				String token = TokenMgr.createJWT(IdGen.uuid(), Constant.JWT_ISS,TokenMgr.generalSubject(sub), Constant.JWT_TTL);
				response.addHeader("Authorization", token);
				model.addAttribute("code", "0000");
				model.addAttribute("message", "登陆成功");
				model.addAttribute("appUser", appUser);
				return renderString(response, model);
			}else {
				model.addAttribute("code", "500");
				model.addAttribute("message", "密码错误");
				return renderString(response, model);
			}
		}else{
			model.addAttribute("code", "500");
			model.addAttribute("message", "账号错误");
			return renderString(response, model);
		}
	}

	/**
	 * @author zhai_shaobo
	 * app注册
	 */
	
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			String jsonStr = request.getParameter("data");
			 JSONArray myJsonArray = JSONArray.fromObject(jsonStr);
			 List<Map<String,Object>> orderIds = (List)myJsonArray;

			 AppUser res = appUserService.register(orderIds);
			 if (res.getCode().equals("0000")) {
				 model.addAttribute("message", "注册成功");
				 model.addAttribute("code", "1");
			}else if(res.getCode().equals("0001")){
				 model.addAttribute("message", "该用户名已被注册!");
				 model.addAttribute("code", "0");
			} else {
				 model.addAttribute("message", "注册失败");
				 model.addAttribute("code", "0");
			}
		} catch (Exception e) {
			model.addAttribute("message", "注册异常");
			 model.addAttribute("code", "0");
		}
//		return JsonMapper.toJsonString(model);
		return renderString(response, model);
	}
	/**  
	* <p>Description:修改密码 </p>      
	* @author tao_yonggang  
	* @date 2018年10月18日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	public String  updatePassword(HttpServletRequest request,HttpServletResponse response, Model model){
		try {
			String jsonStr = request.getParameter("data");
			List<Map<String,Object>> listmp= new JsonUtils().getListMap(jsonStr);
			AppUser appUser=appUserService.updatePassword(listmp);
			if (appUser.getCode().equals("0000")) {
				 model.addAttribute("message", appUser.getMessage());
				 model.addAttribute("code", "0000");
			}else{
				 model.addAttribute("message", appUser.getMessage());
				 model.addAttribute("code", "500");
			}
		} catch (Exception e) {
			model.addAttribute("message", "修改异常");
			model.addAttribute("code", "500");
		}
		return renderString(response, model);
	}
}