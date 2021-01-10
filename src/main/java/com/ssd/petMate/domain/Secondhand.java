package com.ssd.petMate.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

public class Secondhand {
	private int boardNum;
	private String boardDate;
	private String userID;
	@NotBlank
	@Length(max=1500)
	private String boardContent;
	private int cartAdded;
	@NotNull
	@Min(1)
	private int price;
	private int boardHit;
	private int replyCnt;
	@NotBlank
	@Length(max=30)
	private String boardTitle;
	private int isSold;
	
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
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getCartAdded() {
		return cartAdded;
	}
	public void setCartAdded(int cartAdded) {
		this.cartAdded = cartAdded;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
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
	public int getIsSold() {
		return isSold;
	}
	public void setIsSold(int isSold) {
		this.isSold = isSold;
	}
	
}
