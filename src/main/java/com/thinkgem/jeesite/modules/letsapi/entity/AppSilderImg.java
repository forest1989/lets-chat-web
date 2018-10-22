/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * app轮播图Entity
 * @author tao_yonggang
 * @version 2018-10-22
 */
public class AppSilderImg extends DataEntity<AppSilderImg> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// 轮播图片地址
	private String imgStatus;		// 图片状态（1：前端显示  2：不显示）
	
	public AppSilderImg() {
		super();
	}

	public AppSilderImg(String id){
		super(id);
	}

	@Length(min=1, max=500, message="轮播图片地址长度必须介于 1 和 500 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Length(min=1, max=64, message="图片状态（1：前端显示  2：不显示）长度必须介于 1 和 64 之间")
	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}
	
}