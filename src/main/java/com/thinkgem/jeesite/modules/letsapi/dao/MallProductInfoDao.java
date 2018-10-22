/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppSilderImg;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;

/**
 * 商品信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-20
 */
@MyBatisDao
public interface MallProductInfoDao extends CrudDao<MallProductInfo> {

	/**
	 * 获取首页轮播图地址
	 * @return 
	 */
	public List<AppSilderImg> getAppSilderImg();
	
}