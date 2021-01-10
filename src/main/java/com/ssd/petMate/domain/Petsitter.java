package com.ssd.petMate.domain;

public class Petsitter {
	private String boardNum;
	private String boardDate;
	private String userID;
//	@NotEmpty
	private String boardContent;
	private String petSize;
//	@NotEmpty
	private String petLocal;
	private int petPrice;
	private String petDay;
	private int boardLike;
//	@NotEmpty
	private String boardTitle;
	private int replyCnt;
	private int boardHit;
	private String petAddress;
	private String isSelected;
	private String[] sizeCodes;
	private String[] dayCodes;
	
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
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
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
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
	public String getIsSelected() {
		return isSelected;
	}
	public void setIsSelected(String isSelected) {
		this.isSelected = isSelected;
	}	
	public String getPetAddress() {
		return petAddress;
	}
	public void setPetAddress(String petAddress) {
		this.petAddress = petAddress;
	}
	public String sizeCheck(int sizeNum) {
		String result = "";
		if ((sizeNum & 1) != 0)
			result += "소형 ";
		if ((sizeNum & 2) != 0)
			result += "중형 ";
		if ((sizeNum & 4) != 0)
			result += "대형 ";
		
		return result;
	}
	
	public String dayCheck(int dayNum) {
		String result = "";
		if ((dayNum & 1) != 0)
			result += "월요일 ";
		if ((dayNum & 2) != 0)
			result += "화요일 ";
		if ((dayNum & 4) != 0)
			result += "수요일 ";
		if ((dayNum & 8) != 0)
			result += "목요일 ";
		if ((dayNum & 16) != 0)
			result += "금요일 ";
		if ((dayNum & 32) != 0)
			result += "토요일 ";
		if ((dayNum & 64) != 0)
			result += "일요일 ";
		
		return result;
	}
	@Override
	public String toString() {
		return "Petsitter [isSelected=" + isSelected + "]";
	}
}