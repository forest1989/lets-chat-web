/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letschatmanage.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letschatmanage.entity.AppUserManage;

/**
 * 用户信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-17
 */
@MyBatisDao
public interface AppUserManageDao extends CrudDao<AppUserManage> {
	
}