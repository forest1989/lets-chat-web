/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;
import com.thinkgem.jeesite.modules.letsapi.entity.ProductSpecificationApi;

/**
 * 购物车DAO接口
 * @author tao_yonggang
 * @version 2018-10-23
 */
@MyBatisDao
public interface MallShopcarDao extends CrudDao<MallShopcar> {

	/**
	 * @param shopCar添加购物车
	 * @return
	 */
	int insertShopCar(MallShopcar shopCar);

	/**
	 * @param mallShopcar修改购物车商品数量
	 * @return
	 */
	int updateCountById(MallShopcar mallShopcar);

	/**
	 * @param shopCar查询购物车是否有该商品
	 * @return
	 */
	MallShopcar selectProductIsExist(MallShopcar shopCar);

	/**
	 * @param userId查询购物车数据
	 * @return
	 */
	List<MallShopcar> getShopCarList(String userId);

	/**
	 * @param shopCar查询该规格数量
	 * @return
	 */
	ProductSpecificationApi selectSpecNum(MallShopcar shopCar);
	
}