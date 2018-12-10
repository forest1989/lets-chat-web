package com.thinkgem.jeesite.simpletoken;


import com.thinkgem.jeesite.common.utils.IdGen;

public class TestToken {
	public static void main(String[] args) throws Exception {
		String appId = "970ca35de60c44645bbae8a215061b33";
        String certificate = "5cfd2fd1755d40ecb72977518be15d3b";
        String channelName = "TestAccount";
        String uid=IdGen.uuid();
		SimpleTokenBuilder sb=new SimpleTokenBuilder(appId, certificate, channelName, uid);
		String token=sb.buildToken();
		System.out.println(token);
		boolean a= sb.initTokenBuilder("l8PXAAA");
		System.out.println(a);
	}
}
