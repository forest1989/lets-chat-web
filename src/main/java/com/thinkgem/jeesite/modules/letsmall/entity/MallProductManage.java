/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsmall.entity;

import org.hibernate.validator.constraints.Length;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品信息管理Entity
 * @author tao_yonggang
 * @version 2018-10-20
 */
public class MallProductManage extends DataEntity<MallProductManage> {
	
	private static final long serialVersionUID = 1L;
	
	private String productNo;			// 商品编号
	
	private String productName;			// 商品名称
	
	private String productIco1;			// 商品图标1
	
	private String productIco2;			// 商品图标2
	
	private String productIco3;			// 商品图标3
	
	private String productIco4;			// 商品图标4
	
	private String productIco5;			// 商品图标5
	
	private String productIco6;			// 商品图标6
	
	private String productImg1;			// 商品图片1
	
	private String productImg2;		    // 商品图片2
	
	private String productImg3;		    // 商品图片3
	
	private String productDetailImg;    // 商品描述图片
	
	private String productTypeId;		// 商品类别ID（商品类别使用系统已有的字典管理模块）
	
	private Long stockNum;		        // 库存数量
	
	private String stauts;		        // 商品状态（0：上架  1：下架  2：待定  3：待定）
	
	private ProductSpecifications proSpec;
	
	private List<ProductSpecifications> proSpecList;
	
	private String oldProductTypeId;
	
	public MallProductManage() {
		super();
	}

	public MallProductManage(String id){
		super(id);
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	
	@NotNull(message="商品名称不能为空")
	@Length(min=1, max=200, message="商品名称长度必须介于 1 和 200 之间")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Length(min=0, max=1000, message="商品图标1长度必须介于 0 和 1000 之间")
	public String getProductIco1() {
		return productIco1;
	}

	public void setProductIco1(String productIco1) {
		this.productIco1 = productIco1;
	}
	
	@Length(min=0, max=1000, message="商品图标2长度必须介于 0 和 1000 之间")
	public String getProductIco2() {
		return productIco2;
	}

	public void setProductIco2(String productIco2) {
		this.productIco2 = productIco2;
	}
	
	@Length(min=0, max=1000, message="商品图标3长度必须介于 0 和 1000 之间")
	public String getProductIco3() {
		return productIco3;
	}

	public void setProductIco3(String productIco3) {
		this.productIco3 = productIco3;
	}
	
	@Length(min=0, max=1000, message="商品图标4长度必须介于 0 和 1000 之间")
	public String getProductIco4() {
		return productIco4;
	}

	public void setProductIco4(String productIco4) {
		this.productIco4 = productIco4;
	}
	
	@Length(min=0, max=1000, message="商品图标5长度必须介于 0 和 1000 之间")
	public String getProductIco5() {
		return productIco5;
	}

	public void setProductIco5(String productIco5) {
		this.productIco5 = productIco5;
	}
	
	@Length(min=0, max=1000, message="商品图标6长度必须介于 0 和 1000 之间")
	public String getProductIco6() {
		return productIco6;
	}

	public void setProductIco6(String productIco6) {
		this.productIco6 = productIco6;
	}
	
	@Length(min=0, max=1000, message="商品图片1长度必须介于 0 和 1000 之间")
	public String getProductImg1() {
		return productImg1;
	}

	public void setProductImg1(String productImg1) {
		this.productImg1 = productImg1;
	}
	
	@Length(min=0, max=1000, message="商品图片2长度必须介于 0 和 1000 之间")
	public String getProductImg2() {
		return productImg2;
	}

	public void setProductImg2(String productImg2) {
		this.productImg2 = productImg2;
	}
	
	@Length(min=0, max=1000, message="商品图片3长度必须介于 0 和 1000 之间")
	public String getProductImg3() {
		return productImg3;
	}

	public void setProductImg3(String productImg3) {
		this.productImg3 = productImg3;
	}
	
	public String getProductDetailImg() {
		return productDetailImg;
	}

	public void setProductDetailImg(String productDetailImg) {
		this.productDetailImg = productDetailImg;
	}

	public String getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(String productTypeId) {
		this.productTypeId = productTypeId;
	}
	
	public Long getStockNum() {
		return stockNum;
	}

	public void setStockNum(Long stockNum) {
		this.stockNum = stockNum;
	}
	
	public String getStauts() {
		return stauts;
	}

	public void setStauts(String stauts) {
		this.stauts = stauts;
	}

	public List<ProductSpecifications> getProSpecList() {
		return proSpecList;
	}

	public void setProSpecList(List<ProductSpecifications> proSpecList) {
		this.proSpecList = proSpecList;
	}

	public ProductSpecifications getProSpec() {
		return proSpec;
	}

	public void setProSpec(ProductSpecifications proSpec) {
		this.proSpec = proSpec;
	}

	public String getOldProductTypeId() {
		return oldProductTypeId;
	}

	public void setOldProductTypeId(String oldProductTypeId) {
		this.oldProductTypeId = oldProductTypeId;
	}
	
	
	
}