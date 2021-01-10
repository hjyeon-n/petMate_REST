package com.ssd.petMate.domain;

public class InfoLike {
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
	public String getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}
	public InfoLike(String userID, int boardNum, String likeDate) {
		super();
		this.userID = userID;
		this.boardNum = boardNum;
		this.likeDate = likeDate;
	}
	public InfoLike(String userID, int boardNum) {
		super();
		this.userID = userID;
		this.boardNum = boardNum;
	}
}
