/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.jwt.api.TokenMgr;
import com.thinkgem.jeesite.modules.letsapi.jwt.config.Constant;
import com.thinkgem.jeesite.modules.letsapi.jwt.model.SubjectModel;
import com.thinkgem.jeesite.modules.letsapi.service.AppUserService;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UploadUtils;

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
	

	/**  
	* <p>Description:用户登录 </p>      
	* @author tao_yonggang  
	* @date 2018年10月17日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user){
		RtnData rtn = new RtnData();
		try {
			AppUser appUser = appUserService.login(user);
			if(appUser!=null){
				if(StringUtils.equals(user.getPassword(), appUser.getPassword())){
					if(StringUtils.equals(appUser.getLoginFlag(), "1")) {
						rtn.setMessage("您已经被禁止登录");
						rtn.setCode("1007");
						return renderString(response, rtn);
					}
					// 生成TOKEN
					SubjectModel sub = new SubjectModel(appUser.getId(), appUser.getLoginName());//用户信息
					String token = TokenMgr.createJWT(IdGen.uuid(), Constant.JWT_ISS,TokenMgr.generalSubject(sub), Constant.JWT_TTL);
					response.addHeader("Authorization", token);
					rtn.setData(appUser);
					rtn.setMessage("登陆成功");
					rtn.setCode("0000");
					return renderString(response, rtn);
				}else {
					rtn.setMessage("密码错误");
					rtn.setCode("1008");
					return renderString(response, rtn);
				}
			}else{
				rtn.setMessage("账号错误");
				rtn.setCode("1009");
				return renderString(response, rtn);
			}
		} catch (Exception e) {
			logger.error("登录异常:"+e.getMessage());
			rtn.setMessage("登录异常");
			rtn.setCode("500");
			return renderString(response, rtn);
		}
	}

	/**
	 * @author zhai_shaobo
	 * app注册
	 */
	
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String register(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			user.setId(IdGen.uuid());
			rtn = appUserService.register(request, user);
			if (rtn.getCode().equals("0000")) {
			    // 生成TOKEN
				SubjectModel sub = new SubjectModel(user.getId(), user.getLoginName());//用户信息
				String token = TokenMgr.createJWT(IdGen.uuid(), Constant.JWT_ISS,TokenMgr.generalSubject(sub), Constant.JWT_TTL);
				response.addHeader("Authorization", token);
			}
		} catch (Exception e) {
			rtn.setMessage("注册异常");
			rtn.setCode("500");
		}
		return renderString(response, rtn);
	}
	/**  
	* <p>Description:修改密码 </p>      
	* @author tao_yonggang  
	* @date 2018年10月18日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request,HttpServletResponse response, 
			AppUser user, Model model){
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.updatePassword(request, user);
		} catch (Exception e) {
			 rtn.setMessage("修改异常");
			 rtn.setCode("500");
		}
		return renderString(response, rtn);
	}
	/**
	 * @author zhai_shaobo
	 * app注册 成功之后 完善用户信息
	 */
	
	@RequestMapping(value = "perfect",method = RequestMethod.POST)
	public String perfect(HttpServletRequest request, HttpServletResponse response, 
			Model model, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			rtn = appUserService.perfect(request, user);	
		} catch (Exception e) {
			rtn.setMessage("信息完善异常!");
			rtn.setCode("500");
			logger.error("perfect---信息完善异常"+e.getMessage());
		}
		return renderString(response, rtn);
	}
	/**  
	* <p>Description:上传文件 </p>      
	* @author tao_yonggang  
	* @date 2018年10月19日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/uploadFile", method = RequestMethod.POST)
	public String uploadFile(HttpServletRequest request,HttpServletResponse response, Model model){
		RtnData rtn = new RtnData();
		Map<String,Object> mp = new HashMap<String, Object>();
		Map<String,Object> retMap = new HashMap<String, Object>();
		UploadUtils up = new UploadUtils();
		try {
			String[] infos = up.uploadFile(request);
			String errorInfo = infos[0];
			String savePath = infos[2];
			String saveUrl = infos[3];
			String fileUrl = infos[4];
			String fileName = infos[6];
			mp.put("saveUrl", saveUrl);
			mp.put("fileName", fileName);
			if(errorInfo.equals("true")) {
				rtn = appUserService.updatePhoto(request,mp);
				if (rtn.getCode().equals("0000")) {
					retMap.put("errorInfo", errorInfo);
					retMap.put("savePath", savePath);
					retMap.put("saveUrl", saveUrl);
					retMap.put("fileUrl", fileUrl);
					retMap.put("fileName", fileName);
					rtn.setData(retMap);
					rtn.setMessage("文件上传成功");
					rtn.setCode("0000");
				}
			}else {
				retMap.put("errorInfo", errorInfo);
				rtn.setData(retMap);
				rtn.setMessage("文件上传失败");
				rtn.setCode("1010");
			}
			
		} catch (Exception e) {
			rtn.setMessage("文件夹创建异常");
			rtn.setCode("500");
		}
		return renderString(response, rtn);
	}
}