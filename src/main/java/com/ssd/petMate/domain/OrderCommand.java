package com.ssd.petMate.domain;

import java.util.List;

public class OrderCommand {
	private int orderNum;
	private String orderDate;
	private int price;
	private String userID;
	private String bank;
	private String address;
	private List<GLineItemCommand> gLineItems;
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
	public List<GLineItemCommand> getgLineItems() {
		return gLineItems;
	}
	public void setgLineItems(List<GLineItemCommand> gLineItems) {
		this.gLineItems = gLineItems;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	
	public void getTotalPrice() {
		int i;
		productPrice = 0;
		for(i = 0; i < gLineItems.size(); i++) {
			productPrice += gLineItems.get(i).getPrice();
		}
	}
	
}
