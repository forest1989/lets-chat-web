/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.MallProductManage;
import com.thinkgem.jeesite.modules.letsmall.entity.ProductSpecifications;

/**
 * 商品信息管理DAO接口
 * @author tao_yonggang
 * @version 2018-10-20
 */
@MyBatisDao
public interface MallProductManageDao extends CrudDao<MallProductManage> {
	
	public void insertProductSpec(ProductSpecifications ps);
	
	public void deleteProductSpec(@Param("productId")String productId);
	
	public void updatePsDelFlag(@Param("productId")String productId);
	
	public void batchUpdateStatus( @Param("list")List<String> list, @Param("stauts")String stauts);
	
	public List<ProductSpecifications> getProductSpecList(ProductSpecifications ps);
	
	public String getProductNo(@Param("productType")String productType);
}