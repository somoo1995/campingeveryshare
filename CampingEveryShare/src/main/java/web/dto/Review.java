package web.dto;

import java.util.Date;

public class Review {

	private int reviewNo;
	private int rentNo;
	private int userNo;
	private String content;
	private Date postDate;
	private int rate;
	private int deleteStatus;
	
	public Review() {}

	public Review(int reviewNo, int rentNo, int userNo, String content, Date postDate, int rate, int deleteStatus) {
		super();
		this.reviewNo = reviewNo;
		this.rentNo = rentNo;
		this.userNo = userNo;
		this.content = content;
		this.postDate = postDate;
		this.rate = rate;
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", rentNo=" + rentNo + ", userNo=" + userNo + ", content=" + content
				+ ", postDate=" + postDate + ", rate=" + rate + ", deleteStatus=" + deleteStatus + "]";
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
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

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
