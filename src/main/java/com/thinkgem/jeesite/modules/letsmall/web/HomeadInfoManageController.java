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
import com.thinkgem.jeesite.modules.letsmall.entity.HomeadInfoManage;
import com.thinkgem.jeesite.modules.letsmall.service.HomeadInfoManageService;

/**
 * 广告页配置Controller
 * @author tao_yonggang
 * @version 2018-11-19
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/homeadInfoManage")
public class HomeadInfoManageController extends BaseController {

	@Autowired
	private HomeadInfoManageService homeadInfoManageService;
	
	@ModelAttribute
	public HomeadInfoManage get(@RequestParam(required=false) String id) {
		HomeadInfoManage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = homeadInfoManageService.get(id);
		}
		if (entity == null){
			entity = new HomeadInfoManage();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:homeadInfoManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(HomeadInfoManage homeadInfoManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<HomeadInfoManage> page = homeadInfoManageService.findPage(new Page<HomeadInfoManage>(request, response), homeadInfoManage); 
		model.addAttribute("page", page);
		return "modules/letsmall/homeadInfoManageList";
	}

	@RequiresPermissions("letsmall:homeadInfoManage:view")
	@RequestMapping(value = "form")
	public String form(HomeadInfoManage homeadInfoManage, Model model) {
		model.addAttribute("homeadInfoManage", homeadInfoManage);
		return "modules/letsmall/homeadInfoManageForm";
	}

	@RequiresPermissions("letsmall:homeadInfoManage:edit")
	@RequestMapping(value = "save")
	public String save(HomeadInfoManage homeadInfoManage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, homeadInfoManage)){
			return form(homeadInfoManage, model);
		}
		homeadInfoManageService.save(homeadInfoManage);
		addMessage(redirectAttributes, "保存广告页配置成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/homeadInfoManage/?repage";
	}
	
	@RequiresPermissions("letsmall:homeadInfoManage:edit")
	@RequestMapping(value = "delete")
	public String delete(HomeadInfoManage homeadInfoManage, RedirectAttributes redirectAttributes) {
		homeadInfoManageService.delete(homeadInfoManage);
		addMessage(redirectAttributes, "删除广告页配置成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/homeadInfoManage/?repage";
	}

}