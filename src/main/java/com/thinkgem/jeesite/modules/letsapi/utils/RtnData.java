package com.thinkgem.jeesite.modules.letsapi.utils;

/**  
* <p>Description: data工具类</p>      
* @author tao_yonggang  
* @date 2018年10月19日  
* @version 1.0  
*/ 

public class RtnData{
	
	private static final long serialVersionUID = 1L;
	
	private String code;//返回code
	
	private String message;//返回信息
	
	private Object data;//数据项
	
	/**
	 * 
	 */
	public RtnData() {
		super();
	}
	
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "rtnData [code=" + code + ", message=" + message + ", data=" + data + "]";
	}
	
}
