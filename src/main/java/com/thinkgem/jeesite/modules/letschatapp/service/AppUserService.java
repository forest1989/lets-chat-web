/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letschatapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letschatapp.entity.AppUser;
import com.thinkgem.jeesite.modules.letschatapp.dao.AppUserDao;

/**
 * 用户信息Service
 * @author tao_yonggang
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class AppUserService extends CrudService<AppUserDao, AppUser> {
	@Autowired
    private AppUserDao appUserDao;
	public AppUser get(String id) {
		return super.get(id);
	}
	
	public List<AppUser> findList(AppUser appUser) {
		return super.findList(appUser);
	}
	
	public Page<AppUser> findPage(Page<AppUser> page, AppUser appUser) {
		return super.findPage(page, appUser);
	}
	
	@Transactional(readOnly = false)
	public void save(AppUser appUser) {
		super.save(appUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(AppUser appUser) {
		super.delete(appUser);
	}
	/**
	 * @param user登录
	 * @return
	 */
	public AppUser login(AppUser user) {
		return appUserDao.getByLoginName(user);
	}
	/**
	 * @author zhai_shaobo
	 * app注册service
	 */
	public AppUser register(List<Map<String,Object>> orderIds) {
		AppUser appVo = new AppUser();
		String id = null;
		try {
			//注册前先验证 用户名是否可用。1 不能重复
			Map<String, String> parmMapin = null;
			parmMapin.put("loginName", (String) orderIds.get(0).get("loginName"));
			Map<String,String> res = appUserDao.userLoginName(parmMapin);
			if (res.get("login_name") == null || res.get("login_name").equals("")) {
				appVo.setMessage("用户名已被注册!");
				appVo.setCode("8401");
				return appVo;
			}
		} catch (Exception e) {
			appVo.setMessage("用户名已被注册!");
			appVo.setCode("8401");
			return appVo;
		}
		try {
			if (orderIds.size()>0 && orderIds != null) {
				id = appUserDao.getid();
				Map<String, Object> parmMap = new HashMap<String, Object>();
				parmMap.put("id", id);//用户名(登录名称)
				parmMap.put("loginName", (String) orderIds.get(0).get("loginName"));//用户名(登录名称)
				parmMap.put("passWord", (String) orderIds.get(0).get("passWord"));//(密码)
				parmMap.put("photo", (String) orderIds.get(0).get("photo"));//图像路径
				parmMap.put("name", (String) orderIds.get(0).get("name"));//用户姓名
				parmMap.put("nickName", (String) orderIds.get(0).get("nickName"));//用户昵称
				parmMap.put("sex", (String) orderIds.get(0).get("sex"));//用户性别
				parmMap.put("phone", (String) orderIds.get(0).get("phone"));//用户电话号码
				parmMap.put("email", (String) orderIds.get(0).get("email"));//用户邮箱
				/** 区域 */
				parmMap.put("areaid", (String) orderIds.get(0).get("areaid"));//用户地区编码
				parmMap.put("remarks", (String) orderIds.get(0).get("remarks"));//用户地区编码
				
				int i = appUserDao.register(parmMap);
				if (i>0) {
					appVo.setMessage("注册成功");
					appVo.setCode("0000");
				}else {
					appVo.setMessage("注册失败");
					appVo.setCode("8401");
					return appVo;
				}
			}
		} catch (Exception e) {
			appVo.setMessage("注册异常");
			appVo.setCode("8401");
			e.printStackTrace();
			logger.error("注册出现异常"+e.getMessage());
			System.out.println("注册出现异常"+e.getMessage());
		}
		return appVo;
	}
}