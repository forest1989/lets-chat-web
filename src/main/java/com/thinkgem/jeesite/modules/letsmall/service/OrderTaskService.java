package com.thinkgem.jeesite.modules.letsmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.letsmall.dao.MallOrderInfoDao;

@Service
@Lazy(false)
public class OrderTaskService {

	@Autowired
	private MallOrderInfoDao mallOrderInfoDao;
	
	/**
	 * 定时任务 (每天凌晨执行该定时任务)
	 */
	@Scheduled(cron = "0 0 0 * * ?")
	public void orderCancelTask() {
		System.out.println(DateUtils.getDate("yyyy-MM-dd HH:mm:ss") + " 开始执行自动取消待付款订单..................");
		mallOrderInfoDao.orderCancelTask();
		
	}
}
