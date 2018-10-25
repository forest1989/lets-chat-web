/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 订单信息管理Entity
 * @author forest
 * @version 2018-10-24
 */
public class MallOrderManage extends DataEntity<MallOrderManage> {
	
	private static final long serialVersionUID = 1L;
	private String orderNo;					// 订单编号
	private AppUserManage user;				// 用户ID（APP_USER表主键ID）
	private String orderStatus;				// 1-未付款,2-已付款,3-已发货,4-已签收,5-退货申请,6-退货中,7-已退货,8-取消交易(订单状态用系统字典表进行管理)
	private Double productAmountTotal;		// 商品总价
	private Double orderAmountTotal;		// 订单金额（实际付款金额）
	private Double logisticsFee;			// 运费金额
	private String addressId;				// 收货地址编号
	private String logisticsCompanyName;	// 物流公司名称
	private String orderlogisticsId;		// 订单物流编号
	private String payChannel;				// 订单支付渠道
	private Date payTime;					// 付款时间
	private String escrowTradeNo;			// 第三方支付流水号
	private Date consign;					// 发货时间
	private String columns1;				// 是否开票（预留字段）
	private String columns2;				// 发票编号（预留字段）
	private String productName;
	private Date startDate;
	private Date endDate;
	
	public MallOrderManage() {
		super();
	}

	public MallOrderManage(String id){
		super(id);
	}

	@Length(min=1, max=200, message="订单编号长度必须介于 1 和 200 之间")
	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	public AppUserManage getUser() {
		return user;
	}

	public void setUser(AppUserManage user) {
		this.user = user;
	}
	
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
	
	public String getColumns1() {
		return columns1;
	}

	public void setColumns1(String columns1) {
		this.columns1 = columns1;
	}
	
	
	public String getColumns2() {
		return columns2;
	}

	public void setColumns2(String columns2) {
		this.columns2 = columns2;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}