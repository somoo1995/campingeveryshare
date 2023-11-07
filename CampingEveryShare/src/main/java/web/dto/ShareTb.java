package web.dto;

public class ShareTb {

	private int zoneNo;
	private int paid;
	private int boardNo;
	public ShareTb(int zoneNo, int paid, int boardNo) {
		super();
		this.zoneNo = zoneNo;
		this.paid = paid;
		this.boardNo = boardNo;
	}
	
	public ShareTb() {}

	@Override
	public String toString() {
		return "ShareTb [zoneNo=" + zoneNo + ", paid=" + paid + ", boardNo=" + boardNo + "]";
	}

	public int getZoneNo() {
		return zoneNo;
	}

	public void setZoneNo(int zoneNo) {
		this.zoneNo = zoneNo;
	}

	public int getPaid() {
		return paid;
	}

	public void setPaid(int paid) {
		this.paid = paid;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
	
}
