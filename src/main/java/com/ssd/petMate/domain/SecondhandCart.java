package com.ssd.petMate.domain;

public class SecondhandCart {
	private String userID;
	private int boardNum;
	
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
	
	public SecondhandCart(String userID, int boardNum) {
		super();
		this.userID = userID;
		this.boardNum = boardNum;
	}
	public SecondhandCart() {
		super();
	}		
}
