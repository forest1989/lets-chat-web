/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsmall.entity.OperationMoneyLog;

/**
 * 购物币发放日志DAO接口
 * @author forest
 * @version 2018-10-26
 */
@MyBatisDao
public interface OperationMoneyLogDao extends CrudDao<OperationMoneyLog> {
	
}