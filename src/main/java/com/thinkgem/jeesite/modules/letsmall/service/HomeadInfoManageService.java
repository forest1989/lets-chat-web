/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsmall.entity.HomeadInfoManage;
import com.thinkgem.jeesite.modules.letsmall.dao.HomeadInfoManageDao;

/**
 * 广告页配置Service
 * @author tao_yonggang
 * @version 2018-11-19
 */
@Service
@Transactional(readOnly = true)
public class HomeadInfoManageService extends CrudService<HomeadInfoManageDao, HomeadInfoManage> {

	public HomeadInfoManage get(String id) {
		return super.get(id);
	}
	
	public List<HomeadInfoManage> findList(HomeadInfoManage homeadInfoManage) {
		return super.findList(homeadInfoManage);
	}
	
	public Page<HomeadInfoManage> findPage(Page<HomeadInfoManage> page, HomeadInfoManage homeadInfoManage) {
		return super.findPage(page, homeadInfoManage);
	}
	
	@Transactional(readOnly = false)
	public void save(HomeadInfoManage homeadInfoManage) {
		super.save(homeadInfoManage);
	}
	
	@Transactional(readOnly = false)
	public void delete(HomeadInfoManage homeadInfoManage) {
		super.delete(homeadInfoManage);
	}
	
}