/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 购物车Entity
 * @author tao_yonggang
 * @version 2018-10-23
 */
public class MallShopcar extends DataEntity<MallShopcar> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 用户ID（APP_USER表主键ID）
	private String productId;		// 商品ID(MALL_PRODUCT_INFO表主键ID)
	private Long   productCount;		// 购买数量
	private String productName;     // 商品名称
	private String productIco;      // 商品略缩图
	private String specId;          // 规格id
	private String specName;        // 规格名称
	private Double specPrice;       // 规格价格
	private Integer stockNum;       // 规格数量
	private String stauts;		// 商品状态（0：上架  1：下架  2：待定  3：待定）
	
	public MallShopcar() {
		super();
	}

	public MallShopcar(String id){
		super(id);
	}

	/**
	 * @return the stockNum
	 */
	public Integer getStockNum() {
		return stockNum;
	}

	/**
	 * @return the stauts
	 */
	public String getStauts() {
		return stauts;
	}

	/**
	 * @param stauts the stauts to set
	 */
	public void setStauts(String stauts) {
		this.stauts = stauts;
	}

	/**
	 * @param stockNum the stockNum to set
	 */
	public void setStockNum(Integer stockNum) {
		this.stockNum = stockNum;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the productIco
	 */
	public String getProductIco() {
		return productIco;
	}

	/**
	 * @param productIco the productIco to set
	 */
	public void setProductIco(String productIco) {
		this.productIco = productIco;
	}

	/**
	 * @return the specId
	 */
	public String getSpecId() {
		return specId;
	}

	/**
	 * @param specId the specId to set
	 */
	public void setSpecId(String specId) {
		this.specId = specId;
	}

	/**
	 * @return the specName
	 */
	public String getSpecName() {
		return specName;
	}

	/**
	 * @param specName the specName to set
	 */
	public void setSpecName(String specName) {
		this.specName = specName;
	}

	/**
	 * @return the specPrice
	 */
	public Double getSpecPrice() {
		return specPrice;
	}

	/**
	 * @param specPrice the specPrice to set
	 */
	public void setSpecPrice(Double specPrice) {
		this.specPrice = specPrice;
	}

	@Length(min=1, max=64, message="用户ID（APP_USER表主键ID）长度必须介于 1 和 64 之间")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=1, max=64, message="商品ID(MALL_PRODUCT_INFO表主键ID)长度必须介于 1 和 64 之间")
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
	
}