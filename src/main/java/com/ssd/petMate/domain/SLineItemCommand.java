package com.ssd.petMate.domain;

public class SLineItemCommand {
	private int orderNum;
	private int price;
	private int boardNum;
	private int lineItemNum;
	private String boardTitle;
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getLineItemNum() {
		return lineItemNum;
	}
	public void setLineItemNum(int lineItemNum) {
		this.lineItemNum = lineItemNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
}
