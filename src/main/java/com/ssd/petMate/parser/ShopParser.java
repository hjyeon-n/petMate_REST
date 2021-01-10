package com.ssd.petMate.parser;

public class ShopParser {
	private String title;
	private String image;
	private String lprice;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLprice() {
		return lprice;
	}
	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	public ShopParser(String title, String image, String lprice) {
		super();
		this.title = title;
		this.image = image;
		this.lprice = lprice;
	}	
}