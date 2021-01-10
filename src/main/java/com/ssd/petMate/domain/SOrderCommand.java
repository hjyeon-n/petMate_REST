package com.ssd.petMate.domain;

import java.util.List;

public class SOrderCommand {
	private int orderNum;
	private String orderDate;
	private int price;
	private String userID;
	private String bank;
	private String address;
	private List<SLineItemCommand> sLineItems;
	private int productPrice;
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public List<SLineItemCommand> getsLineItems() {
		return sLineItems;
	}
	public void setsLineItems(List<SLineItemCommand> sLineItems) {
		this.sLineItems = sLineItems;
	}
	public int getProductPrice() {
		return productPrice;
	}
	
	public void getTotalPrice() {
		int i;
		productPrice = 0;
		for(i = 0; i < sLineItems.size(); i++) {
			productPrice += sLineItems.get(i).getPrice();
		}
	}
	
	
}
