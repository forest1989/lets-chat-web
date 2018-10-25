/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import java.util.HashMap;
import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.MallOrderManage;
import com.thinkgem.jeesite.modules.letsmall.entity.MallShoppingAddress;

/**
 * 订单信息管理DAO接口
 * @author forest
 * @version 2018-10-24
 */
@MyBatisDao
public interface MallOrderInfoDao extends CrudDao<MallOrderManage> {
	
	public MallShoppingAddress getShopAddress(String id);
	
	public List<HashMap<String, Object>> getOrderProductList(String orderId);
	
	public int updateOrderStatus(MallOrderManage o);
	
	public int updateSendGoodsInfo(MallOrderManage o);
}