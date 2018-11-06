/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;
import com.thinkgem.jeesite.modules.letsapi.entity.AppUserLoginLog;
import com.thinkgem.jeesite.modules.letsapi.entity.FriendInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.OfflineMessage;

/**
 * 用户信息DAO接口
 * @author tao_yonggang
 * @version 2018-10-16
 */
@MyBatisDao
public interface AppUserDao extends CrudDao<AppUser> {

	/**
	 * @param user
	 * @return
	 */
	AppUser getByLoginName(AppUser user);
	
	/**
	 * @author zhai_shaobo
	 * app注册dao
	 */
	public int register(AppUser user);
	
	/**
	 * @author zhai_shaobo
	 * 查询序列值
	 */
	public String getid();
	
	/**
	 * @author tao_yonggang
	 * 修改密码
	 */
	int updateByloginName(AppUser user);
	
	/**
	 * @author zhai_shaobo
	 * 完善用户信息
	 */
	public int perfect(AppUser user);
	/**
	 * @author zhai_shaobo
	 * 获取用户好友信息列表
	 */
	List<FriendInfo> selectFriend(AppUser user);
	/**
	 * @author zhai_shaobo
	 * app个性化定制好友信息(用户可以对好友个性化其 loginname，phone，photo)
	 */
	public int customizationFriend(FriendInfo user);
	/**
	 * @author zhai_shaobo
	 * app个性化定制好友信息修改个性化定制信息
	 */
	public int updatecust(FriendInfo user);
	
	/**
	 * @author zhai_shaobo
	 *  app查询好友定制信息 用于判断是新增个性化定制信息 还是 修改个性化定制信息  
	 */
	public FriendInfo selectcust(FriendInfo user);

	/**
	 * @author zhai_shaobo
	 *  根据userid 查询 loginname
	 */
	String getuser(String userid);
	/**
	 * @author zhai_shaobo
	 * 获取好友信息 可以多个好友信息  不关openfier
	 */
	FriendInfo selectFriendInfos(FriendInfo user);
	/**
	 * @author tao_yonggang
	 * 查询是否存在改用户 注册用
	 */
	AppUser getByLoginNameRegist(AppUser user);

	/**
	 * @param loginName
	 */
	void deleteReg(String loginName);
	/**
	 * @param 注册成功 初始化购物币账户
	 */
	int shopAccount(AppUser user);
	
	/**
	 * 记录用户登录日志
	 * @param e
	 * @return
	 */
	int insertUserLoginLog(AppUserLoginLog e);
	
	/**
	 * 获取用户登录日志
	 * @param e
	 * @return
	 */
	AppUserLoginLog getUserLoginLog(AppUserLoginLog e);
	
	/**
	 * 获取离线消息信息
	 * @param e
	 * @return
	 */
	OfflineMessage getOfflineMesg(OfflineMessage e);

}