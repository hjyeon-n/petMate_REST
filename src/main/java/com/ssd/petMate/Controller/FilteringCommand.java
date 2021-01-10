package com.ssd.petMate.Controller;

import java.util.Arrays;

public class FilteringCommand {
	private String petSize;
	private String petLocal;
	private int petPrice;
	private String petDay;
	private String[] sizeCodes;
	private String[] dayCodes;
	
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	public String getPetLocal() {
		return petLocal;
	}
	public void setPetLocal(String petLocal) {
		this.petLocal = petLocal;
	}
	public int getPetPrice() {
		return petPrice;
	}
	public void setPetPrice(int petPrice) {
		this.petPrice = petPrice;
	}
	public String getPetDay() {
		return petDay;
	}
	public void setPetDay(String petDay) {
		this.petDay = petDay;
	}
	public String[] getSizeCodes() {
		return sizeCodes;
	}
	public void setSizeCodes(String[] sizeCodes) {
		this.sizeCodes = sizeCodes;
	}
	public String[] getDayCodes() {
		return dayCodes;
	}
	public void setDayCodes(String[] dayCodes) {
		this.dayCodes = dayCodes;
	}
	@Override
	public String toString() {
		return "FilteringCommand [petSize=" + petSize + ", petLocal=" + petLocal + ", petPrice=" + petPrice
				+ ", petDay=" + petDay + ", sizeCodes=" + Arrays.toString(sizeCodes) + ", dayCodes="
				+ Arrays.toString(dayCodes) + "]";
	}
	
}
