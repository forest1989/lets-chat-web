package com.thinkgem.jeesite.modules.letsapi.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;


/**  
* <p>Description: Json工具类</p>      
* @author tao_yonggang  
* @date 2018年10月18日  
* @version 1.0  
*/ 
public class JsonUtils {
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 获取listmap
	 * 
	 * @param data
	 * @return 
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getListMap(HttpServletRequest request) {
		String jsonStr = request.getParameter("data");
		JSONArray myJsonArray = JSONArray.fromObject(jsonStr);
		List<Map<String,Object>> listmp = null;
		try {
			listmp = (List)myJsonArray;
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return listmp;
	}
	
	/**
	 * @author zhai_shaobo
	 * 订单生成方法。时间戳+6位随机数
	 */

	public static String getOrderNo() {
		String orderno1 = String.valueOf(System.currentTimeMillis());
		String orderno2 = String.valueOf((int)((Math.random()*9+1)*100000));
		return orderno1+orderno2;
	}
}
