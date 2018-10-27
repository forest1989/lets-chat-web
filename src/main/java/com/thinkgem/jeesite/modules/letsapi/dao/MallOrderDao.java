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
	 * @param mallOrder新增订单表(详情)
	 * @return
	 */
	int insertOrderInfo(List<MallOrderInfo> mallOrderInfo);
	
	/**
	 * @param mallOrder获取订单列表
	 * @return
	 */
	List<MallOrder> selectOrder(MallOrder mallOrderInfo);
	/**
	 * @param mallOrder删除订单信息
	 * @return
	 */
	int deleteOrder(List<MallOrder> mallOrderInfo);
	/**
	 * @param mallOrder删除订单商品信息
	 * @return
	 */
	int deleteOrderInfo(List<MallOrder> mallOrderInfo);
	/**
	 * @param mallOrder修改订单状态为已支付
	 * @return
	 */
	int updateOrder(MallOrder updateOrder);
	/**
	 * @param mallOrder修改商品库存数量。
	 * @return
	 */
	int updateStock(MallOrderInfo mallOrderInfo);
	/**
	 * @param mallOrder支付的时候 减少购物币。
	 * @return
	 */
	int downMoney(MallOrder mallOrder);
	/**
	 * @param mallOrder根据订单编号 订单id 获取 订单金额
	 * @return
	 */
	MallOrder getAmountTotal(MallOrder mallOrder);
	/**
	 * @param mallOrder根据userid获取用户购物币余额
	 * @return
	 */
	MallOrder getUserMoney(String userId);
}