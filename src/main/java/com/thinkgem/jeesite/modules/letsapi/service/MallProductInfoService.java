/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrderInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MallOrderSplit;
import com.thinkgem.jeesite.modules.letsapi.entity.MallProductInfo;
import com.thinkgem.jeesite.modules.letsapi.entity.MallShopcar;
import com.thinkgem.jeesite.modules.letsapi.entity.ProductSpecificationApi;
import com.thinkgem.jeesite.modules.letsapi.entity.ShoppingAddress;
import com.thinkgem.jeesite.modules.letsapi.utils.JsonUtils;
import com.thinkgem.jeesite.modules.letsapi.utils.RtnData;
import com.thinkgem.jeesite.modules.letsapi.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.alibaba.fastjson.JSON;


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
	public RtnData updateDefaultAds(String defaultId) {
		RtnData rtn = new RtnData();
		ShoppingAddress sAdd=new ShoppingAddress();
		int n=0;
		try {
			sAdd.setId(defaultId);
			sAdd.setIsDefault("1");
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
	public RtnData updateAds(HttpServletRequest request,ShoppingAddress sAdd) {
		RtnData rtn = new RtnData();
		int n=0;
		try {
			sAdd.setUserId(UserUtils.getUser(request).getUserId());
			if(sAdd.getIsDefault().equals("0")) {
				int cn= shoppingAddressDao.updateDefault(sAdd);
				if(cn>0) {
					n=shoppingAddressDao.updateById(sAdd);
					if(n > 0) {
						rtn.setCode("0000");
						rtn.setMessage("修改成功");
					}else {
						rtn.setCode("1025");
						rtn.setMessage("修改失败");
					}
				}else {
					rtn.setCode("1025");
					rtn.setMessage("修改失败");
				}
			}else {
				n=shoppingAddressDao.updateById(sAdd);
				if(n > 0) {
					rtn.setCode("0000");
					rtn.setMessage("修改成功");
				}else {
					rtn.setCode("1025");
					rtn.setMessage("修改失败");
				}
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
		ProductSpecificationApi ps=null;
		int n=0;
		try {
			 ps=shopcarDao.selectSpecNum(shopCar);
			if(ps!=null && ps.getStockNum()>0 && shopCar.getProductCount() <= ps.getStockNum()) {
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
			}else {
				rtn.setCode("1033");
				rtn.setMessage("库存数量不足");
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
		ProductSpecificationApi ps=null;
		int n=0;
		try {
			ps=shopcarDao.selectSpecNum(mallShopcar);
		    if(ps!=null && ps.getStockNum()>0 && mallShopcar.getProductCount() <= ps.getStockNum()) {
		    	n=shopcarDao.updateCountById(mallShopcar);
				if(n > 0) {
					rtn.setCode("0000");
					rtn.setMessage("修改成功");
				}else {
					rtn.setCode("1028");
					rtn.setMessage("修改失败");
				}
		    }else {
		    	rtn.setCode("1034");
				rtn.setMessage("库存数量不足");
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
		int deleteShop=0;
		int updateStock=0;
		try {
			mallOrder.setUserId(UserUtils.getUser(request).getUserId());//用户id
//			mallOrder.setId(IdGen.uuid());//主键id
//			mallOrder.setOrderNo(JsonUtils.getOrderNo()); //订单编号
			mallOrder.setOrderStatus("01");//新生成的订单是未支付的
				// 先查库存 库存满足 再去 加入订单。。库存不足提示用户
			String mallOrderInfoStr = request.getParameter("mallOrderInfo");
			
			List<MallOrderInfo> list = JsonUtils.getPersons(mallOrderInfoStr,MallOrderInfo.class);
			mallOrder.setMallOrderInfo(list);
			
			List<MallOrderSplit> mallOrderSplitList = new ArrayList<MallOrderSplit>();//拆分组装list
			List<MallOrderInfo> mallOrderInfoKC = mallOrder.getMallOrderInfo();
			List<MallOrder> mallOrderList = new ArrayList<MallOrder>();//返回订单id集合
			ProductSpecificationApi ps=null;
			if (mallOrderInfoKC.size()>0) {
				for (int i = 0; i < mallOrderInfoKC.size(); i++) {
					try {
						MallShopcar mallShopcar = new MallShopcar();
						mallShopcar.setSpecId(mallOrderInfoKC.get(i).getProductSpecId());
						ps=shopcarDao.selectSpecNum(mallShopcar);
						if(ps!=null && ps.getStockNum()>0 && mallOrderInfoKC.get(i).getProductCount() <= ps.getStockNum()) {
							//构建新的入对象
							mallOrder.setId(IdGen.uuid());//主键id
							MallOrder MallOrderrtn = new MallOrder();
							MallOrderrtn.setId(mallOrder.getId());
							mallOrderList.add(MallOrderrtn);
							mallOrder.setOrderNo(JsonUtils.getOrderNo()); //订单编号
							String mallInfoId = IdGen.uuid();
							double price = new Double(mallOrderInfoKC.get(i).getProductPrice());
							int productcount = mallOrderInfoKC.get(i).getProductCount().intValue();
							String priceTotl = String.valueOf(price*productcount);
							MallOrderSplit mallOrderSplit = new MallOrderSplit(mallOrder.getId(), mallOrder.getOrderNo(), mallOrder.getUserId(), mallOrder.getOrderStatus(), priceTotl, 
									priceTotl, mallOrder.getAddressId(), mallOrder.getPayChannel(), mallOrder.getRemarks(), mallOrderInfoKC.get(i).getProductCount().toString(), 
									mallOrderInfoKC.get(i).getProductId(), mallOrderInfoKC.get(i).getProductSpecId(), mallOrderInfoKC.get(i).getSpecName(), mallOrderInfoKC.get(i).getProductPrice(), mallOrderInfoKC.get(i).getMallShopcarId(),mallInfoId);
							mallOrderSplitList.add(mallOrderSplit);
							
						}else {
							rtn.setCode("1033");
							rtn.setMessage("库存数量不足");
							return rtn;
						}
					} catch (Exception e) {
						
					}
				}
			}else {
				rtn.setCode("1034");
				rtn.setMessage("订单商品不能为空");
				return rtn;
			}
					//库存满足。进行添加订单操作   mallShopcarId(购物车id，插入订单表成功之后 删除对应购物车数据)
			
			try {
				mallOrderNo= mallOrderDao.insertOrder(mallOrderSplitList);
//				for (int i = 0; i < mallOrder.getMallOrderInfo().size(); i++) {
//					mallOrder.getMallOrderInfo().get(i).setId(IdGen.uuid());
//					mallOrder.getMallOrderInfo().get(i).setOrderId(mallOrder.getId());
//				}
				mallOrderInfo = mallOrderDao.insertOrderInfo(mallOrderSplitList);
				
				//mallShopcarId(购物车id，插入订单表成功之后 删除对应购物车数据)-------删除购物车
				for (int i = 0; i < mallOrder.getMallOrderInfo().size(); i++) {
					MallShopcar mallShopcar = new MallShopcar();
					mallShopcar.setId(mallOrder.getMallOrderInfo().get(i).getMallShopcarId());
					//删除购物车
					deleteShop = shopcarDao.delete(mallShopcar);
					//修改规格表中对应商品库存
					updateStock = mallOrderDao.updateStock(mallOrder.getMallOrderInfo().get(i));
					if (deleteShop<=0 || updateStock<=0) {
						rtn.setCode("1050");
						rtn.setMessage("新增订单失败!");
						return rtn;
					}
				}
			} catch (Exception e) {
				rtn.setCode("500");
				rtn.setMessage("新增订单异常!");
				logger.error("新增订单异常!:"+e.getMessage());
			}
			if (mallOrderNo>0 && mallOrderInfo>0) {
				rtn.setData(mallOrderList);
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
	/**
	 * @param request查询订单列表
	 * @param shopCar
	 * @return
	 */
	@Transactional
	public RtnData selectOrder(HttpServletRequest request, MallOrder mallOrder) {
		RtnData rtn = new RtnData();
		List<MallOrder> res = new ArrayList<MallOrder>();
		try {
			mallOrder.setUserId(UserUtils.getUser(request).getUserId());
			res = mallOrderDao.selectOrder(mallOrder);
			if (res.size()>0) {
				rtn.setCode("0000");
				rtn.setMessage("订单列表获取成功!");
				rtn.setData(res);
				logger.info("订单列表获取成功------"+UserUtils.getUser(request).getUserId());
			}else {
				rtn.setCode("500");
				rtn.setMessage("订单列表获取失败!");
				logger.error("订单列表获取失败!");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage("订单列表获取异常!");
			e.printStackTrace();
			logger.error("订单列表获取异常!" + e.getMessage());
		}
		return rtn;
	}
	/**
	 * @param request删除订单
	 * @param shopCar
	 * @return
	 */
	@Transactional
	public RtnData deleteOrder(HttpServletRequest request, MallOrder mallOrder) {
		RtnData rtn = new RtnData();
		int resOrder = 0;
		int resOrderInfo = 0;
		try {
			List<MallOrder> li = new ArrayList<MallOrder>();
			String orderId = mallOrder.getOrderId();
			String orderIds [] = orderId.split(",");
			for (int i = 0; i < orderIds.length; i++) {
				MallOrder mo = new MallOrder();
				mo.setOrderId(orderIds[i]);
				li.add(mo);
			}
			resOrder = mallOrderDao.deleteOrder(li);
			resOrderInfo = mallOrderDao.deleteOrderInfo(li);
			if (resOrder>0 && resOrderInfo>0) {
				rtn.setCode("0000");
				rtn.setMessage("订单列表删除成功!");
				logger.info("订单列表删除成功------"+mallOrder.getOrderId());
			}else {
				rtn.setCode("500");
				rtn.setMessage("订单列表删除失败!");
				logger.error("订单列表删除失败!");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage("订单列表删除异常!");
			e.printStackTrace();
			logger.error("订单列表删除异常!" + e.getMessage());
		}
		return rtn;
	}
	/**
	 * @param request修改订单（支付的时候调用次接口修改订单状态为已支付）
	 * @param shopCar
	 * @return
	 */
	@Transactional
	public RtnData updateOrder(HttpServletRequest request, MallOrder mallOrder) {
		RtnData rtn = new RtnData();
		int resOrder = 0;
		int i = 0;
		int res = 0;
		double amountTotalAll = 0;//所有订单总金额
		try {
			String userId  = UserUtils.getUser(request).getUserId();
			String mallOrderInfoStr = request.getParameter("orderIds");
			List<MallOrder> list = JsonUtils.getPersons(mallOrderInfoStr,MallOrder.class);
			//1验证是否是 确认已完成 操作。
			if (list.get(0).getOperationType().equals("2")) {
				res = mallOrderDao.updateOver(list);
				if (res>0) {
					rtn.setCode("0000");
					rtn.setMessage("已完成操作成功");
					logger.info("已完成操作成功:"+userId);
					return rtn;
				}else {
					rtn.setCode("1051");
					rtn.setMessage("操作失败请重试!");
					logger.info("已完成操作失败:"+userId);
					return rtn;
				}
			}
			//2如果不是已完成操作。继续往下走支付操作
			if (list.size()<=0)  {
				rtn.setCode("1051");
				rtn.setMessage("入参订单id为空!");
				logger.error("获取订单金额为空!:"+userId);
				return rtn;
			}
			//根据订单编号 获取 订单金额
			List<MallOrder> amountTotal = mallOrderDao.getAmountTotal(list);
			if (amountTotal.size() <=0)  {
				rtn.setCode("1051");
				rtn.setMessage("订单金额为空!");
				logger.error("获取订单金额为空!:"+userId);
				return rtn;
			}
			for (int j = 0; j < amountTotal.size(); j++) {
				amountTotalAll += Double.valueOf(amountTotal.get(i).getOrderAmountTotal());
			}
			//获取用户拥有的购物币。
			MallOrder userMoney = mallOrderDao.getUserMoney(userId);
			
			if (StringUtils.isBlank(userMoney.getBalance().toString()))  {
				rtn.setCode("1052");
				rtn.setMessage("用户余额为空!");
				logger.error("获取用户余额为空!:"+userId);
				return rtn;
			}
			//如果用户拥有的购物币大于订单金额。再继续进行支付流程。否则 返回 支付失败
			if (amountTotalAll > Double.valueOf(userMoney.getBalance())) {
				rtn.setCode("1052");
				rtn.setMessage("支付失败,余额不足!");
				logger.error("支付失败,余额不足!:"+userId);
				return rtn;
			}
			MallOrder mallOrderIn = new MallOrder();
			mallOrderIn.setUserId(userId);
			mallOrderIn.setOrderAmountTotal(amountTotalAll);
			//先扣购物币。再修改订单状态 根据userid
			i = mallOrderDao.downMoney(mallOrderIn);
			//修改订单状态为已支付 根据 订单id
			resOrder = mallOrderDao.updateOrder(list);
			if (i > 0 && resOrder>0) {
				rtn.setCode("0000");
				rtn.setMessage("订单支付成功!");
				logger.info("订单支付成功------"+mallOrder.getOrderId());
			}else {
				rtn.setCode("500");
				rtn.setMessage("订单支付失败!");
				logger.error("订单支付失败!");
			}
		} catch (Exception e) {
			rtn.setCode("500");
			rtn.setMessage("订单支付异常!");
			e.printStackTrace();
			logger.error("订单支付异常!" + e.getMessage());
		}
		return rtn;
	}
}