package com.thinkgem.jeesite.common.utils;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class Dom4jXmlUtils {

	public static String getXmlMesgType(String xmlStr) {
		try {
			Document document = DocumentHelper.parseText(xmlStr);
			Element rootElement = document.getRootElement();// 获取根节点
			Element bodyElement = rootElement.element("body");
			String mesgContent = bodyElement.getText();
			if("textSecret".contains(mesgContent)) {
				return "您收到了一条加密消息";
			}else {
				return "您收到了一条Lets Chat消息";
			}
		} catch (DocumentException e) {	
			e.printStackTrace();
			return "";
		}
	}
	
	public static void main(String[] args) {
		String str = "<message type=\"chat\" to=\"aa1113@izd3oo6eij7e5jz/mobile\" from=\"admina@izd3oo6eij7e5jz/mobile\"><body>&lt;msgContent id=\"2\"&gt;&amp;lt;text&amp;gt;江湖&amp;lt;/text&amp;gt;&lt;/msgContent&gt;</body></message>";
		getXmlMesgType(str);
	}
}
