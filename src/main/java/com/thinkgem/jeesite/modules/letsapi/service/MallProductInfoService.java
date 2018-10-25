/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.letsapi.dao.MallOrderDao;
import com.thinkgem.jeesite.modules.letsapi.dao.MallProductInfoDao;
import com.thinkgem.jeesite.modules.letsapi.dao.MallShopcarDao;
import com.thinkgem.jeesite.modules.letsapi.dao.ShoppingAddressDao;
import com.thinkgem.jeesite.modules.letsapi.entity.AppSilderImg;
import com.thinkgem.jeesite.modules.letsapi.entity.HotProduct;
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrder;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;
import com.thinkgem.jeesite.modules.letsapi.entity.ProductSpecificationApi;
import com.thinkgem.jeesite.modules.letsapi.entity.ShoppingAddress;
import com.thinkgem.jeesite.modules.letsapi.utils.JsonUtils;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 商品信息Service
 * @author tao_yonggang
 * @version 2018-10-20
 */
@Service
@Transactional(readOnly = true)
public class MallProductInfoService extends CrudService<MallProductInfoDao, MallProductInfo> {
	
	@Autowired
	private MallProductInfoDao mallProductInfoDao;
	@Autowired
	private DictDao dictDao;
	@Autowired
	private ShoppingAddressDao shoppingAddressDao;
	@Autowired
	private MallShopcarDao shopcarDao;
	@Autowired
	private MallOrderDao mallOrderDao;
	
	public MallProductInfo get(String id) {
		return super.get(id);
	}
	
	public List<MallProductInfo> findList(MallProductInfo mallProductInfo) {
		return super.findList(mallProductInfo);
	}
	
