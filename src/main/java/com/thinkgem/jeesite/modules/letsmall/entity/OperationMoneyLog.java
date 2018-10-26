/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;

/**
 * 购物币发放日志Entity
 * @author forest
 * @version 2018-10-26
 */
public class OperationMoneyLog extends DataEntity<OperationMoneyLog> {
	
	private static final long serialVersionUID = 1L;
	private AppUser user;			// APP用户ID
	private Double moneyTotal;		// 发放/扣除购物币数量
	private String operationType;	// 用户操作状态（0：发放  1：扣除 ）
	private Date startDate;
	private Date endDate;
	
	public OperationMoneyLog() {
		super();
	}

	public OperationMoneyLog(String id){
		super(id);
	}
	
	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

	
	public Double getMoneyTotal() {
		return moneyTotal;
	}

	public void setMoneyTotal(Double moneyTotal) {
		this.moneyTotal = moneyTotal;
	}
	
	
	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}