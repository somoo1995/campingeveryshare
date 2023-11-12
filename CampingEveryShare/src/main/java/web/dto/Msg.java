package web.dto;

import java.util.Date;

public class Msg {

	private int msgNo;
	private String writerId;
	private String receiverId;
	private Date postDate;
	private String content;
	private int msgStatus;
	private int boardCate;
	private int boardNo;
	
	public Msg() {}

	public Msg(int msgNo, String writerId, String receiverId, Date postDate, String content, int msgStatus,
			int boardCate, int boardNo) {
		super();
		this.msgNo = msgNo;
		this.writerId = writerId;
		this.receiverId = receiverId;
		this.postDate = postDate;
		this.content = content;
		this.msgStatus = msgStatus;
		this.boardCate = boardCate;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Msg [msgNo=" + msgNo + ", writerId=" + writerId + ", receiverId=" + receiverId + ", postDate="
				+ postDate + ", content=" + content + ", msgStatus=" + msgStatus + ", boardCate=" + boardCate
				+ ", boardNo=" + boardNo + "]";
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
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
