/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.letsmall.entity.AppUserManage;
import com.thinkgem.jeesite.modules.letsmall.service.AppUserManageService;

/**
 * 用户信息Controller
 * @author tao_yonggang
 * @version 2018-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/appUserManage")
public class AppUserManageController extends BaseController {

	@Autowired
	private AppUserManageService appUserManageService;
	
	@ModelAttribute
	public AppUserManage get(@RequestParam(required=false) String id) {
		AppUserManage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = appUserManageService.get(id);
		}
		if (entity == null){
			entity = new AppUserManage();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:appUserManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(AppUserManage appUserManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AppUserManage> page = appUserManageService.findPage(new Page<AppUserManage>(request, response), appUserManage); 
		model.addAttribute("page", page);
		return "modules/letsmall/appUserManageList";
	}

	@RequiresPermissions("letsmall:appUserManage:view")
	@RequestMapping(value = "form")
	public String form(AppUserManage appUserManage, Model model) {
		model.addAttribute("appUserManage", appUserManage);
		return "modules/letsmall/appUserManageForm";
	}

	@RequiresPermissions("letsmall:appUserManage:edit")
	@RequestMapping(value = "save")
	public String save(AppUserManage appUserManage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, appUserManage)){
			return form(appUserManage, model);
		}
		appUserManageService.save(appUserManage);
		addMessage(redirectAttributes, "保存用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/appUserManage/?repage";
	}
	
	@RequiresPermissions("letsmall:appUserManage:edit")
	@RequestMapping(value = "delete")
	public String delete(AppUserManage appUserManage, RedirectAttributes redirectAttributes) {
		appUserManageService.delete(appUserManage);
		addMessage(redirectAttributes, "删除用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/appUserManage/?repage";
	}

}