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
import com.thinkgem.jeesite.modules.letsmall.entity.MallProductManage;
import com.thinkgem.jeesite.modules.letsmall.service.MallProductManageService;

/**
 * 商品信息管理Controller
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/mallProductManage")
public class MallProductManageController extends BaseController {

	@Autowired
	private MallProductManageService mallProductManageService;
	
	@ModelAttribute
	public MallProductManage get(@RequestParam(required=false) String id) {
		MallProductManage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mallProductManageService.get(id);
		}
		if (entity == null){
			entity = new MallProductManage();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:mallProductManage:view")
	@RequestMapping(value = {"list", ""})
	public String list(MallProductManage mallProductManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MallProductManage> page = mallProductManageService.findPage(new Page<MallProductManage>(request, response), mallProductManage); 
		model.addAttribute("page", page);
		return "modules/letsmall/mallProductManageList";
	}

	@RequiresPermissions("letsmall:mallProductManage:view")
	@RequestMapping(value = "form")
	public String form(MallProductManage mallProductManage, Model model) {
		model.addAttribute("mallProductManage", mallProductManage);
		return "modules/letsmall/mallProductManageForm";
	}

	@RequiresPermissions("letsmall:mallProductManage:edit")
	@RequestMapping(value = "save")
	public String save(MallProductManage mallProductManage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mallProductManage)){
			return form(mallProductManage, model);
		}
		mallProductManageService.save(mallProductManage);
		addMessage(redirectAttributes, "保存商品信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/mallProductManage/?repage";
	}
	
	@RequiresPermissions("letsmall:mallProductManage:edit")
	@RequestMapping(value = "delete")
	public String delete(MallProductManage mallProductManage, RedirectAttributes redirectAttributes) {
		mallProductManageService.delete(mallProductManage);
		addMessage(redirectAttributes, "删除商品信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/mallProductManage/?repage";
	}

}