package com.ssd.petMate.domain;

public class Answer { //Answer�� ��ǻ� �����̶�
	private String userID;
	private int boardNum;
	private int answerNum;
	private String answerDate;
	private String answerContent;
	private int replyGID;
	private int replyParents;
	private int replyOrder;
	private int isSelected;
	
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
	public int getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
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
	public int getIsSelected() {
		return isSelected;
	}
	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}
}
