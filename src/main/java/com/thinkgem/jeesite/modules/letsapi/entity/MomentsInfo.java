/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;

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
	
}