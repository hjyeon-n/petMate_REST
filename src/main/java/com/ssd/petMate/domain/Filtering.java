package com.ssd.petMate.domain;

public class Filtering {
	private String[] sizeList;
	private String[] dayList;
	private String[] priceList;
	private String[] localList;
	
	public String[] getSizeList() {
		return sizeList;
	}
	public void setSizeList(String[] sizeList) {
		this.sizeList = sizeList;
	}
	public String[] getDayList() {
		return dayList;
	}
	public void setDayList(String[] dayList) {
		this.dayList = dayList;
	}
	public String[] getPriceList() {
		return priceList;
	}
	public void setPriceList(String[] priceList) {
		this.priceList = priceList;
	}
	public String[] getLocalList() {
		return localList;
	}
	public void setLocalList(String[] localList) {
		this.localList = localList;
	} 
}
