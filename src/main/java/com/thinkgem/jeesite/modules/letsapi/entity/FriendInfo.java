package com.thinkgem.jeesite.modules.letsapi.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class FriendInfo extends DataEntity<FriendInfo> {

	/**
	 * 好友信息实体 by zhai_shaobo
	 */
	private static final long serialVersionUID = 1L;
	private String loginName; // 用户登录名
	private String photo; // 好友图像
	private String nickName; //好友昵称
	private String sex; // 好友性别
	private String phone; // 好友性别
	private String areaId;//好友地区编码
	
	private String remarksNickName; // 好友个性化定制昵称
	private String remarksPhone; // 好友个性化手机号
	private String remarksPhoto; // 好友个性化图像
	private String friendLoginName;//好友用户名称
	
	//标记  是否个性化定制好友信息  (前端传过来 用于区分是 新增好友信息 还是 修改好友个性化信息)
	private String isCustomization;//(0:不是个性化定制好友信息；1：是个性化定制好友信息)
	
	public FriendInfo() {
		super();
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getRemarksNickName() {
		return remarksNickName;
	}
	public void setRemarksNickName(String remarksNickName) {
		this.remarksNickName = remarksNickName;
	}
	public String getRemarksPhone() {
		return remarksPhone;
	}
	public void setRemarksPhone(String remarksPhone) {
		this.remarksPhone = remarksPhone;
	}
	public String getRemarksPhoto() {
		return remarksPhoto;
	}
	public void setRemarksPhoto(String remarksPhoto) {
		this.remarksPhoto = remarksPhoto;
	}
	public String getFriendLoginName() {
		return friendLoginName;
	}
	public void setFriendLoginName(String friendLoginName) {
		this.friendLoginName = friendLoginName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getIsCustomization() {
		return isCustomization;
	}
	public void setIsCustomization(String isCustomization) {
		this.isCustomization = isCustomization;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public FriendInfo(String loginName, String photo, String nickName, String sex, String areaId) {
		super();
		this.loginName = loginName;
		this.photo = photo;
		this.nickName = nickName;
		this.sex = sex;
		this.areaId = areaId;
	}
	@Override
	public String toString() {
		return "FriendInfo [loginName=" + loginName + ", photo=" + photo + ", nickName=" + nickName + ", sex=" + sex
				+ ", phone=" + phone + ", areaId=" + areaId + ", remarksNickName=" + remarksNickName + ", remarksPhone="
				+ remarksPhone + ", remarksPhoto=" + remarksPhoto + ", friendLoginName=" + friendLoginName
				+ ", isCustomization=" + isCustomization + "]";
	}
	
}
