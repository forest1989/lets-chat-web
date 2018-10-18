package com.thinkgem.jeesite.modules.letsapi.utils;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;

/**
 * 文件上传工具类
 * 
 * @author yangdc
 * @date Apr 18, 2012
 * 
 * <pre>
 * </pre>
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
	public List<Map<String,Object>> getListMap(String jsonStr) {
		JSONArray myJsonArray = JSONArray.fromObject(jsonStr);
		 List<Map<String,Object>> listmp=null;
		 try {
			listmp = (List)myJsonArray;
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return listmp;
	}
}
