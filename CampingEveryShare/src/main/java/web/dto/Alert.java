package web.dto;

import java.util.Date;

public class Alert {

	private int alertNo;
	private int userNo;
	private String content;
	private Date postDate;
	private int alertStatus;
	private int boardCate;
	private int boardNo;
	
	public Alert() {}

	public Alert(int alertNo, int userNo, String content, Date postDate, int alertStatus, int boardCate, int boardNo) {
		super();
		this.alertNo = alertNo;
		this.userNo = userNo;
		this.content = content;
		this.postDate = postDate;
		this.alertStatus = alertStatus;
		this.boardCate = boardCate;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "alert [alertNo=" + alertNo + ", userNo=" + userNo + ", content=" + content + ", postDate=" + postDate
				+ ", alertStatus=" + alertStatus + ", boardCate=" + boardCate + ", boardNo=" + boardNo + "]";
	}

	public int getAlertNo() {
		return alertNo;
	}

	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getAlertStatus() {
		return alertStatus;
	}

	public void setAlertStatus(int alertStatus) {
		this.alertStatus = alertStatus;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
	
}
