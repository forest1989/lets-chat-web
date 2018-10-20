/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsmall.entity.MallProductManage;
import com.thinkgem.jeesite.modules.letsmall.dao.MallProductManageDao;

/**
 * 商品信息管理Service
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Service
@Transactional(readOnly = true)
public class MallProductManageService extends CrudService<MallProductManageDao, MallProductManage> {

	public MallProductManage get(String id) {
		return super.get(id);
	}
	
	public List<MallProductManage> findList(MallProductManage mallProductManage) {
		return super.findList(mallProductManage);
	}
	
	public Page<MallProductManage> findPage(Page<MallProductManage> page, MallProductManage mallProductManage) {
		return super.findPage(page, mallProductManage);
	}
	
	@Transactional(readOnly = false)
	public void save(MallProductManage mallProductManage) {
		super.save(mallProductManage);
	}
	
	@Transactional(readOnly = false)
	public void delete(MallProductManage mallProductManage) {
		super.delete(mallProductManage);
	}
	
}