package com.thinkgem.jeesite.modules.letsapi.entity;

public class MallOrderSplit {
	
	private String id;//订单表id
	private String orderNo;//订单编号
	private String userId;//用户编号
	private String orderStatus;//订单状态默认01
	private String productAmountTotal;//订单总金额
	private String orderAmountTotal;//商品总金额
	private String addressId;//地址id
	private String payChannel;//支付方式
	private String remarks;//备注
	
	
	private String mallInfoId;//订单详情表id
	private String productCount;//商品数量
	private String productId;//商品id
	private String productSpecId;//规格id
	private String specName;//规格名称
	private String productPrice;//规格价格
	private String mallShopcarId;//购物车id
	
	
	
	public MallOrderSplit() {
		super();
	}

	public MallOrderSplit(String id, String orderNo, String userId, String orderStatus, String productAmountTotal,
			String orderAmountTotal, String addressId, String payChannel, String remarks, String productCount,
			String productId, String productSpecId, String specName, String productPrice, String mallShopcarId ,String mallInfoId) {
		super();
		this.id = id;
		this.orderNo = orderNo;
		this.userId = userId;
		this.orderStatus = orderStatus;
		this.productAmountTotal = productAmountTotal;
		this.orderAmountTotal = orderAmountTotal;
		this.addressId = addressId;
		this.payChannel = payChannel;
		this.remarks = remarks;
		this.productCount = productCount;
		this.productId = productId;
		this.productSpecId = productSpecId;
		this.specName = specName;
		this.productPrice = productPrice;
		this.mallShopcarId = mallShopcarId;
		this.mallInfoId = mallInfoId;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getProductAmountTotal() {
		return productAmountTotal;
	}
	public void setProductAmountTotal(String productAmountTotal) {
		this.productAmountTotal = productAmountTotal;
	}
	public String getOrderAmountTotal() {
		return orderAmountTotal;
	}
	public void setOrderAmountTotal(String orderAmountTotal) {
		this.orderAmountTotal = orderAmountTotal;
	}
	public String getAddressId() {
		return addressId;
	}
	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getPayChannel() {
		return payChannel;
	}
	public void setPayChannel(String payChannel) {
		this.payChannel = payChannel;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getProductCount() {
		return productCount;
	}
	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductSpecId() {
		return productSpecId;
	}
	public void setProductSpecId(String productSpecId) {
		this.productSpecId = productSpecId;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getMallShopcarId() {
		return mallShopcarId;
	}
	public void setMallShopcarId(String mallShopcarId) {
		this.mallShopcarId = mallShopcarId;
	}

	public String getMallInfoId() {
		return mallInfoId;
	}

	public void setMallInfoId(String mallInfoId) {
		this.mallInfoId = mallInfoId;
	}

	@Override
	public String toString() {
		return "MallOrderSplit [id=" + id + ", orderNo=" + orderNo + ", userId=" + userId + ", orderStatus="
				+ orderStatus + ", productAmountTotal=" + productAmountTotal + ", orderAmountTotal=" + orderAmountTotal
				+ ", addressId=" + addressId + ", payChannel=" + payChannel + ", remarks=" + remarks + ", mallInfoId="
				+ mallInfoId + ", productCount=" + productCount + ", productId=" + productId + ", productSpecId="
				+ productSpecId + ", specName=" + specName + ", productPrice=" + productPrice + ", mallShopcarId="
				+ mallShopcarId + "]";
	}

}
