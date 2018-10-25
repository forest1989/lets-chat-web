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
	
	//订单列表查询 返参添加
	/** 商品信息  */
	private String productName;//商品名称
	private String productDetaill;//商品简介
	private String stockNum;//商品库存数量
	private String productIco1;//商品图标
	/** 规格信息 */
	private String specName;//规格名称
	private String specPrice;//规格价格
	
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDetaill() {
		return productDetaill;
	}

	public void setProductDetaill(String productDetaill) {
		this.productDetaill = productDetaill;
	}

	public String getStockNum() {
		return stockNum;
	}

	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}

	public String getProductIco1() {
		return productIco1;
	}

	public void setProductIco1(String productIco1) {
		this.productIco1 = productIco1;
	}

	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

	public String getSpecPrice() {
		return specPrice;
	}

	public void setSpecPrice(String specPrice) {
		this.specPrice = specPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}