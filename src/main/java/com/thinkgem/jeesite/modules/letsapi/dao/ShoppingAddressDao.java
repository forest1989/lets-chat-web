/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;
import com.thinkgem.jeesite.modules.letsapi.entity.ShoppingAddress;

/**
 * 收货地址DAO接口
 * @author tao_yonggang
 * @version 2018-10-23
 */
@MyBatisDao
public interface ShoppingAddressDao extends CrudDao<ShoppingAddress> {

	/**
	 * @param userId获取收货地址
	 * @return
	 */
	List<ShoppingAddress> getShippingAdsList(String userId);

	/**
	 * @param sAdd设为用户默认收货地址和修改地址
	 * @return
	 */
	int updateById(ShoppingAddress sAdd);

	/**
	 * @param sAdd增加收货地址
	 * @return
	 */
	int insertAddress(ShoppingAddress sAdd);

	/**
	 * @return通过id查询用户收货地址数量 
	 */
	Integer getShippingAdsCount();
}