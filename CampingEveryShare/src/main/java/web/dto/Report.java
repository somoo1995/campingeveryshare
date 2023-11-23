package web.dto;

import java.util.Date;

public class Report {

	private int reportNo;
	private int boardNo;
	private int reason;
	private String reasonDetail;
	private String vuserId;
	private String ruserId;
	private int boardCate;
	private Date reportDate;
	
	public Report() {}

	public Report(int reportNo, int boardNo, int reason, String reasonDetail, String vuserId, String ruserId,
			int boardCate, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.boardNo = boardNo;
		this.reason = reason;
		this.reasonDetail = reasonDetail;
		this.vuserId = vuserId;
		this.ruserId = ruserId;
		this.boardCate = boardCate;
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", boardNo=" + boardNo + ", reason=" + reason + ", reasonDetail="
				+ reasonDetail + ", vuserId=" + vuserId + ", ruserId=" + ruserId + ", boardCate=" + boardCate
				+ ", reportDate=" + reportDate + "]";
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReason() {
		return reason;
	}

	public void setReason(int reason) {
		this.reason = reason;
	}

	public String getReasonDetail() {
		return reasonDetail;
	}

	public void setReasonDetail(String reasonDetail) {
		this.reasonDetail = reasonDetail;
	}

	public String getVuserId() {
		return vuserId;
	}

	public void setVuserId(String vuserId) {
		this.vuserId = vuserId;
	}

	public String getRuserId() {
		return ruserId;
	}

	public void setRuserId(String ruserId) {
		this.ruserId = ruserId;
	}

	public int getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(int boardCate) {
		this.boardCate = boardCate;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	
	
}
