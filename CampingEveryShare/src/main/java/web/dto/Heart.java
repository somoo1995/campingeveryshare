package web.dto;

public class Heart {

	private String userId;
	private int heartNo;
	private int boardCate;
	
	public Heart() {}

	public Heart(String userId, int heartNo, int boardCate) {
		super();
		this.userId = userId;
		this.heartNo = heartNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "Heart [userId=" + userId + ", heartNo=" + heartNo + ", boardCate=" + boardCate + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	
	
}
