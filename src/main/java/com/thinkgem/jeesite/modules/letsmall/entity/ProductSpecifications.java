package com.thinkgem.jeesite.modules.letsmall.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class ProductSpecifications extends DataEntity<ProductSpecifications>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String productId;
	
	private String specName;
	
	private Double specPrice;
	
	private Integer sort;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

	public Double getSpecPrice() {
		return specPrice;
	}

	public void setSpecPrice(double specPrice) {
		this.specPrice = specPrice;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	
}
