/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.utils.UserUtils;
import com.thinkgem.jeesite.modules.letsim.utils.OpenFireActionUtil;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.letsapi.dao.AppUserDao;

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
	@Transactional
	public AppUser register(HttpServletRequest request,List<Map<String,Object>> orderIds) {
		AppUser appVo = new AppUser();
		AppUser appVores = new AppUser();
		String id = null;
		try {
			//注册前先验证 用户名是否可用。1 不能重复
			Map<String, String> parmMapin = null;
			appVo.setId(UserUtils.getUser(request).getUserId());
			appVores = appUserDao.getByLoginName(appVo);
			if (appVores!=null) {
				appVo.setMessage("用户名已被注册!");
				appVo.setCode("0001");
				return appVo;
			}
		} catch (Exception e) {
			appVo.setMessage("用户名已被注册!");
			appVo.setCode("8401");
			return appVo;
		}
		try {
			if (orderIds.size()>0 && orderIds != null) {
				/*id = appUserDao.getid();*/
				Map<String, Object> parmMap = new HashMap<String, Object>();
				parmMap.put("id", IdGen.uuid());//用户表唯一id
				parmMap.put("loginName", (String) orderIds.get(0).get("loginName"));//用户名(登录名称)
				parmMap.put("passWord", (String) orderIds.get(0).get("passWord"));//(密码)
				
				int i = appUserDao.register(parmMap);
				if (i>0) {
					//此處調用openfier真正註冊
					OpenFireActionUtil smack = new OpenFireActionUtil();
			        //创建用户的信息
			        Map<String,String> map = new HashMap<String, String>();
			        map.put("email","");
			        map.put("name", "name");
			        smack.register((String) orderIds.get(0).get("loginName"),(String) orderIds.get(0).get("passWord"),map,smack.getXMPPConnection());
			        smack.destory();					
					appVo.setMessage("注册成功");
					appVo.setCode("0000");
				}else {
					appVo.setMessage("注册失败");
					appVo.setCode("8401");
					return appVo;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("openfire注册异常------"+e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			appVo.setMessage("注册异常");
			appVo.setCode("8401");
		}
		return appVo;
	}

	/**
	 * @param mp 修改密码
	 * @return tyg
	 */
	@Transactional
	public AppUser updatePassword(HttpServletRequest request,List<Map<String,Object>> mp) {
		AppUser appVo = new AppUser();
		try {
			String oldPassWord=(String)mp.get(0).get("oldPassWord");
			String newPassWord=(String)mp.get(0).get("newPassWord");
			AppUser userold=new AppUser();
			userold.setId(UserUtils.getUser(request).getUserId());
			AppUser s= appUserDao.getByLoginName(userold);//通过账号查出密码判断旧密码是否正确
			if(s!=null) {
				if(!s.getPassword().equals(oldPassWord)) {
					appVo.setMessage("您的旧密码输入错误");
					appVo.setCode("8401");
				}else {//旧密码是正确的然后通过账号修改新密码
					AppUser user=new AppUser(UserUtils.getUser(request).getUserId(), newPassWord);
					int n=appUserDao.updateByloginName(user);
					if(n>0){
						//此處調用openfier修改密码
						OpenFireActionUtil smack = new OpenFireActionUtil();
						smack.loginOpenfier((String)mp.get(0).get("loginName"), oldPassWord);
				        smack.changePassword(newPassWord, smack.getXMPPConnection());
				        smack.destory();					
						appVo.setMessage("密码修改成功");
						appVo.setCode("0000");
					}else {
						appVo.setMessage("密码修改失败");
						appVo.setCode("8401");
					}
				}
			}else {
				appVo.setMessage("您的账号错误");
				appVo.setCode("8401");
			}
		} catch (Exception e) {
			logger.error("openfire修改密码异常------"+e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			appVo.setMessage("修改异常");
			appVo.setCode("8401");
			logger.error("修改出现异常"+e.getMessage());
		}
		return appVo;
	}
	/**
	 * @author zhai_shaobo
	 * app注册 成功之后 完善用户信息
	 */
	public AppUser perfect(HttpServletRequest request,List<Map<String,Object>> orderIds) {
		AppUser appVo = new AppUser();
		AppUser user = new AppUser();
		Area area = new Area();
		try {
			area.setId((String) orderIds.get(0).get("areaid"));
			user.setArea(area);
			user.setId(UserUtils.getUser(request).getUserId());;
			user.setNickName((String) orderIds.get(0).get("nickName"));
			user.setPhone((String) orderIds.get(0).get("phone"));
			user.setPhoto((String) orderIds.get(0).get("photo"));
			int i = appUserDao.perfect(user);
			if (i>=1) {
				appVo.setMessage("信息完善成功!");
				appVo.setCode("0000");
			}else {
				appVo.setMessage("信息完善失败!");
				appVo.setCode("8401");
			}
		} catch (Exception e) {
			appVo.setMessage("信息完善异常!");
			appVo.setCode("8401");
			e.printStackTrace();
			logger.error("perfect---信息完善异常"+e.getMessage());
			return appVo;
		}
		return appVo;
	}

	/**
	 * @param listmp
	 * @return tyg
	 */
	@Transactional
	public AppUser updatePhoto(HttpServletRequest request,List<Map<String, Object>> mp) {
		AppUser appVo = new AppUser();
		try {
			String photo=null;
			String saveUrl=(String)mp.get(0).get("saveUrl");
			String fileName=(String)mp.get(0).get("fileName");
			String loginName=(String)mp.get(0).get("loginName");
			if(!fileName.contains(".jpg")) {
				fileName=fileName+".jpg";
			}
			photo=saveUrl+fileName;
			AppUser user=new AppUser();
			user.setId(UserUtils.getUser(request).getUserId());
			user.setPhoto(photo);
			int n=appUserDao.updateByloginName(user);
			if(n>0){
				appVo.setMessage("图片地址修改成功");
				appVo.setCode("0000");
			}else {
				appVo.setMessage("图片地址失败");
				appVo.setCode("8401");
			}
		} catch (Exception e) {
			appVo.setMessage("修改异常");
			appVo.setCode("8401");
			logger.error("修改出现异常"+e.getMessage());
		}
		return appVo;
	}
}