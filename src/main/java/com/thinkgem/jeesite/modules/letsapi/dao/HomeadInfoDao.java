/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.HomeadInfo;

/**
 * 广告页配置DAO接口
 * @author tao_yonggang
 * @version 2018-11-19
 */
@MyBatisDao
public interface HomeadInfoDao extends CrudDao<HomeadInfo> {

	List<HomeadInfo> getHomeAd();
	
}