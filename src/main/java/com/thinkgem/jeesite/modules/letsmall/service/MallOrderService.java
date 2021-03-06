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
import com.thinkgem.jeesite.modules.letsmall.dao.MallOrderInfoDao;
import com.thinkgem.jeesite.modules.letsmall.entity.MallOrderManage;
import com.thinkgem.jeesite.modules.letsmall.entity.MallShoppingAddress;

/**
 * 订单信息管理Service
 * @author forest
 * @version 2018-10-24
 */
@Service
@Transactional(readOnly = true)
public class MallOrderService extends CrudService<MallOrderInfoDao, MallOrderManage> {

	public MallOrderManage get(String id) {
		return super.get(id);
	}
	
	public List<MallOrderManage> findList(MallOrderManage mallOrder) {
		return super.findList(mallOrder);
	}
	
	public Page<MallOrderManage> findPage(Page<MallOrderManage> page, MallOrderManage mallOrder) {
		return super.findPage(page, mallOrder);
	}
	
	@Transactional(readOnly = false)
	public void save(MallOrderManage mallOrder) {
		super.save(mallOrder);
	}
	
	@Transactional(readOnly = false)
	public void delete(MallOrderManage mallOrder) {
		super.delete(mallOrder);
	}
	
	public MallShoppingAddress getShopAddress(String id) {
		return dao.getShopAddress(id);
	}
	
	public List<HashMap<String, Object>> getOrderProductList(String orderId){
		return dao.getOrderProductList(orderId);
	}
	
	@Transactional(readOnly = false)
	public int updateOrderStatus(MallOrderManage o) {
		return dao.updateOrderStatus(o);
	}
	
	@Transactional(readOnly = false)
	public int updateSendGoodsInfo(MallOrderManage o) {
		o.preUpdate();
		return dao.updateSendGoodsInfo(o);
	}
}