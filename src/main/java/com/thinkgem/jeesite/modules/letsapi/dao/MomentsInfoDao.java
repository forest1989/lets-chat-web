/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.letsapi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.letsapi.entity.MomentsInfo;

/**
 * 发朋友圈DAO接口
 * @author tao_yonggang
 * @version 2018-11-15
 */
@MyBatisDao
public interface MomentsInfoDao extends CrudDao<MomentsInfo> {
	
	/**
	 * @param 朋友圈查询 之：只给状态0 查询最新十条朋友圈，刚进来朋友圈
	 * @return
	 */
	List<MomentsInfo> findMoments0(MomentsInfo momentsInfo);
	
	/**
	 * @param 朋友圈查询 之：有时间&有查询状态1----下拉获取时间轴往上所有
	 * @return
	 */
	List<MomentsInfo> findMoments1(MomentsInfo momentsInfo);
	
	/**
	 * @param 朋友圈查询 之：有时间&有查询状态2---上滑 查询下一页
	 * @return
	 */
	List<MomentsInfo> findMoments2(MomentsInfo momentsInfo);
	
	
	/**
	 * @param 朋友圈查询 之：查询我的相册
	 * @return
	 */
	List<MomentsInfo> findMyMoments(MomentsInfo momentsInfo);
}