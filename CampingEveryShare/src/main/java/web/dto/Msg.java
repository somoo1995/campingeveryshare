package web.dto;

import java.util.Date;

public class Msg {

	private int msgNo;
	private int writerNo;
	private int receiverNo;
	private Date postDate;
	private String content;
	private int msgStatus;
	private int boardCate;
	private int boardNo;
	
	public Msg() {}

	public Msg(int msgNo, int writerNo, int receiverNo, Date postDate, String content, int msgStatus, int boardCate,
			int boardNo) {
		super();
		this.msgNo = msgNo;
		this.writerNo = writerNo;
		this.receiverNo = receiverNo;
		this.postDate = postDate;
		this.content = content;
		this.msgStatus = msgStatus;
		this.boardCate = boardCate;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Msg [msgNo=" + msgNo + ", writerNo=" + writerNo + ", receiverNo=" + receiverNo + ", postDate="
				+ postDate + ", content=" + content + ", msgStatus=" + msgStatus + ", boardCate=" + boardCate
				+ ", boardNo=" + boardNo + "]";
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
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
