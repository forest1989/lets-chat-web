/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.AppUserManage;

/**
 * 用户信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-17
 */
@MyBatisDao
public interface AppUserManageDao extends CrudDao<AppUserManage> {
	
	void deleteUserMoneyAccount(@Param("userId")String userId);
}