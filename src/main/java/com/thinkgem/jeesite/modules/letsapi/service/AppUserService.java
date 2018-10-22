/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.letsapi.dao.AppUserDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UserUtils;
import com.thinkgem.jeesite.modules.letsim.utils.OpenFireActionUtil;

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
	@Transactional
	public RtnData register(HttpServletRequest request, AppUser user) {
		RtnData rtn = new RtnData();
		AppUser appVo = new AppUser();
		try {
			//注册前先验证 用户名是否可用。1 不能重复
			appVo = appUserDao.getByLoginName(user);
			if (appVo != null) {
				rtn.setMessage("用户名已被注册!");
				rtn.setCode("1018");
			}else {
				int i = appUserDao.register(user);
				if (i > 0) {
					//此處調用openfier真正註冊
					OpenFireActionUtil smack = new OpenFireActionUtil();
			        //创建用户的信息
			        Map<String,String> map = new HashMap<String, String>();
			        map.put("email","");
			        map.put("name", "name");
			        smack.register(user.getLoginName(), user.getPassword(), map,smack.getXMPPConnection());
			        smack.destory();		
					rtn.setMessage("注册成功");
					rtn.setCode("0000");
				}else {
					rtn.setMessage("注册失败");
					rtn.setCode("1019");
				}
			}
		} catch (Exception e) {
			rtn.setMessage("注册异常");
			rtn.setCode("500");
		}
		return rtn;
	}

	/**
	 * @param mp 修改密码
	 * @return tyg
	 */
	@Transactional
	public RtnData updatePassword(HttpServletRequest request, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			String oldPassWord = user.getPassword();
			String newPassWord = user.getNewPassWord();
			AppUser u = appUserDao.getByLoginName(user);//通过账号查出密码判断旧密码是否正确
			if(u != null) {
				if(!u.getPassword().equals(oldPassWord)) {
					rtn.setMessage("您的原密码输入错误");
					rtn.setCode("1011");
				}else {//旧密码是正确的然后通过账号修改新密码
					int n = appUserDao.updateByloginName(new AppUser(newPassWord, UserUtils.getUser(request).getUserId()));
					if(n > 0){
						//此處調用openfier修改密码
						OpenFireActionUtil smack = new OpenFireActionUtil();
						smack.loginOpenfier(user.getLoginName(), oldPassWord);
				        smack.changePassword(newPassWord, smack.getXMPPConnection());
				        smack.destory();					
						rtn.setMessage("密码修改成功");
						rtn.setCode("0000");
					}else {
						rtn.setMessage("密码修改失败");
						rtn.setCode("1012");
					}
				}
			}else {
				rtn.setMessage("您的账号错误");
				rtn.setCode("1013");
			}
		} catch (Exception e) {
			logger.error("openfire修改密码异常------"+e.getMessage());
			rtn.setMessage("修改异常");
			rtn.setCode("500");
			logger.error("修改出现异常"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * @author zhai_shaobo
	 * app注册 成功之后 完善用户信息
	 */
	public RtnData perfect(HttpServletRequest request, AppUser user) {
		RtnData rtn = new RtnData();
		try {
			user.setId(UserUtils.getUser(request).getUserId());
			int i = appUserDao.perfect(user);
			if (i > 0) {
				rtn.setMessage("信息完善成功!");
				rtn.setCode("0000");
			}else {
				rtn.setMessage("信息完善失败!");
				rtn.setCode("1014");
			}
		} catch (Exception e) {
			rtn.setMessage("信息完善异常!");
			rtn.setCode("500");
			logger.error("perfect---信息完善异常"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param listmp
	 * @return tyg
	 */
	@Transactional
	public RtnData updatePhoto(HttpServletRequest request, Map<String, Object> mp) {
		RtnData rtn = new RtnData();
		try {
			String photo = null;
			String saveUrl = (String)mp.get("saveUrl");
			String fileName = (String)mp.get("fileName");
			if(!fileName.contains(".jpg")) {
				fileName = fileName + ".jpg";
			}
			photo = saveUrl + fileName;
			AppUser user = new AppUser();
			user.setId(UserUtils.getUser(request).getUserId());
			user.setPhoto(photo);
			int n = appUserDao.updateByloginName(user);
			if(n > 0){
				rtn.setMessage("图片地址修改成功");
				rtn.setCode("0000");
			}else {
				rtn.setMessage("图片地址失败");
				rtn.setCode("1015");
			}
		} catch (Exception e) {
			rtn.setMessage("修改异常");
			rtn.setCode("500");
			logger.error("修改出现异常"+e.getMessage());
		}
		return rtn;
	}
}