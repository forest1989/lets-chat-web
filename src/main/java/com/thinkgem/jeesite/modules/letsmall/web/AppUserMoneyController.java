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
import com.thinkgem.jeesite.modules.letsmall.entity.AppUserMoney;
import com.thinkgem.jeesite.modules.letsmall.service.AppUserMoneyService;

/**
 * 购物币管理Controller
 * @author forest
 * @version 2018-10-26
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/appUserMoney")
public class AppUserMoneyController extends BaseController {

	@Autowired
	private AppUserMoneyService appUserMoneyService;
	
	@ModelAttribute
	public AppUserMoney get(@RequestParam(required=false) String id) {
		AppUserMoney entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = appUserMoneyService.get(id);
		}
		if (entity == null){
			entity = new AppUserMoney();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:appUserMoney:view")
	@RequestMapping(value = {"list", ""})
	public String list(AppUserMoney appUserMoney, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AppUserMoney> page = appUserMoneyService.findPage(new Page<AppUserMoney>(request, response), appUserMoney); 
		model.addAttribute("page", page);
		return "modules/letsmall/appUserMoneyList";
	}

	@RequiresPermissions("letsmall:appUserMoney:view")
	@RequestMapping(value = "form")
	public String form(AppUserMoney appUserMoney, Model model) {
		model.addAttribute("appUserMoney", appUserMoney);
		return "modules/letsmall/appUserMoneyForm";
	}

	@RequiresPermissions("letsmall:appUserMoney:edit")
	@RequestMapping(value = "save")
	public String save(AppUserMoney appUserMoney, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, appUserMoney)){
			return form(appUserMoney, model);
		}
		appUserMoneyService.save(appUserMoney);
		addMessage(redirectAttributes, "保存购物币成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/appUserMoney/?repage";
	}
	
	@RequiresPermissions("letsmall:appUserMoney:edit")
	@RequestMapping(value = "delete")
	public String delete(AppUserMoney appUserMoney, RedirectAttributes redirectAttributes) {
		appUserMoneyService.delete(appUserMoney);
		addMessage(redirectAttributes, "删除购物币成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/appUserMoney/?repage";
	}

}