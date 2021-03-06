/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jivesoftware.smack.XMPPConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.JedisUtils;
import com.thinkgem.jeesite.modules.letsapi.dao.AppUserDao;
import com.thinkgem.jeesite.modules.letsapi.dao.HomeadInfoDao;
import com.thinkgem.jeesite.modules.letsapi.dao.MomentsInfoDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUserLoginLog;
import com.thinkgem.jeesite.modules.letsapi.entity.AreaPhone;
import com.thinkgem.jeesite.modules.letsapi.entity.FriendInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.HomeadInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MomentsInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.OfflineMessage;
import com.thinkgem.jeesite.modules.letsapi.utils.JsonUtils;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UserUtils;
import com.thinkgem.jeesite.modules.letsim.utils.OpenFireActionUtil;
import com.thinkgem.jeesite.modules.sys.dao.AreaDao;

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
	@Autowired
	private AreaDao areaDao;
	@Autowired
	private MomentsInfoDao momentsInfoDao;
	@Autowired
	private HomeadInfoDao homeadInfoDao;
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
			appVo = appUserDao.getByLoginNameRegist(user);
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
			        XMPPConnection XMPPConnection=smack.getXMPPConnection();
			        if(XMPPConnection!=null) {
			        	smack.register(user.getLoginName(), user.getPassword(), map,XMPPConnection);
					    smack.destory();
					    rtn.setMessage("注册成功");
						rtn.setCode("0000");
	                }else {
	                	appUserDao.deleteReg(user.getLoginName());
	                	rtn.setMessage("服务器出故障了,请稍后再试!!!");
						rtn.setCode("1019");
	                }
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
						 XMPPConnection XMPPConnection=smack.getXMPPConnection();
					        if(XMPPConnection!=null) {
					        	smack.loginOpenfier(user.getLoginName(), oldPassWord);
						        smack.changePassword(newPassWord, XMPPConnection);
						        smack.destory();					
								rtn.setMessage("密码修改成功");
								rtn.setCode("0000");
			                }else {
			                	appUserDao.updateByloginName(new AppUser(oldPassWord, UserUtils.getUser(request).getUserId()));
			                	rtn.setMessage("服务器出故障了,请稍后再试!!!");
								rtn.setCode("1019");
			                }
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
	
	/**
	 * @author zhai_shaobo
	 * app获取用户好友信息列表
	 */
	public RtnData selectFriend(HttpServletRequest request, AppUser user) {
		RtnData rtn = new RtnData();
		List<FriendInfo> userres = new ArrayList<FriendInfo>();
		try {
			userres = appUserDao.selectFriend(user);
			if (userres != null) {
				rtn.setData(userres);
				rtn.setMessage("好友列表信息成功!");
				rtn.setCode("0000");
			} else {
				rtn.setData(userres);
				rtn.setMessage("未查询到好友信息!");
				rtn.setCode("0000");
			}
		} catch (Exception e) {
			rtn.setMessage("好友列表信息异常!");
			rtn.setCode("500");
			logger.error("selectFriend---好友列表信息异常"+e.getMessage());
		}
		return rtn;
	}
	
	/**
	 * @author zhai_shaobo
	 * app个性化定制好友信息(用户可以对好友个性化其 loginname，phone，photo)
	 */
	public RtnData customizationFriend(HttpServletRequest request, FriendInfo user) {
		RtnData rtn = new RtnData();
		FriendInfo selectFfiendInfo = null;
		int i = 0;
		int insertI = 0;
		int updateI = 0;
		try {
			selectFfiendInfo = appUserDao.selectcust(user);
			if (selectFfiendInfo != null) {
				insertI = appUserDao.updatecust(user);
				if (insertI>0) {
					rtn.setMessage("个性化定制新增好友信息成功!");
					rtn.setCode("0000");
				} else {
					rtn.setMessage("个性化定制新增好友信息失败!");
					rtn.setCode("500");
				}
			} else {
				updateI = appUserDao.customizationFriend(user);
				if (updateI > 0) {
					rtn.setMessage("个性化定制修改好友信息成功!");
					rtn.setCode("0000");
				} else {
					rtn.setMessage("个性化定制修改好友信息失败!");
					rtn.setCode("500");
				}
			}
		} catch (Exception e) {
			rtn.setMessage("个性化定制好友信息异常!");
			rtn.setCode("500");
			logger.error("customizationFriend---个性化定制好友信息异常"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * @param listmp
	 * @return 个性化定制用户头像图片上传
	 */
	@Transactional
	public RtnData uploadFilecust(HttpServletRequest request, Map<String, Object> mp) {
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
			FriendInfo usercust = new FriendInfo();
			//用userid  查询出用户loginname (因为好友定制信息表是用loginname)
			String loginName = appUserDao.getuser(UserUtils.getUser(request).getUserId());
			usercust.setRemarksPhoto(photo);
			usercust.setLoginName(loginName);
			String friendLoginName = request.getParameter("friendLoginName");
			usercust.setFriendLoginName(friendLoginName);
			rtn = customizationFriend(request,usercust);
//			int n = appUserDao.updateByloginName(user);
			if(rtn.getCode().equals("0000")){
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
	/**
	 * @author zhai_shaobo
	 * 获取好友信息 可以多个好友信息  不关openfier
	 */
	public RtnData selectFriendInfos(HttpServletRequest request, FriendInfo user) {
		RtnData rtn = new RtnData();
		List<FriendInfo> userres = new ArrayList<FriendInfo>();
		try {
			String friendLoginName = user.getLoginName();//好友loginName拼接字符串
			String loginName = appUserDao.getuser(UserUtils.getUser(request).getUserId());
			String fln[] = friendLoginName.split(",");
			for (int i = 0; i < fln.length; i++) {
				FriendInfo usersIn = new FriendInfo();
				FriendInfo usersOut = null;
				usersIn.setLoginName(loginName);
				usersIn.setFriendLoginName(fln[i]);
				usersOut = appUserDao.selectFriendInfos(usersIn);
				if (usersOut!=null) {
					userres.add(usersOut);
				}
			}
			if (userres.size()>0) {
				rtn.setData(userres);
			}else {
				rtn.setData(new ArrayList<FriendInfo>());
			}
			rtn.setMessage("好友信息成功!");
			rtn.setCode("0000");
		} catch (Exception e) {
			rtn.setMessage("好友信息异常!");
			rtn.setCode("500");
			logger.error("selectFriend---好友信息异常"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * @author zhai_shaobo
	 * 	注册成功之后 初始化生成对应购物币账户
	 */
	public int shopAccount(HttpServletRequest request,AppUser user) {
		int i = 0;
		try {
			i = appUserDao.shopAccount(user);
		} catch (Exception e) {
			i=0;
		}
		return i;
	}
	
	/**
	 * 记录用户登录日志
	 * @param e
	 * @return
	 */
	public int insertUserLoginLog(AppUserLoginLog e) {
		return dao.insertUserLoginLog(e);
	}
	
	/**
	 * 获取用户登录日志
	 * @param e
	 * @return
	 */
	public AppUserLoginLog getUserLoginLog(AppUserLoginLog e) {
		return dao.getUserLoginLog(e);
	}
	
	public OfflineMessage getOfflineMesg(OfflineMessage e) {
		return dao.getOfflineMesg(e);
	}
	/**
	 * 获取首页广告
	 * @param e
	 * @return
	 */
	public RtnData getHomeAd() {
		RtnData rtn = new RtnData();
		Map<String,Object> retMap = new HashMap<String, Object>();
		List<HomeadInfo> list=null;
		try {
			list=homeadInfoDao.getHomeAd();
			if(list != null && list.size() > 0) {
				retMap.put("content", list.get(0).getContent());// 广告页面地址
				retMap.put("openurl", list.get(0).getOpenurl());// 要跳转的页面
				retMap.put("contentsize", list.get(0).getContentsize());// 图片尺寸
				retMap.put("duration", list.get(0).getDuration());// 广告持续时间
				rtn.setData(retMap);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1053");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * 发送朋友圈
	 * @param e
	 * @return
	 */
	public int insertSendMoment(MomentsInfo momentsInfo) {
		return momentsInfoDao.insert(momentsInfo);
	}
	/**  
	* <p>Description:查询区域 </p>      
	* @author tao_yonggang  
	* @date 2018年11月21日  
	* @version 1.0  
	*/ 
	public RtnData getAreaForPhone(AreaPhone a) {
		RtnData rtn = new RtnData();
		List<AreaPhone> list=null;
		try {
			//从redis缓存中取
			List<AreaPhone> listJedis=null;
			try {
				listJedis = JedisUtils.getLists("AreaPid_"+a.getParentId());
			} catch (Exception e) {//从redis缓存中取连接不到就从数据库查
				list=areaDao.getAreaForPhone(a);
				if(list != null && list.size() > 0) {
					rtn.setData(list);
					rtn.setCode("0000");
					rtn.setMessage("查询成功");
				}else {
					rtn.setCode("1055");
					rtn.setMessage("暂无数据");
				}
				return rtn;
			}
			if(listJedis != null) {
				rtn.setData(listJedis);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {//从redis缓存中取没有就查到了再加到缓存中去
				list=areaDao.getAreaForPhone(a);
				if(list != null && list.size() > 0) {
					JedisUtils.setLists("AreaPid_"+a.getParentId(), list);
					rtn.setData(list);
					rtn.setCode("0000");
					rtn.setMessage("查询成功");
				}else {
					rtn.setCode("1055");
					rtn.setMessage("暂无数据");
				}
			}
			
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * 查询朋友圈
	 * zhaishaobo
	 * @param e
	 * @return
	 */
	public List<MomentsInfo> findMoments(MomentsInfo momentsInfo) {
		String mark = null;
		List<MomentsInfo> res = null;
		//根据手机端传入的查询标记 调用不同dao
		try {
			mark = momentsInfo.getSelectMark();
			if (mark.equals("0")) {
				res = momentsInfoDao.findMoments0(momentsInfo);//刚进来获取最新十条
				logger.info("查询结果------"+res.size());
			}else if (mark.equals("1")) {
				res = momentsInfoDao.findMoments1(momentsInfo);//下拉获取时间轴往上所有
				logger.info("查询结果------"+res.size());
			}else if (mark.equals("2")) {
				res = momentsInfoDao.findMoments2(momentsInfo);//上滑 查询下一页
				logger.info("查询结果------"+res.size());
			}
		} catch (Exception e) {
			logger.error("查询异常------"+e.getMessage());
			e.printStackTrace();
		}
		return res != null?res:null;
	}
	/**
	 * 查询我的相册
	 * zhaishaobo
	 * @param e
	 * @return
	 */
	public List<MomentsInfo> findMyMoments(MomentsInfo momentsInfo) {
		List<MomentsInfo> res = null;
		try {
			res = momentsInfoDao.findMyMoments(momentsInfo);
		} catch (Exception e) {
			logger.error("查询我的相册异常------"+e.getMessage());
			e.printStackTrace();
		}
		return res != null?res:null;
	}
}