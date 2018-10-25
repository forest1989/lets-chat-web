/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsmall.dao.MallOrderDao;
import com.thinkgem.jeesite.modules.letsmall.entity.MallOrder;
import com.thinkgem.jeesite.modules.letsmall.entity.MallShoppingAddress;

/**
 * 订单信息管理Service
 * @author forest
 * @version 2018-10-24
 */
@Service
@Transactional(readOnly = true)
public class MallOrderService extends CrudService<MallOrderDao, MallOrder> {

	public MallOrder get(String id) {
		return super.get(id);
	}
	
	public List<MallOrder> findList(MallOrder mallOrder) {
		return super.findList(mallOrder);
	}
	
	public Page<MallOrder> findPage(Page<MallOrder> page, MallOrder mallOrder) {
		return super.findPage(page, mallOrder);
	}
	
	@Transactional(readOnly = false)
	public void save(MallOrder mallOrder) {
		super.save(mallOrder);
	}
	
	@Transactional(readOnly = false)
	public void delete(MallOrder mallOrder) {
		super.delete(mallOrder);
	}
	
	public MallShoppingAddress getShopAddress(String id) {
		return dao.getShopAddress(id);
	}
	
	public List<HashMap<String, Object>> getOrderProductList(String orderId){
		return dao.getOrderProductList(orderId);
	}
	
	@Transactional(readOnly = false)
	public int updateOrderStatus(MallOrder o) {
		return dao.updateOrderStatus(o);
	}
	
	@Transactional(readOnly = false)
	public int updateSendGoodsInfo(MallOrder o) {
		o.preUpdate();
		return dao.updateSendGoodsInfo(o);
	}
}