package com.thinkgem.jeesite.modules.letsim.utils;
import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkgem.jeesite.modules.letsapi.entity.AppUser;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class OpenFireActionUtil {
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	private Connection connection;
    private ConnectionConfiguration config;
    /** openfire服务器address */
    private final static String server = "laptop-o0bhgntq";
    
    public void init() {
        try {
			ConnectionConfiguration 
			config = new ConnectionConfiguration(server,5222);
			config.setCompressionEnabled(true); 
			/** 是否启用安全验证 */ 
			config.setSASLAuthenticationEnabled(true); 
			/** 是否启用调试 */ 
			config.setDebuggerEnabled(false);
//          //config = new ConnectionConfiguration(server,5222);
//          ConnectionConfiguration config = new ConnectionConfiguration("127.0.0.1", 5222, server);
//          /*config.setCompressionEnabled(true);
//          *//** 是否启用安全验证 *//*
//          config.setSASLAuthenticationEnabled(true);
//          *//** 是否启用调试 *//*
//          config.setDebuggerEnabled(false);*/
//          config.setReconnectionAllowed(false);
//          config.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled);
//          config.setSendPresence(true);
            /** 创建connection链接 */
            connection = new XMPPConnection(config);
            /** 建立连接 */
            connection.connect();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
     }
    
    public void destory() {
        if (connection != null) {
            connection.disconnect();
            connection = null;
        }
    }
    /**
     * @author zhai_shaobo
     *	测试对话
     */
//    public static void main(String[] args) {
//        OpenFire3Action smack = new OpenFire3Action();
//        FromUser fromUser = new FromUser();
//        fromUser.setUsername("test1");
//        fromUser.setPassword("000000");
//        smack.sendMsg(fromUser, "test2","1111");
//        smack.destory();
//    }
    public void sendMsg(AppUser fromUser, String toUserName, String msg) {
        init();
        System.out.println("开始发送openfier--------------------->>>>>");
        try {
            connection.login(fromUser.getLoginName(), fromUser.getPassword());
            System.out.println("连接成功--------------------->>>>>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        ChatManager chatmanager = connection.getChatManager();
        System.out.println("3阶段--------------------->>>>>");
        Chat newChat = chatmanager.createChat(toUserName + "@" + server, new MessageListener() {
            public void processMessage(Chat chat, Message message) {
                if (message.getBody() != null) {
                    System.out.println("name 【"
                            + message.getFrom() + "】 地瓜: "
                            + message.getBody());
                }
            }
        });
        Scanner input = new Scanner(System.in);
        while (true) {
            String message = input.nextLine();
            try {
                newChat.sendMessage(message);
            } catch (XMPPException e) {
                e.printStackTrace();
            }
        }
        /*try {
            destory();
        }catch (Exception e){
            e.printStackTrace();
        }*/
    }
    
    //测试注册账号
    public static void main(String[] args) {
    	OpenFireActionUtil smack = new OpenFireActionUtil();
        /*FromUser fromUser = new FromUser();
        fromUser.setUsername("user2");
        fromUser.setPassword("123456");
        smack.sendMsg(fromUser, "user1","");*/
        //创建用户的信息
        Map<String,String> map = new HashMap<String, String>();
        map.put("email","");
        map.put("name", "name");
        smack.register("test5","000000",map,smack.getXMPPConnection());
        smack.destory();
    }
    
    public XMPPConnection getXMPPConnection() {
        try {
            ConnectionConfiguration config = new ConnectionConfiguration("192.168.1.105", 5222, server);
            config.setReconnectionAllowed(false);
            config.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled);
            config.setSendPresence(true);
            XMPPConnection connection = new XMPPConnection(config);
            connection.connect();
            return connection;
        } catch (XMPPException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 注册账号
     * username 是账号名
     * map是邮箱，name，还有其他信息
     * XMPPConnection 是连接通道
     */
    public void register(String username,String password, Map<String, String> attrMap,XMPPConnection XMPPConnection) {
        try {
            if (username != null && !username.isEmpty()) {
                //统一默认密码
                if(XMPPConnection!=null) {
                    //"1"为账号密码，默认都为
                    XMPPConnection.getAccountManager().createAccount(username, password, attrMap);
                }
            }
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }
    /**
     * 修改密码
     * newPassword 新密码
     * XMPPConnection 是连接通道
     * by tao_yonggang
     */
    public void changePassword(String newPassword,XMPPConnection XMPPConnection) {
        try {
            if (newPassword != null && !newPassword.isEmpty()) {
                //统一默认密码
                if(XMPPConnection!=null) {
                   //"1"为账号密码，默认都为
                    connection.getAccountManager().changePassword(newPassword);
                }
            }
        } catch (XMPPException e) {
        	logger.error("修改openfier密码异常--------------------->>>>>"+e.getMessage());
            e.printStackTrace();
        }
    }
    /**
     * 修改密码
     * newPassword 新密码
     * XMPPConnection 是连接通道
     * by tao_yonggang
     */
    public void loginOpenfier(String loginName, String oldPassWord) {
        init();
        System.out.println("开始发送openfier--------------------->>>>>");
        logger.info("开始发送openfier--------------------->>>>>");
        try {
            connection.login(loginName, oldPassWord);
            System.out.println("连接成功--------------------->>>>>");
            logger.info("连接成功--------------------->>>>>");
        } catch (Exception e) {
            e.printStackTrace();
        }
     
    }
}
