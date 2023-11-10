package web.dto;

import java.util.Date;

public class Comm {

	private int commNo;
	private int boardNo;
	private String userId;
	private String content;
	private Date postDate;
	
	public Comm() {}

	public Comm(int commNo, int boardNo, String userId, String content, Date postDate) {
		super();
		this.commNo = commNo;
		this.boardNo = boardNo;
		this.userId = userId;
		this.content = content;
		this.postDate = postDate;
	}

	@Override
	public String toString() {
		return "Comm [commNo=" + commNo + ", boardNo=" + boardNo + ", userId=" + userId + ", content=" + content
				+ ", postDate=" + postDate + "]";
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	
	
	
}
