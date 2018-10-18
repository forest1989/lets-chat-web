/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;

/**
 * 用户信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-16
 */
@MyBatisDao
public interface AppUserDao extends CrudDao<AppUser> {

	/**
	 * @param user
	 * @return
	 */
	AppUser getByLoginName(AppUser user);
	/**
	 * @author zhai_shaobo
	 * app注册dao
	 */
	public int register(Map<String, Object> parmMap);
	/**
	 * @author zhai_shaobo
	 * 查询序列值
	 */
	public String getid();
	/**
	 * @author tao_yonggang
	 * 修改密码
	 */
	int updateByloginName(AppUser user);
	
}