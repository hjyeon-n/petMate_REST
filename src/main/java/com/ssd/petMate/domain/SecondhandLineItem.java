package com.ssd.petMate.domain;

public class SecondhandLineItem {
	private int orderNum;
	private int price;
	private int boardNum;
	private int lineItemNum;
	
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
	
	public void CartToLineItem(Secondhand secondhand, int orderNum) {
		this.price = secondhand.getPrice();
		this.boardNum = secondhand.getBoardNum();
		this.orderNum = orderNum;
	}
	
}
