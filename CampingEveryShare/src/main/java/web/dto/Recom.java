package web.dto;

public class Recom {

	private int userNo;
	private int recoNo;
	private int boardCate;
	
	public Recom() {}

	public Recom(int userNo, int recoNo, int boardCate) {
		super();
		this.userNo = userNo;
		this.recoNo = recoNo;
		this.boardCate = boardCate;
	}

	@Override
	public String toString() {
		return "Recom [userNo=" + userNo + ", recoNo=" + recoNo + ", boardCate=" + boardCate + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
