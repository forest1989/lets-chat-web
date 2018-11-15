/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.MomentsInfo;

/**
 * 发朋友圈DAO接口
 * @author tao_yonggang
 * @version 2018-11-15
 */
@MyBatisDao
public interface MomentsInfoDao extends CrudDao<MomentsInfo> {
	
}