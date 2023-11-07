package web.dto;

public class Heart {

	private int userNo;
	private int boardNo;
	private int boardCate;
	
	public Heart() {}

	public Heart(int userNo, int boardNo, int boardCate) {
		super();
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "Heart [userNo=" + userNo + ", boardNo=" + boardNo + ", boardCate=" + boardCate + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}
	

	
}
