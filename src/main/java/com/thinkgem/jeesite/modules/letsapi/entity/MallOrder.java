/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 订单信息Entity
 * @author zhaishaobo
 * @version 2018-10-24
 */
public class MallOrder extends DataEntity<MallOrder> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID（APP_USER表主键ID）
	private String orderNo;		// 订单编号
	private User user;		// 用户ID（APP_USER表主键ID）
	private String orderStatus;		// 1-未付款,2-已付款,3-已发货,4-已签收,5-退货申请,6-退货中,7-已退货,8-取消交易(订单状态用系统字典表进行管理)
	private Double productAmountTotal;		// 商品总价
	private Double orderAmountTotal;		// 订单金额（实际付款金额）
	private Double logisticsFee;		// 运费金额
	private String addressId;		// 收货地址编号
	private String logisticsCompanyName;		// 物流公司名称
	private String orderlogisticsId;		// 订单物流编号
	private String payChannel;		// 订单支付渠道
	private Date payTime;		// 付款时间
	private String escrowTradeNo;		// 第三方支付流水号
	private Date consign;		// 发货时间
	private String columns1;		// 是否开票（预留字段）
	private String columns2;		// 发票编号（预留字段）
	
	//查询订单返参添加
	/** 通过订单表中的地址id查询出来的地址信息 */
	private String phone;//收货电话
	private String arear;//所在地区
	private String addressDetail;//详细地址
	private String isDefault;//是否设为默认地址(0是；1否)
	private String delFlag;//删除标记(0正常；1已删除)
	private String shopUserName;//收货人姓名
	
	
	private List<MallOrderInfo>  mallOrderInfo; //订单信息详情
	
	public MallOrder() {
		super();
	}

	public MallOrder(String id){
		super(id);
	}

	@Length(min=1, max=200, message="订单编号长度必须介于 1 和 200 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	@NotNull(message="用户ID（APP_USER表主键ID）不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=1, message="1-未付款,2-已付款,3-已发货,4-已签收,5-退货申请,6-退货中,7-已退货,8-取消交易(订单状态用系统字典表进行管理)长度必须介于 1 和 1 之间")
	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	@NotNull(message="商品总价不能为空")
	public Double getProductAmountTotal() {
		return productAmountTotal;
	}

	public void setProductAmountTotal(Double productAmountTotal) {
		this.productAmountTotal = productAmountTotal;
	}
	
	@NotNull(message="订单金额（实际付款金额）不能为空")
	public Double getOrderAmountTotal() {
		return orderAmountTotal;
	}

	public void setOrderAmountTotal(Double orderAmountTotal) {
		this.orderAmountTotal = orderAmountTotal;
	}
	
	public Double getLogisticsFee() {
		return logisticsFee;
	}

	public void setLogisticsFee(Double logisticsFee) {
		this.logisticsFee = logisticsFee;
	}
	
	@Length(min=1, max=64, message="收货地址编号长度必须介于 1 和 64 之间")
	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	
	@Length(min=0, max=200, message="物流公司名称长度必须介于 0 和 200 之间")
	public String getLogisticsCompanyName() {
		return logisticsCompanyName;
	}

	public void setLogisticsCompanyName(String logisticsCompanyName) {
		this.logisticsCompanyName = logisticsCompanyName;
	}
	
	@Length(min=0, max=200, message="订单物流编号长度必须介于 0 和 200 之间")
	public String getOrderlogisticsId() {
		return orderlogisticsId;
	}

	public void setOrderlogisticsId(String orderlogisticsId) {
		this.orderlogisticsId = orderlogisticsId;
	}
	
	@Length(min=1, max=64, message="订单支付渠道长度必须介于 1 和 64 之间")
	public String getPayChannel() {
		return payChannel;
	}

	public void setPayChannel(String payChannel) {
		this.payChannel = payChannel;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	
	@Length(min=0, max=200, message="第三方支付流水号长度必须介于 0 和 200 之间")
	public String getEscrowTradeNo() {
		return escrowTradeNo;
	}

	public void setEscrowTradeNo(String escrowTradeNo) {
		this.escrowTradeNo = escrowTradeNo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getConsign() {
		return consign;
	}

	public void setConsign(Date consign) {
		this.consign = consign;
	}
	
	@Length(min=0, max=200, message="是否开票（预留字段）长度必须介于 0 和 200 之间")
	public String getColumns1() {
		return columns1;
	}

	public void setColumns1(String columns1) {
		this.columns1 = columns1;
	}
	
	@Length(min=0, max=200, message="发票编号（预留字段）长度必须介于 0 和 200 之间")
	public String getColumns2() {
		return columns2;
	}

	public void setColumns2(String columns2) {
		this.columns2 = columns2;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<MallOrderInfo> getMallOrderInfo() {
		return mallOrderInfo;
	}

	public void setMallOrderInfo(List<MallOrderInfo> mallOrderInfo) {
		this.mallOrderInfo = mallOrderInfo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getArear() {
		return arear;
	}

	public void setArear(String arear) {
		this.arear = arear;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getShopUserName() {
		return shopUserName;
	}

	public void setShopUserName(String shopUserName) {
		this.shopUserName = shopUserName;
	}
	
	
}