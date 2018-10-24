/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品规格Entity
 * @author tao_yonggang
 * @version 2018-10-24
 */
public class ProductSpecifications extends DataEntity<ProductSpecifications> {
	
	private static final long serialVersionUID = 1L;
	private String productId;		// 商品ID（MALL_PRODUCT_INFO表主键ID）
	private String specName;		// 规格名称
	private Double specPrice;		// 规格价格
	private Integer sort;		  // 排序（默认10）
	
	public ProductSpecifications() {
		super();
	}

	public ProductSpecifications(String id){
		super(id);
	}

	@Length(min=1, max=64, message="商品ID（MALL_PRODUCT_INFO表主键ID）长度必须介于 1 和 64 之间")
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	@Length(min=1, max=200, message="规格名称长度必须介于 1 和 200 之间")
	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}
	
	@NotNull(message="规格价格不能为空")
	public Double getSpecPrice() {
		return specPrice;
	}

	public void setSpecPrice(Double specPrice) {
		this.specPrice = specPrice;
	}
	
	@NotNull(message="排序（默认10）不能为空")
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}