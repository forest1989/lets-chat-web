/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.web;

import java.util.HashMap;
import java.util.List;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.letsmall.entity.MallOrderManage;
import com.thinkgem.jeesite.modules.letsmall.entity.MallShoppingAddress;
import com.thinkgem.jeesite.modules.letsmall.service.MallOrderService;

/**
 * 订单信息管理Controller
 * @author forest
 * @version 2018-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/letsmall/mallOrder")
public class MallOrderController extends BaseController {

	@Autowired
	private MallOrderService mallOrderService;
	
	@ModelAttribute
	public MallOrderManage get(@RequestParam(required=false) String id) {
		MallOrderManage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mallOrderService.get(id);
		}
		if (entity == null){
			entity = new MallOrderManage();
		}
		return entity;
	}
	
	@RequiresPermissions("letsmall:mallOrder:view")
	@RequestMapping(value = {"list", ""})
	public String list(MallOrderManage mallOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MallOrderManage> page = mallOrderService.findPage(new Page<MallOrderManage>(request, response), mallOrder); 
		model.addAttribute("page", page);
		return "modules/letsmall/mallOrderList";
	}

	@RequiresPermissions("letsmall:mallOrder:view")
	@RequestMapping(value = "form")
	public String form(MallOrderManage mallOrder, Model model) {
		MallShoppingAddress shopAddress = mallOrderService.getShopAddress(mallOrder.getAddressId());
		List<HashMap<String, Object>> productList = mallOrderService.getOrderProductList(mallOrder.getId());
		model.addAttribute("shopAddress", shopAddress);
		model.addAttribute("productList", productList);
		model.addAttribute("mallOrder", mallOrder);
		return "modules/letsmall/mallOrderForm";
	}

	@RequiresPermissions("letsmall:mallOrder:edit")
	@RequestMapping(value = "save")
	public String save(MallOrderManage mallOrder, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mallOrder)){
			return form(mallOrder, model);
		}
		mallOrderService.save(mallOrder);
		addMessage(redirectAttributes, "保存订单信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/mallOrder/?repage";
	}
	
	@RequiresPermissions("letsmall:mallOrder:edit")
	@RequestMapping(value = "delete")
	public String delete(MallOrderManage mallOrder, RedirectAttributes redirectAttributes) {
		mallOrderService.delete(mallOrder);
		addMessage(redirectAttributes, "删除订单信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/mallOrder/?repage";
	}
	
	@RequiresPermissions("letsmall:mallOrder:edit")
	@RequestMapping(value = "updateOrderStatus")
	public String updateOrderStatus(MallOrderManage mallOrder, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String optType = request.getParameter("optType");
		if("1".equals(optType)) { // 确认发货操作
			mallOrder.setOrderStatus("03"); // 将订单状态置为已发货
			mallOrderService.updateSendGoodsInfo(mallOrder);
		}
		addMessage(redirectAttributes, "订单信息更新成功");
		return "redirect:"+Global.getAdminPath()+"/letsmall/mallOrder/?repage";
	}

	
}