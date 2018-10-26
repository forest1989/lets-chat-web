/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsmall.entity.OperationMoneyLog;
import com.thinkgem.jeesite.modules.letsmall.dao.OperationMoneyLogDao;

/**
 * 购物币发放日志Service
 * @author forest
 * @version 2018-10-26
 */
@Service
@Transactional(readOnly = true)
public class OperationMoneyLogService extends CrudService<OperationMoneyLogDao, OperationMoneyLog> {

	public OperationMoneyLog get(String id) {
		return super.get(id);
	}
	
	public List<OperationMoneyLog> findList(OperationMoneyLog operationMoneyLog) {
		return super.findList(operationMoneyLog);
	}
	
	public Page<OperationMoneyLog> findPage(Page<OperationMoneyLog> page, OperationMoneyLog operationMoneyLog) {
		return super.findPage(page, operationMoneyLog);
	}
	
	@Transactional(readOnly = false)
	public void save(OperationMoneyLog operationMoneyLog) {
		super.save(operationMoneyLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(OperationMoneyLog operationMoneyLog) {
		super.delete(operationMoneyLog);
	}
	
}