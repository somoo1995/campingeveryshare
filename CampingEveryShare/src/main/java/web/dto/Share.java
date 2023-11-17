package web.dto;

public class Share {

	private int boardNo;
	private int paid;
	
	public Share() {}

	public Share(int boardNo, int paid) {
		super();
		this.boardNo = boardNo;
		this.paid = paid;
	}

	@Override
	public String toString() {
		return "Share [boardNo=" + boardNo + ", paid=" + paid + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getPaid() {
		return paid;
	}

	public void setPaid(int paid) {
		this.paid = paid;
	}
	
	
	
}
