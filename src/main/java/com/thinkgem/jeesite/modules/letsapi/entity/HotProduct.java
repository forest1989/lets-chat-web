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
	private String productId;		// 商品ID
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
	
}