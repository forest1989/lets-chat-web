package com.thinkgem.jeesite.modules.letsmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.letsmall.dao.MallOrderInfoDao;
import com.thinkgem.jeesite.modules.letsmall.entity.ProductSpecifications;

@Service
@Lazy(false)
@Transactional(readOnly = true)
public class OrderTaskService {

	@Autowired
	private MallOrderInfoDao mallOrderInfoDao;
	
	/**
	 * 定时任务 (每天凌晨执行该定时任务)
	 */
	@Scheduled(cron = "0 0 0 * * ?")
	@Transactional(readOnly = false)
	public void orderCancelTask() {
		System.out.println(DateUtils.getDate("yyyy-MM-dd HH:mm:ss") + " 开始执行自动取消待付款订单..................");
		// 获取需要自动取消的订单ID集合
		List<String> ids = mallOrderInfoDao.getCancelOrderIds();
		if(ids != null && ids.size() > 0) {
			// 获取取消订单的商品详情
			List<Map<String, Object>> list = mallOrderInfoDao.getOrderInfoByIds(ids);
			// 更改订单商品的库存数量
			for(Map<String, Object> m : list) {
				// 更新商品订单
				ProductSpecifications ps = new ProductSpecifications();
				String productSpecId = m.get("PRODUCT_SPEC_ID").toString();
				String productCount = m.get("PRODUCT_COUNT").toString();
				ps.setId(productSpecId);
				ps.setStockNum(Long.valueOf(productCount));
				mallOrderInfoDao.updateProNum(ps);
			}
			// 更新订单状态
			mallOrderInfoDao.orderCancelTask(ids);
		}
		
		
	}
}
