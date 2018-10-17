/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letschatmanage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letschatmanage.entity.AppUserManage;
import com.thinkgem.jeesite.modules.letschatmanage.dao.AppUserManageDao;

/**
 * 用户信息Service
 * @author tao_yonggang
 * @version 2018-10-17
 */
@Service
@Transactional(readOnly = true)
public class AppUserManageService extends CrudService<AppUserManageDao, AppUserManage> {

	public AppUserManage get(String id) {
		return super.get(id);
	}
	
	public List<AppUserManage> findList(AppUserManage appUserManage) {
		return super.findList(appUserManage);
	}
	
	public Page<AppUserManage> findPage(Page<AppUserManage> page, AppUserManage appUserManage) {
		return super.findPage(page, appUserManage);
	}
	
	@Transactional(readOnly = false)
	public void save(AppUserManage appUserManage) {
		super.save(appUserManage);
	}
	
	@Transactional(readOnly = false)
	public void delete(AppUserManage appUserManage) {
		super.delete(appUserManage);
	}
	
}