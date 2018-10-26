/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.entity;

import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 购物币管理Entity
 * @author forest
 * @version 2018-10-26
 */
public class AppUserMoney extends DataEntity<AppUserMoney> {
	
	private static final long serialVersionUID = 1L;
	private AppUser user;		// 用户ID（APP_USER表主键ID）
	private Double moneyTotal;	// 购物币余额
	private String stauts;		// 购物币使用状态（0：正常  1：禁止使用 ）
	
	public AppUserMoney() {
		super();
	}

	public AppUserMoney(String id){
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
	
	public String getStauts() {
		return stauts;
	}

	public void setStauts(String stauts) {
		this.stauts = stauts;
	}
	
}