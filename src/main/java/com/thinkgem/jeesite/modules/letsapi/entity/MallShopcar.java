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
	private Long productCount;		// 购买数量
	
	public MallShopcar() {
		super();
	}

	public MallShopcar(String id){
		super(id);
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