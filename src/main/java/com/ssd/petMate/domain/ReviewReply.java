package com.ssd.petMate.domain;

public class ReviewReply {
	private String userID;
	private int boardNum;
	private int replyNum;
	private String replyDate;
	private String replyContent;
	private int replyGID;
	private int replyParents;
	private int replyOrder;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyGID() {
		return replyGID;
	}
	public void setReplyGID(int replyGID) {
		this.replyGID = replyGID;
	}
	public int getReplyParents() {
		return replyParents;
	}
	public void setReplyParents(int replyParents) {
		this.replyParents = replyParents;
	}
	public int getReplyOrder() {
		return replyOrder;
	}
	public void setReplyOrder(int replyOrder) {
		this.replyOrder = replyOrder;
	}
}
