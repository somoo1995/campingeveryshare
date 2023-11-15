package web.dto;

public class Group {

	private int groupNo;
	private int recruitStatus;
	private int boardNo;
	
	public Group() {}

	public Group(int groupNo, int recruitStatus, int boardNo) {
		super();
		this.groupNo = groupNo;
		this.recruitStatus = recruitStatus;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "GroupTb [groupNo=" + groupNo + ", recruitStatus=" + recruitStatus + ", boardNo=" + boardNo + "]";
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
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
