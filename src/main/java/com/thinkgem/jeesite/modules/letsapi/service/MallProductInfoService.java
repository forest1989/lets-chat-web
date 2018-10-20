/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.dao.MallProductInfoDao;

/**
 * 商品信息Service
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Service
@Transactional(readOnly = true)
public class MallProductInfoService extends CrudService<MallProductInfoDao, MallProductInfo> {

	public MallProductInfo get(String id) {
		return super.get(id);
	}
	
	public List<MallProductInfo> findList(MallProductInfo mallProductInfo) {
		return super.findList(mallProductInfo);
	}
	
	public Page<MallProductInfo> findPage(Page<MallProductInfo> page, MallProductInfo mallProductInfo) {
		return super.findPage(page, mallProductInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(MallProductInfo mallProductInfo) {
		super.save(mallProductInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(MallProductInfo mallProductInfo) {
		super.delete(mallProductInfo);
	}
	
}