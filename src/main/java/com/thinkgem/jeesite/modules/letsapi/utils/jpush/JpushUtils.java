package com.thinkgem.jeesite.modules.letsapi.utils.jpush;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkgem.jeesite.common.config.Global;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

public class JpushUtils {
	private static Logger logger = LoggerFactory.getLogger(JpushUtils.class);

	/**
	 * 激光推送byAndroid
	 * @param parm
	 */
	public static void jpushAndroid(Map<String, String> parm) {
		String appKey = Global.getConfig("jpush.appKey");
		String masterSecret = Global.getConfig("jpush.masterSecret");
	    //创建JPushClient(极光推送的实例)
	    JPushClient jpushClient = new JPushClient(masterSecret, appKey);
	    //推送的关键,构造一个payload 
	    PushPayload payload = PushPayload.newBuilder()
	            .setPlatform(Platform.android())
	            .setAudience(Audience.alias(parm.get("alias"))) // 指定用户
	            .setNotification(Notification.android(parm.get("msg"), parm.get("msgTitle"), parm))	        
	            .setOptions(Options.newBuilder().setApnsProduction(false).build()) //true-推送生产环境 false-推送开发环境（测试使用参数）
	            .setMessage(Message.content(parm.get("msg")))//自定义信息
	            .build();
	
       try {
            PushResult pu = jpushClient.sendPush(payload); 
            if(pu.isResultOK()) {
				logger.info("针对别名" + parm.get("alias") + "的信息推送成功！");
			}else {
				logger.error("针对别名" + parm.get("alias") + "的信息推送失败！");
				logger.error("失败信息如下：" + pu.toString());
			}
        } catch (APIConnectionException e) {
        	System.out.println(e);
        } catch (APIRequestException e) {
        	System.out.println(e);
			logger.error("Error response from JPush server. Should review and fix it. " + e);
			logger.error("HTTP Status: " + e.getStatus());
			logger.error("Error Code: " + e.getErrorCode());
			logger.error("Error Message: " + e.getErrorMessage());
			logger.error("Msg ID: " + e.getMsgId());
        }    
	}
	
	/**
	 * 激光推送byIOS
	 * @param parm
	 */
	public static void jpushIOS(Map<String, String> parm) {
		String appKey = Global.getConfig("jpush.appKey");
		String masterSecret = Global.getConfig("jpush.masterSecret");
		// 创建JPushClient
		JPushClient jpushClient = new JPushClient(masterSecret, appKey);
		PushPayload payload = PushPayload.newBuilder().setPlatform(Platform.ios())// ios平台的用户
				.setAudience(Audience.alias(parm.get("alias"))) // 指定用户
				.setNotification(Notification.newBuilder()
								.addPlatformNotification(IosNotification.newBuilder().setAlert(parm.get("msg"))
										.autoBadge().setSound("newMessage.mp3")// 这里是设置提示音(更多可以去官网看看)
										.addExtras(parm).build())
								.build())
				.setOptions(Options.newBuilder().setApnsProduction(false).build()) //true-推送生产环境 false-推送开发环境（测试使用参数）
				.setMessage(Message.newBuilder().setMsgContent(parm.get("msg")).addExtras(parm).build())// 自定义信息
				.build();

		try {
			PushResult pu = jpushClient.sendPush(payload);
			if(pu.isResultOK()) {
				logger.info("针对别名" + parm.get("alias") + "的信息推送成功！");
			}else {
				logger.error("针对别名" + parm.get("alias") + "的信息推送失败！");
				logger.error("失败信息如下：" + pu.toString());
			}
			
		} catch (APIConnectionException e) {
			System.out.println(e);
		} catch (APIRequestException e) {
			System.out.println(e);
			logger.error("Error response from JPush server. Should review and fix it. " + e);
			logger.error("HTTP Status: " + e.getStatus());
			logger.error("Error Code: " + e.getErrorCode());
			logger.error("Error Message: " + e.getErrorMessage());
			logger.error("Msg ID: " + e.getMsgId());
		}
	}
	
	public static void main(String[] args) {
		Map<String, String> parm = new HashMap<String, String>();
		parm.put("msg", "你有一条新消息,请查收！");
		parm.put("alias", "fjl123");
		jpushIOS(parm);
	}
}
