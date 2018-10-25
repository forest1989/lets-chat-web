/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 订单信息详情Entity
 * @author zhaishaobo
 * @version 2018-10-24
 */
public class MallOrderInfo extends DataEntity<MallOrderInfo> {
	
	private static final long serialVersionUID = 1L;
	private String orderId;		// 订单ID(MALL_ORDER主键ID)
	private String productId;		// 商品ID
	private Long productCount;		// 购买数量
	private String productSpecId;		// 规格id
	
	public MallOrderInfo() {
		super();
	}

	public MallOrderInfo(String id){
		super(id);
	}

	@Length(min=1, max=64, message="订单ID(MALL_ORDER主键ID)长度必须介于 1 和 64 之间")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	@Length(min=1, max=64, message="商品ID长度必须介于 1 和 64 之间")
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@NotNull(message="购买数量不能为空")
	public Long getProductCount() {
		return productCount;
	}

	public void setProductCount(Long productCount) {
		this.productCount = productCount;
	}
	
	@Length(min=1, max=64, message="规格id长度必须介于 1 和 64 之间")
	public String getProductSpecId() {
		return productSpecId;
	}

	public void setProductSpecId(String productSpecId) {
		this.productSpecId = productSpecId;
	}
	
}