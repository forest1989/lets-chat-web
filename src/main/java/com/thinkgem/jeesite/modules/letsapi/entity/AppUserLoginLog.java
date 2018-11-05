package com.thinkgem.jeesite.modules.letsapi.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class AppUserLoginLog extends DataEntity<AppUserLoginLog>{


	private static final long serialVersionUID = 1L;
	
	private String loginName;
	
	private String imei;
	
	private String deviceType;

	public AppUserLoginLog() {}
	
	public AppUserLoginLog(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	
}
