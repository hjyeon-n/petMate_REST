package com.ssd.petMate.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class Order {
	private int orderNum;
	private String orderDate;
	private int price;
	private String userID;
	private String bank;
	@Pattern(regexp="\\d{4}-\\d{4}-\\d{4}-\\d{4}$")
	private String cardNum;
	@Pattern(regexp="\\d{3}$")
	private String cvc;
	@NotBlank
	private String address;
	@Pattern(regexp="^(0[1-9]|1[0-2])([\\/])([1-9][0-9])$")
	private String expireDate;
	
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
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	
}
