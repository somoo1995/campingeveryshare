package web.dto;

public class Group {

	private int recruitStatus;
	private int boardNo;
	
	public Group() {}

	public Group(int recruitStatus, int boardNo) {
		super();
		this.recruitStatus = recruitStatus;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Group [recruitStatus=" + recruitStatus + ", boardNo=" + boardNo + "]";
	}

	public int getRecruitStatus() {
		return recruitStatus;
	}

	public void setRecruitStatus(int recruitStatus) {
		this.recruitStatus = recruitStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	
	
	
	
}
