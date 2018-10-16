/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letschat.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letschat.entity.AppUser;

/**
 * 用户信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-16
 */
@MyBatisDao
public interface AppUserDao extends CrudDao<AppUser> {
	
}