	public Page<MallProductInfo> findPage(Page<MallProductInfo> page, MallProductInfo mallProductInfo) {
		return super.findPage(page, mallProductInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(MallProductInfo mallProductInfo) {
		super.save(mallProductInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(MallProductInfo mallProductInfo) {
		super.delete(mallProductInfo);
	}

	/**
	 * @param 首页轮播图查询
	 * @param listmp
	 * @return
	 */
	public RtnData getAppSilderImg() {
		RtnData rtn = new RtnData();
		List<AppSilderImg> listImg = null;
		try {
			listImg = mallProductInfoDao.getAppSilderImg();
			if(listImg != null) {
				if(listImg.size() > 0) {
					rtn.setData(listImg);
					rtn.setCode("0000");
					rtn.setMessage("首页轮播图查询成功");
				}else {
					rtn.setCode("1016");
					rtn.setMessage("暂无数据");
				}
			}else {
				rtn.setCode("1017");
				rtn.setMessage("首页轮播图查询失败");
			}
			
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("首页轮播图查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * 获取字典数据模块
	 * @return
	 */
	public RtnData getDict(Dict dic) {
		RtnData rtn = new RtnData();
		List<Dict> list=null;
		try {
			list=dictDao.findList(dic);
			if(list != null && list.size() > 0) {
				rtn.setData(list);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1020");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * 热门优选
	 * @return
	 */
	public RtnData findAllHotList() {
		RtnData rtn = new RtnData();
		List<HotProduct> list=null;
		try {
			list=mallProductInfoDao.findAllHotList();
			if(list != null && list.size() > 0) {
				rtn.setData(list);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1021");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param sAddr通过id查询用户购物车地址
	 * @return
	 */
	public RtnData getShippingAdsList(HttpServletRequest request) {
		RtnData rtn = new RtnData();
		List<ShoppingAddress> listShopping=null;
		try {
			listShopping=shoppingAddressDao.getShippingAdsList(UserUtils.getUser(request).getUserId());
			if(listShopping != null && listShopping.size() > 0) {
				rtn.setData(listShopping);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1022");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param sAdd删除地址
	 * @return
	 */
	@Transactional
	public RtnData delAddress(ShoppingAddress sAdd) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			n=shoppingAddressDao.delete(sAdd);
			if(n > 0) {
				rtn.setCode("0000");
				rtn.setMessage("删除成功");
			}else {
				rtn.setCode("1023");
				rtn.setMessage("删除失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("删除异常------"+e.getMessage());
		}
		
		return rtn;
	}

	/**
	 * @param sAdd修改默认地址
	 * @return
	 */
	@Transactional
	public RtnData updateDefaultAds(ShoppingAddress sAdd) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			sAdd.setIsDefault("0");
			n=shoppingAddressDao.updateById(sAdd);
			if( n > 0 ) {
				rtn.setCode("0000");
				rtn.setMessage("修改成功");
			}else {
				rtn.setCode("1024");
				rtn.setMessage("修改失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("修改异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param sAdd修改地址
	 * @return
	 */
	@Transactional
	public RtnData updateAds(ShoppingAddress sAdd) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			n=shoppingAddressDao.updateById(sAdd);
			if(n > 0) {
				rtn.setCode("0000");
				rtn.setMessage("修改成功");
			}else {
				rtn.setCode("1025");
				rtn.setMessage("修改失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("修改异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param sAdd 增加收货地址
	 * @return
	 */
	@Transactional
	public RtnData insertAds(HttpServletRequest request,ShoppingAddress sAdd) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			sAdd.setId(IdGen.uuid());
			sAdd.setUserId(UserUtils.getUser(request).getUserId());
			sAdd.setIsDefault("1");
			n=shoppingAddressDao.insertAddress(sAdd);
			if(n > 0) {
				rtn.setCode("0000");
				rtn.setMessage("添加成功");
			}else {
				rtn.setCode("1026");
				rtn.setMessage("添加失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("添加异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param request添加购物车
	 * @param shopCar
	 * @return
	 */
	@Transactional
	public RtnData insertShopCar(HttpServletRequest request, MallShopcar shopCar) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			shopCar.setUserId(UserUtils.getUser(request).getUserId());
			MallShopcar shopCars= shopcarDao.selectProductIsExist(shopCar);
			if(shopCars!=null) {
				shopCar.setId(shopCars.getId());
				shopCar.setProductCount(shopCars.getProductCount()+shopCar.getProductCount());
				n=shopcarDao.updateCountById(shopCar);
				if(n > 0) {
					rtn.setCode("0000");
					rtn.setMessage("添加成功");
				}else {
					rtn.setCode("1027");
					rtn.setMessage("添加失败");
				}
			}else {
				shopCar.setId(IdGen.uuid());
				shopCar.setUserId(UserUtils.getUser(request).getUserId());
				n=shopcarDao.insertShopCar(shopCar);
				if(n > 0) {
					rtn.setCode("0000");
					rtn.setMessage("添加成功");
				}else {
					rtn.setCode("1027");
					rtn.setMessage("添加失败");
				}
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("添加异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param mallShopcar修改购物车商品数量
	 * @return
	 */
	@Transactional
	public RtnData updateCarCount(MallShopcar mallShopcar) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			n=shopcarDao.updateCountById(mallShopcar);
			if(n > 0) {
				rtn.setCode("0000");
				rtn.setMessage("修改成功");
			}else {
				rtn.setCode("1028");
				rtn.setMessage("修改失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("修改异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param request查询购物车数据
	 * @return
	 */
	public RtnData getShopCarList(HttpServletRequest request) {
		RtnData rtn = new RtnData();
		List<MallShopcar> shopCarList=null;
		try {
			shopCarList=shopcarDao.getShopCarList(UserUtils.getUser(request).getUserId());
			if(shopCarList != null && shopCarList.size() > 0) {
				rtn.setData(shopCarList);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1029");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param mallShopcar删除购物车
	 * @return
	 */
	@Transactional
	public RtnData delShopCar(MallShopcar mallShopcar) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			n=shopcarDao.delete(mallShopcar);
			if(n > 0) {
				rtn.setCode("0000");
				rtn.setMessage("删除成功");
			}else {
				rtn.setCode("1030");
				rtn.setMessage("删除失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("删除异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param request
	 * @param mpi 查询商品列表数据
	 * @return
	 */
	public RtnData getProductInfoList(MallProductInfo mpi) {
		RtnData rtn = new RtnData();
		List<MallProductInfo> mpiList=null;
		try {
			mpiList=mallProductInfoDao.getProductInfoList(mpi);
			if(mpiList != null && mpiList.size() > 0) {
				rtn.setData(mpiList);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1031");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}

	/**
	 * @param mpi
	 * @return查询详情数据
	 */
	public RtnData getProductDetailList(MallProductInfo mpi) {
		RtnData rtn = new RtnData();
		List<MallProductInfo> mpilist=null;
		try {
			mpilist=mallProductInfoDao.selectAll(mpi);
			if(mpilist!=null && mpilist.size() > 0) {
				rtn.setData(mpilist);
				rtn.setCode("0000");
				rtn.setMessage("查询成功");
			}else {
				rtn.setCode("1032");
				rtn.setMessage("暂无数据");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("查询异常------"+e.getMessage());
		}
		return rtn;
	}
	/**
	 * @param request新增订单
	 * @param shopCar
	 * @return
	 */
	@Transactional
	public RtnData insertOrder(HttpServletRequest request, MallOrder mallOrder) {
		RtnData rtn = new RtnData();
		int mallOrderNo=0;
		int mallOrderInfo=0;
		try {
			mallOrder.setUserId(UserUtils.getUser(request).getUserId());//用户id
			mallOrder.setId(IdGen.uuid());//主键id
			mallOrder.setOrderNo(JsonUtils.getOrderNo()); //订单编号
			mallOrder.setOrderStatus("1");//新生成的订单是未支付的
			
			mallOrderNo= mallOrderDao.insertOrder(mallOrder);
			
			for (int i = 0; i < mallOrder.getMallOrderInfo().size(); i++) {
				mallOrder.getMallOrderInfo().get(i).setId(IdGen.uuid());
				mallOrder.getMallOrderInfo().get(i).setOrderId(mallOrder.getId());
			}
			mallOrderInfo = mallOrderDao.insertOrderInfo(mallOrder.getMallOrderInfo());
			if (mallOrderNo>0 && mallOrderInfo>0) {
				rtn.setCode("0000");
				rtn.setMessage("新增订单成功");
			} else {
				rtn.setCode("500");
				rtn.setMessage("新增订单失败");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage(e.getMessage());
			logger.error("新增订单异常------"+e.getMessage());
		}
		return rtn;
	}
}