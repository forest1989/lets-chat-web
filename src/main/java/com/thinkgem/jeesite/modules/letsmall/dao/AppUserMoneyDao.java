/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.AppUserMoney;

/**
 * 购物币管理DAO接口
 * @author forest
 * @version 2018-10-26
 */
@MyBatisDao
public interface AppUserMoneyDao extends CrudDao<AppUserMoney> {
	public void updateStatus(@Param("stauts")String stauts, @Param("id")String id);
}