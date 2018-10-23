/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 收货地址Entity
 * @author tao_yonggang
 * @version 2018-10-23
 */
public class ShoppingAddress extends DataEntity<ShoppingAddress> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID（APP_USER表主键ID）
	private String shopUserName;		// 收货人
	private String phone;		// 收货电话
	private String arear;		// 所在地区
	private String addressDetail;		// 详细地址
	private String isDefault;		// 是否设为默认收货地址（0：是 1：否）
	
	public ShoppingAddress() {
		super();
	}

	public ShoppingAddress(String id){
		super(id);
	}
	
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Length(min=1, max=200, message="收货人长度必须介于 1 和 200 之间")
	public String getShopUserName() {
		return shopUserName;
	}

	public void setShopUserName(String shopUserName) {
		this.shopUserName = shopUserName;
	}
	
	@Length(min=1, max=50, message="收货电话长度必须介于 1 和 50 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=1, max=200, message="所在地区长度必须介于 1 和 200 之间")
	public String getArear() {
		return arear;
	}

	public void setArear(String arear) {
		this.arear = arear;
	}
	
	@Length(min=1, max=200, message="详细地址长度必须介于 1 和 200 之间")
	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	
	@Length(min=0, max=1, message="是否设为默认收货地址（0：是 1：否）长度必须介于 0 和 1 之间")
	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	
}