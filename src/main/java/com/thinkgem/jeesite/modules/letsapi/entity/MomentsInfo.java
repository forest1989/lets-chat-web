/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发朋友圈Entity
 * @author tao_yonggang
 * @version 2018-11-15
 */
public class MomentsInfo extends DataEntity<MomentsInfo> {
	
	private static final long serialVersionUID = 1L;
	private String userName;		// 用户名
	private String textContents;		// 文本内容
	private String imgContents;		// 图片内容
	private String sendAddress;		// 位置
	private String moentId;//朋友圈id
	
	private String timeBase;//时间轴
	private String selectMark;//查询标记(0:刚进来最新10条;1:下拉获取时间轴往上所有；2:上滑 查询下一页)
	
	private String remarksNickName; // 好友个性化定制昵称
	private String remarksPhoto; // 好友个性化图像
	private String nickName; //好友昵称
	private String photo; // 好友图像
	
	
	private String pageNo;//当前页
	public MomentsInfo() {
		super();
	}

	public MomentsInfo(String id){
		super(id);
	}

	@Length(min=0, max=255, message="用户名长度必须介于 0 和 255 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=2000, message="文本内容长度必须介于 0 和 2000 之间")
	public String getTextContents() {
		return textContents;
	}

	public void setTextContents(String textContents) {
		this.textContents = textContents;
	}
	
	@Length(min=0, max=2000, message="图片内容长度必须介于 0 和 2000 之间")
	public String getImgContents() {
		return imgContents;
	}

	public void setImgContents(String imgContents) {
		this.imgContents = imgContents;
	}
	
	@Length(min=0, max=255, message="位置长度必须介于 0 和 255 之间")
	public String getSendAddress() {
		return sendAddress;
	}

	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}

	public String getMoentId() {
		return moentId;
	}

	public void setMoentId(String moentId) {
		this.moentId = moentId;
	}

	public String getTimeBase() {
		return timeBase;
	}

	public void setTimeBase(String timeBase) {
		this.timeBase = timeBase;
	}

	public String getSelectMark() {
		return selectMark;
	}

	public void setSelectMark(String selectMark) {
		this.selectMark = selectMark;
	}

	public String getRemarksNickName() {
		return remarksNickName;
	}

	public void setRemarksNickName(String remarksNickName) {
		this.remarksNickName = remarksNickName;
	}
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRemarksPhoto() {
		return remarksPhoto;
	}

	public void setRemarksPhoto(String remarksPhoto) {
		this.remarksPhoto = remarksPhoto;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	
}