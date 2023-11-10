package web.dto;

public class Recom {

	private String userId;
	private int recoNo;
	private int boardCate;
	
	public Recom() {}

	public Recom(String userId, int recoNo, int boardCate) {
		super();
		this.userId = userId;
		this.recoNo = recoNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "Recom [userId=" + userId + ", recoNo=" + recoNo + ", boardCate=" + boardCate + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRecoNo() {
		return recoNo;
	}

	public void setRecoNo(int recoNo) {
		this.recoNo = recoNo;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	
	
	
}
