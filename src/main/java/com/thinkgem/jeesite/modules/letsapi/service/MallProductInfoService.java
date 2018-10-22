/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsapi.dao.MallProductInfoDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppSilderImg;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 商品信息Service
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Service
@Transactional(readOnly = true)
public class MallProductInfoService extends CrudService<MallProductInfoDao, MallProductInfo> {
	
	@Autowired
	private MallProductInfoDao mallProductInfoDao;
	@Autowired
	private DictDao dictDao;
	
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

	/**
	 * @param 首页轮播图查询
	 * @param listmp
	 * @return
	 */
	public RtnData getAppSilderImg() {
		RtnData rtn = new RtnData();
		List<AppSilderImg> listImg = null;
		try {
			listImg = mallProductInfoDao.getAppSilderImg();
			if(listImg != null) {
				if(listImg.size() > 0) {
					rtn.setData(listImg);
					rtn.setCode("0000");
					rtn.setMessage("首页轮播图查询成功");
				}else {
					rtn.setCode("1016");
					rtn.setMessage("暂无数据");
				}
			}else {
				rtn.setCode("1017");
				rtn.setMessage("首页轮播图查询失败");
			}
			
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("首页轮播图查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * 获取字典数据模块
	 * @return
	 */
	public RtnData getDict(Dict dic) {
		RtnData rtn = new RtnData();
		List<Dict> list=null;
		try {
			list=dictDao.findList(dic);
			if(list != null && list.size() > 0) {
				rtn.setData(list);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1020");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}
	
}