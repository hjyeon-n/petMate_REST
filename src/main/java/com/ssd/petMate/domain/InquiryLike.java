package com.ssd.petMate.domain;

public class InquiryLike {
	private String userID;
	private int boardNum;
	private String likeDate;
	
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
	public InquiryLike(String userID, int boardNum) {
		super();
		this.userID = userID;
		this.boardNum = boardNum;
	}
	public InquiryLike(String userID, int boardNum, String likeDate) {
		super();
		this.userID = userID;
		this.boardNum = boardNum;
		this.likeDate = likeDate;
	}
}
