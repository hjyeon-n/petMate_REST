package com.ssd.petMate.domain;

import java.io.Serializable;

public class GpurchaseCartCommand implements Serializable{
	private String userID;
	private int boardNum;
	private Gpurchase gpurchase;
	
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
	public Gpurchase getGpurchase() {
		return gpurchase;
	}
	public void setGpurchase(Gpurchase gpurchase) {
		this.gpurchase = gpurchase;
	}

}
