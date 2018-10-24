/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 热门优选Entity
 * @author tao_yonggang
 * @version 2018-10-22
 */
public class HotProduct extends DataEntity<HotProduct> {
	
	private static final long serialVersionUID = 1L;
	private String hotId;		// 热门优选ID
	private String productId;		// 商品ID
	private String specId;		// 规格ID
	private String productName;		// 商品名称
	private String productIco;		// 商品略图
	private String specName;		// 规格名称
	private String specPrice;		// 规格价格
	private Date startTime;		// 生效时间失效时间
	private Date ednTime;		// 失效时间
	private Integer sort;		// 排列次序
	
	public HotProduct() {
		super();
	}

	public HotProduct(String id){
		super(id);
	}

	@Length(min=1, max=64, message="商品ID长度必须介于 1 和 64 之间")
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="生效时间失效时间不能为空")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="失效时间不能为空")
	public Date getEdnTime() {
		return ednTime;
	}

	public void setEdnTime(Date ednTime) {
		this.ednTime = ednTime;
	}
	
	@NotNull(message="排列次序不能为空")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	/**
	 * @return the hotId
	 */
	public String getHotId() {
		return hotId;
	}

	/**
	 * @param hotId the hotId to set
	 */
	public void setHotId(String hotId) {
		this.hotId = hotId;
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
	public String getSpecPrice() {
		return specPrice;
	}

	/**
	 * @param specPrice the specPrice to set
	 */
	public void setSpecPrice(String specPrice) {
		this.specPrice = specPrice;
	}
	
}