package com.thinkgem.jeesite.modules.letsapi.jwt.model;

import com.thinkgem.jeesite.modules.letsapi.jwt.utils.GsonUtil;

/**
 * 标准数据返回格式	
 * @author forest
 *
 */
public class CommonResult {

	private Integer code;//返回码
	
	private Object data;//业务数据
	
	private String message;//返回描述
	
	private String token;//身份标识
	
	

	public CommonResult(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public CommonResult(Integer code, Object data, String message) {
		super();
		this.code = code;
		this.data = data;
		this.message = message;
	}

	public CommonResult(Integer code, Object data, String message, String token) {
		super();
		this.code = code;
		this.data = data;
		this.message = message;
		this.token = token;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	/**
	 * 请求返回数据处理
	 * @param commonResult
	 * @return
	 */
	public String general() {
		return GsonUtil.objectToJsonStr(this);
	}
}
