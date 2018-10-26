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
import com.thinkgem.jeesite.modules.letsmall.entity.OperationMoneyLog;
import com.thinkgem.jeesite.modules.letsmall.service.OperationMoneyLogService;

/**
 * 购物币发放日志Controller
 * @author forest
 * @version 2018-10-26
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/operationMoneyLog")
public class OperationMoneyLogController extends BaseController {

	@Autowired
	private OperationMoneyLogService operationMoneyLogService;
	
	@ModelAttribute
	public OperationMoneyLog get(@RequestParam(required=false) String id) {
		OperationMoneyLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = operationMoneyLogService.get(id);
		}
		if (entity == null){
			entity = new OperationMoneyLog();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:operationMoneyLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(OperationMoneyLog operationMoneyLog, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OperationMoneyLog> page = operationMoneyLogService.findPage(new Page<OperationMoneyLog>(request, response), operationMoneyLog); 
		model.addAttribute("optm", operationMoneyLog);
		model.addAttribute("page", page);
		return "modules/letsmall/operationMoneyLogList";
	}

	@RequiresPermissions("letsmall:operationMoneyLog:view")
	@RequestMapping(value = "form")
	public String form(OperationMoneyLog operationMoneyLog, Model model) {
		model.addAttribute("operationMoneyLog", operationMoneyLog);
		return "modules/letsmall/operationMoneyLogForm";
	}

	@RequiresPermissions("letsmall:operationMoneyLog:edit")
	@RequestMapping(value = "save")
	public String save(OperationMoneyLog operationMoneyLog, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, operationMoneyLog)){
			return form(operationMoneyLog, model);
		}
		operationMoneyLogService.save(operationMoneyLog);
		addMessage(redirectAttributes, "保存购物币发放日志成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/operationMoneyLog/?repage";
	}
	
	@RequiresPermissions("letsmall:operationMoneyLog:edit")
	@RequestMapping(value = "delete")
	public String delete(OperationMoneyLog operationMoneyLog, RedirectAttributes redirectAttributes) {
		operationMoneyLogService.delete(operationMoneyLog);
		addMessage(redirectAttributes, "删除购物币发放日志成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/operationMoneyLog/?repage";
	}

}