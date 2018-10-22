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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.letsapi.entity.AppSilderImg;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.service.MallProductInfoService;
import com.thinkgem.jeesite.modules.letsapi.utils.JsonUtils;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;

/**
 * 商品信息Controller
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Controller
@RequestMapping(value = "${frontPath}/letsapi/mallProductInfo")
public class MallProductInfoController extends BaseController {

	@Autowired
	private MallProductInfoService mallProductInfoService;
	
	@ModelAttribute
	public MallProductInfo get(@RequestParam(required=false) String id) {
		MallProductInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mallProductInfoService.get(id);
		}
		if (entity == null){
			entity = new MallProductInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("letsapi:mallProductInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(MallProductInfo mallProductInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MallProductInfo> page = mallProductInfoService.findPage(new Page<MallProductInfo>(request, response), mallProductInfo); 
		model.addAttribute("page", page);
		return "modules/letsapi/mallProductInfoList";
	}

	@RequiresPermissions("letsapi:mallProductInfo:view")
	@RequestMapping(value = "form")
	public String form(MallProductInfo mallProductInfo, Model model) {
		model.addAttribute("mallProductInfo", mallProductInfo);
		return "modules/letsapi/mallProductInfoForm";
	}

	@RequiresPermissions("letsapi:mallProductInfo:edit")
	@RequestMapping(value = "save")
	public String save(MallProductInfo mallProductInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mallProductInfo)){
			return form(mallProductInfo, model);
		}
		mallProductInfoService.save(mallProductInfo);
		addMessage(redirectAttributes, "保存商品信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/mallProductInfo/?repage";
	}
	
	@RequiresPermissions("letsapi:mallProductInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(MallProductInfo mallProductInfo, RedirectAttributes redirectAttributes) {
		mallProductInfoService.delete(mallProductInfo);
		addMessage(redirectAttributes, "删除商品信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/mallProductInfo/?repage";
	}
	/**  
	* <p>Description:首页轮播图查询 </p>      
	* @author tao_yonggang  
	* @date 2018年10月22日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getAppSilderImg", method = RequestMethod.POST)
	public String  getAppSilderImg(HttpServletRequest request,HttpServletResponse response, Model model){
		RtnData rtn=new RtnData();
		try {
			rtn=mallProductInfoService.getAppSilderImg(model);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return renderString(response, rtn);
	}

}