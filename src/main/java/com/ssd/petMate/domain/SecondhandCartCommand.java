package com.ssd.petMate.domain;

public class SecondhandCartCommand {
	private String userID;
	private int boardNum;
	private Secondhand secondhand;
	
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
	public Secondhand getSecondhand() {
		return secondhand;
	}
	public void setSecondhand(Secondhand secondhand) {
		this.secondhand = secondhand;
	}
	
}
