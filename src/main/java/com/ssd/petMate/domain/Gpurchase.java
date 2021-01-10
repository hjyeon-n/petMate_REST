package com.ssd.petMate.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

public class Gpurchase {
	private int boardNum;
	private String boardDate;
	private String userID;
	@Min(1)
	private int price;
	@NotBlank
	private String sdate;
	@NotBlank
	private String edate;
	@NotBlank
	@Length(max=1500)
	private String boardContent;
	private int cartAdded;
	private int replyCnt;
	@NotBlank
	@Length(max=30)
	private String boardTitle;
	private int boardHit;
	@Min(1)
	private int goalNum;
	private int lprice;
	private int participant;
	private String status;
	@NotBlank
	private String productName;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	public int getGoalNum() {
		return goalNum;
	}
	public void setGoalNum(int goalNum) {
		this.goalNum = goalNum;
	}
	public int getCartAdded() {
		return cartAdded;
	}
	public void setCartAdded(int cartAdded) {
		this.cartAdded = cartAdded;
	}
	public int getLprice() {
		return lprice;
	}
	public void setLprice(int lprice) {
		this.lprice = lprice;
	}
	public int getParticipant() {
		return participant;
	}
	public void setParticipant(int participant) {
		this.participant = participant;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Gpurchase() {
		super();
	}
	
	public Gpurchase (String userID, int boardNum, int price ,String boardTitle) {
		this.userID = userID;
		this.boardNum = boardNum;
		this.price = price;
		this.boardTitle = boardTitle;
	}

}
