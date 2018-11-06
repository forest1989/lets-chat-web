package com.thinkgem.jeesite.modules.letsapi.entity;

/**
 * openfire离线消息
 * @author forest
 *
 */
public class OfflineMessage {

	private String userame;
	
	private String messageid;
	
	private String creationdate;
	
	private String messagesize;
	
	private String stanza;

	public OfflineMessage() {}
	
	public OfflineMessage(String messageid) {
		this.messageid = messageid;
	}
	public String getUserame() {
		return userame;
	}

	public void setUserame(String userame) {
		this.userame = userame;
	}

	public String getMessageid() {
		return messageid;
	}

	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}

	public String getCreationdate() {
		return creationdate;
	}

	public void setCreationdate(String creationdate) {
		this.creationdate = creationdate;
	}

	public String getMessagesize() {
		return messagesize;
	}

	public void setMessagesize(String messagesize) {
		this.messagesize = messagesize;
	}

	public String getStanza() {
		return stanza;
	}

	public void setStanza(String stanza) {
		this.stanza = stanza;
	}
	
	
	
}
