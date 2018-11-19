/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 广告页配置Entity
 * @author tao_yonggang
 * @version 2018-11-19
 */
public class HomeadInfoManage extends DataEntity<HomeadInfoManage> {
	
	private static final long serialVersionUID = 1L;
	private String content;		// 广告页面地址
	private String openurl;		// 要跳转的页面
	private String contentsize;		// 图片尺寸
	private String duration;		// 广告持续时间
	private Date beginDate;		// 开始时间
	private Date endDate;		// 结束时间
	
	public HomeadInfoManage() {
		super();
	}

	public HomeadInfoManage(String id){
		super(id);
	}

	@Length(min=0, max=255, message="广告页面地址长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=255, message="要跳转的页面长度必须介于 0 和 255 之间")
	public String getOpenurl() {
		return openurl;
	}

	public void setOpenurl(String openurl) {
		this.openurl = openurl;
	}
	
	@Length(min=0, max=255, message="图片尺寸长度必须介于 0 和 255 之间")
	public String getContentsize() {
		return contentsize;
	}

	public void setContentsize(String contentsize) {
		this.contentsize = contentsize;
	}
	
	@Length(min=0, max=255, message="广告持续时间长度必须介于 0 和 255 之间")
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}