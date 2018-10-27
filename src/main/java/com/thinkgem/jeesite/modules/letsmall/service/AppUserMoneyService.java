/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsmall.entity.AppUserMoney;
import com.thinkgem.jeesite.modules.letsmall.dao.AppUserMoneyDao;

/**
 * 购物币管理Service
 * @author forest
 * @version 2018-10-26
 */
@Service
@Transactional(readOnly = true)
public class AppUserMoneyService extends CrudService<AppUserMoneyDao, AppUserMoney> {

	public AppUserMoney get(String id) {
		return super.get(id);
	}
	
	public List<AppUserMoney> findList(AppUserMoney appUserMoney) {
		return super.findList(appUserMoney);
	}
	
	public Page<AppUserMoney> findPage(Page<AppUserMoney> page, AppUserMoney appUserMoney) {
		return super.findPage(page, appUserMoney);
	}
	
	@Transactional(readOnly = false)
	public void save(AppUserMoney appUserMoney) {
		super.save(appUserMoney);
	}
	
	@Transactional(readOnly = false)
	public void delete(AppUserMoney appUserMoney) {
		super.delete(appUserMoney);
	}
	
	@Transactional(readOnly = false)
	public void updateStatus(String stauts, String id) {
		dao.updateStatus(stauts, id);
	}
	
}