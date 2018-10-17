package com.thinkgem.jeesite.modules.letsapi.jwt.test;

import com.thinkgem.jeesite.modules.letsapi.jwt.api.TokenMgr;
import com.thinkgem.jeesite.modules.letsapi.jwt.config.Constant;

public class TextJWT {

	public static void main(String[] args) {
		try {
			System.out.println(TokenMgr.createJWT("78sawdff5", Constant.JWT_ISS,"forest", 1 * 60 * 10000));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(System.currentTimeMillis());
		
		String jwt = "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI3OHNhd2RmZjUiLCJpc3MiOiJqd3QtbGV0cyIsInN1YiI6ImZvcmVzdCIsImlhdCI6MTUzOTc5MDU5NywiZXhwIjoxNTM5NzkxMTk3fQ.y7pv3_xLyHIUJOC7_kX9rVaier0gMifYOjjiQwL60_U";
		try {
			System.out.println(TokenMgr.parseJWT(jwt));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
