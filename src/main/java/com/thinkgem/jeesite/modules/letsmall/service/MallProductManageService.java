/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.letsmall.dao.MallProductManageDao;
import com.thinkgem.jeesite.modules.letsmall.entity.HotProductMange;
import com.thinkgem.jeesite.modules.letsmall.entity.MallProductManage;
import com.thinkgem.jeesite.modules.letsmall.entity.ProductSpecifications;

/**
 * 商品信息管理Service
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Service
@Transactional(readOnly = true)
public class MallProductManageService extends CrudService<MallProductManageDao, MallProductManage> {

	public List<MallProductManage> findList(MallProductManage mallProductManage) {
		return super.findList(mallProductManage);
	}
	
	public Page<MallProductManage> findPage(Page<MallProductManage> page, MallProductManage mallProductManage) {
		return super.findPage(page, mallProductManage);
	}
	
	
	public List<ProductSpecifications> getProductSpecList(ProductSpecifications ps){
		return dao.getProductSpecList(ps);
	} 
	
	// 生成商品编码
	public String setProductNo(String productTypeId){
		String numIndex = DateUtils.getDate("MMdd") +  productTypeId;
		String proNum = dao.getProductNo(productTypeId);
		if(proNum != null) {
			String i = proNum.substring(8, proNum.length());
			return numIndex + String.format("%08d", Integer.valueOf(i) + 1);
		}else {
			// 生成该商品分类下的第一件商品编码 格式如下：1024000100000001 （MMdd + 商品分类  + 00000001）
			String num = numIndex + "00000001";
			return num;
			
		}
	}
	@Transactional(readOnly = false)
	public void save(MallProductManage mp) {
		if (mp.getIsNewRecord()){
			mp.preInsert();
			mp.setProductNo(this.setProductNo(mp.getProductTypeId()));
			dao.insert(mp);
		}else{
			mp.preUpdate();
			// 如果商品更改商品分类，重新生成商品编码
			if(!mp.getOldProductTypeId().equals(mp.getProductTypeId())) {
				mp.setProductNo(this.setProductNo(mp.getProductTypeId()));
			}
			dao.update(mp);
			// 先全部删除商品规格
			dao.deleteProductSpec(mp.getId());
		}
		
		// 插入产品规格数据
		int num = 0;
		if(mp.getProSpecList().size() > 0) {
			for(ProductSpecifications e : mp.getProSpecList()) {
				if(StringUtils.isNotBlank(e.getSpecName()) && e.getSpecPrice() != null) {
					num = num + 1;
					// 商品ID
					if(StringUtils.isBlank(e.getId())) {
						e.preInsert();
					}
					e.setProductId(mp.getId());
					e.setSort(num);
					dao.insertProductSpec(e);
				}
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(MallProductManage mp) {
		// 删除商品规格
		dao.updatePsDelFlag(mp.getId());
		super.delete(mp);
	}
	
	@Transactional(readOnly = false)
	public void insertProductSpec(ProductSpecifications ps) {
		dao.insertProductSpec(ps);
	}
	
	public void batchUpdateStatus(List<String> list, String stauts) {
		dao.batchUpdateStatus(list, stauts);
	}

	public void batchSaveHot(List<String> asList) {
		 dao.deleteHotbyId(asList);
		for (int j = 0; j < asList.size(); j++) {
			String productId=asList.get(j).toString();
			dao.batchSaveHot(productId);
		}
	}
	public void batchDeleHot(List<String> asList) {
		dao.deleteHotbyId(asList);
	}
}