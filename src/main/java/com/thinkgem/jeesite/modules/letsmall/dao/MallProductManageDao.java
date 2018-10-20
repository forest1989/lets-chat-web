/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.MallProductManage;

/**
 * 商品信息管理DAO接口
 * @author tao_yonggang
 * @version 2018-10-20
 */
@MyBatisDao
public interface MallProductManageDao extends CrudDao<MallProductManage> {
	
}