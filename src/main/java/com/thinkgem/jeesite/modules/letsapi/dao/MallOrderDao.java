/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrder;
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrderInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;

/**
 * 订单信息DAO接口
 * @author zhaishaobo
 * @version 2018-10-24
 */
@MyBatisDao
public interface MallOrderDao extends CrudDao<MallOrder> {
	
	/**
	 * @param mallOrder新增订单表
	 * @return
	 */
	int insertOrder(MallOrder mallOrder);
	
	/**
	 * @param mallOrder新增订单表
	 * @return
	 */
	int insertOrderInfo(List<MallOrderInfo> mallOrderInfo);
	
	
}