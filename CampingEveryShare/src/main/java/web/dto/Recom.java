package web.dto;

public class Recom {

	private String userId;
	private int recomNo;
	private int boardCate;
	
	public Recom() {}

	public Recom(String userId, int recomNo, int boardCate) {
		super();
		this.userId = userId;
		this.recomNo = recomNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "Recom [userId=" + userId + ", recomNo=" + recomNo + ", boardCate=" + boardCate + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRecomNo() {
		return recomNo;
	}

	public void setRecomNo(int recomNo) {
		this.recomNo = recomNo;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	
	
}
