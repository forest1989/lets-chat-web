/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrder;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;
import com.thinkgem.jeesite.modules.letsapi.entity.ShoppingAddress;
import com.thinkgem.jeesite.modules.letsapi.service.MallProductInfoService;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 商品信息Controller
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Controller
@RequestMapping(value = "${frontPath}/letsapi/mallProductInfo")
public class MallProductInfoController extends BaseController {

	@Autowired
	private MallProductInfoService mallProductInfoService;
	
	@ModelAttribute
	public MallProductInfo get(@RequestParam(required=false) String id) {
		MallProductInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = mallProductInfoService.get(id);
		}
		if (entity == null){
			entity = new MallProductInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("letsapi:mallProductInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(MallProductInfo mallProductInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<MallProductInfo> page = mallProductInfoService.findPage(new Page<MallProductInfo>(request, response), mallProductInfo); 
		model.addAttribute("page", page);
		return "modules/letsapi/mallProductInfoList";
	}

	@RequiresPermissions("letsapi:mallProductInfo:view")
	@RequestMapping(value = "form")
	public String form(MallProductInfo mallProductInfo, Model model) {
		model.addAttribute("mallProductInfo", mallProductInfo);
		return "modules/letsapi/mallProductInfoForm";
	}

	@RequiresPermissions("letsapi:mallProductInfo:edit")
	@RequestMapping(value = "save")
	public String save(MallProductInfo mallProductInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, mallProductInfo)){
			return form(mallProductInfo, model);
		}
		mallProductInfoService.save(mallProductInfo);
		addMessage(redirectAttributes, "保存商品信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/mallProductInfo/?repage";
	}
	
	@RequiresPermissions("letsapi:mallProductInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(MallProductInfo mallProductInfo, RedirectAttributes redirectAttributes) {
		mallProductInfoService.delete(mallProductInfo);
		addMessage(redirectAttributes, "删除商品信息成功");
		return "redirect:"+Global.getAdminPath()+"/letsapi/mallProductInfo/?repage";
	}
	/**  
	* <p>Description:首页轮播图查询 </p>      
	* @author tao_yonggang  
	* @date 2018年10月22日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getAppSilderImg", method = RequestMethod.POST)
	public String  getAppSilderImg(HttpServletRequest request,HttpServletResponse response){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getAppSilderImg();
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:查询字典 </p>      
	* @author tao_yonggang  
	* @date 2018年10月22日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getDict", method = RequestMethod.POST)
	public String  getDict(HttpServletRequest request,HttpServletResponse response,Dict dic){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getDict(dic);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:首页轮播图查询 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/findAllHotList", method = RequestMethod.POST)
	public String  findAllHotList(HttpServletRequest request,HttpServletResponse response){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.findAllHotList();
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:获取 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getShippingAdsList", method = RequestMethod.POST)
	public String  getShippingAdsList(HttpServletRequest request,HttpServletResponse response){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getShippingAdsList(request);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:删除地址 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/delAddress", method = RequestMethod.POST)
	public String  delAddress(HttpServletRequest request,HttpServletResponse response,ShoppingAddress sAdd){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.delAddress(sAdd);
		} catch (Exception e) {
			 rtn.setMessage("删除异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:设置默认收货地址 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updateDefaultAds", method = RequestMethod.POST)
	public String  updateDefaultAds(HttpServletRequest request,HttpServletResponse response,ShoppingAddress sAdd){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.updateDefaultAds(sAdd);
		} catch (Exception e) {
			 rtn.setMessage("修改异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:修改收货地址 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updateAds", method = RequestMethod.POST)
	public String  updateAds(HttpServletRequest request,HttpServletResponse response,ShoppingAddress sAdd){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.updateAds(sAdd);
		} catch (Exception e) {
			 rtn.setMessage("修改异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:增加收货地址 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/insertAds", method = RequestMethod.POST)
	public String  insertAds(HttpServletRequest request,HttpServletResponse response,ShoppingAddress sAdd){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.insertAds(request,sAdd);
		} catch (Exception e) {
			 rtn.setMessage("添加异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:添加购物车 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/insertShopCar", method = RequestMethod.POST)
	public String  insertShopCar(HttpServletRequest request,HttpServletResponse response,MallShopcar shopCar){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.insertShopCar(request,shopCar);
		} catch (Exception e) {
			 rtn.setMessage("添加异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:修改购物车商品数量 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/updateCarCount", method = RequestMethod.POST)
	public String  updateCarCount(HttpServletRequest request,HttpServletResponse response,MallShopcar mallShopcar){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.updateCarCount(mallShopcar);
		} catch (Exception e) {
			 rtn.setMessage("修改异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:查询购物车数据 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getShopCarList", method = RequestMethod.POST)
	public String  getShopCarList(HttpServletRequest request,HttpServletResponse response){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getShopCarList(request);
		} catch (Exception e) {
			 rtn.setMessage("添加异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:删除购物车 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/delShopCar", method = RequestMethod.POST)
	public String  delShopCar(HttpServletRequest request,HttpServletResponse response,MallShopcar mallShopcar){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.delShopCar(mallShopcar);
		} catch (Exception e) {
			 rtn.setMessage("删除异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:查询商品列表数据 </p>      
	* @author tao_yonggang  
	* @date 2018年10月24日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getProductInfoList", method = RequestMethod.POST)
	public String  getProductInfoList(HttpServletRequest request,HttpServletResponse response,MallProductInfo mpi){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getProductInfoList(mpi);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:查询详情数据 </p>      
	* @author tao_yonggang  
	* @date 2018年10月24日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/getProductDetailList", method = RequestMethod.POST)
	public String  getProductDetailList(HttpServletRequest request,HttpServletResponse response,MallProductInfo mpi){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.getProductDetailList(mpi);
		} catch (Exception e) {
			 rtn.setMessage("查询异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	
	/**  
	* <p>Description:新增订单 </p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/insertOrder", method = RequestMethod.POST)
	public String  insertOrder(HttpServletRequest request,HttpServletResponse response,MallOrder mallOrder){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.insertOrder(request,mallOrder);
		} catch (Exception e) {
			 rtn.setMessage("添加异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
	/**  
	* <p>Description:获取订单</p>      
	* @author tao_yonggang  
	* @date 2018年10月23日  
	* @version 1.0  
	*/ 
	@RequestMapping(value="/selectOrder", method = RequestMethod.POST)
	public String  selectOrder(HttpServletRequest request,HttpServletResponse response,MallOrder mallOrder){
		RtnData rtn=new RtnData();
		try {
			rtn = mallProductInfoService.selectOrder(request,mallOrder);
		} catch (Exception e) {
			 rtn.setMessage("添加异常");
			 rtn.setCode("500");
		}
		return toJsonByALWAYS(response, rtn);
	}
}