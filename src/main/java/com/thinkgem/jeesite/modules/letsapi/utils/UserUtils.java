package com.thinkgem.jeesite.modules.letsapi.utils;

import javax.servlet.http.HttpServletRequest;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.letsapi.jwt.api.TokenMgr;
import com.thinkgem.jeesite.modules.letsapi.jwt.model.CheckResult;
import com.thinkgem.jeesite.modules.letsapi.jwt.model.SubjectModel;
import com.thinkgem.jeesite.modules.letsapi.jwt.utils.GsonUtil;

import io.jsonwebtoken.Claims;

public class UserUtils {

	// 获取APP user信息
	public static SubjectModel getUser(HttpServletRequest request) {
		String tokenStr = request.getHeader("Authorization");
		if(StringUtils.isBlank(tokenStr)) {
			return null;
		}
		CheckResult checkResult = TokenMgr.validateJWT(tokenStr);
		if (checkResult.isSuccess()) {
			Claims claims = checkResult.getClaims();
			SubjectModel user = GsonUtil.jsonStrToObject(claims.getSubject(), SubjectModel.class);
			return user;
		}
		return null;
	}
}
