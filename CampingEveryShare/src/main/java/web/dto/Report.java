package web.dto;

import java.util.Date;

public class Report {

	private int report_no;
	private int board_no;
	private int reason;
	private String reason_detail;
	private int vuser_no;
	private int ruser_no;
	private int board_cate;
	private Date report_date;
	
	public Report() {}

	public Report(int report_no, int board_no, int reason, String reason_detail, int vuser_no, int ruser_no,
			int board_cate, Date report_date) {
		super();
		this.report_no = report_no;
		this.board_no = board_no;
		this.reason = reason;
		this.reason_detail = reason_detail;
		this.vuser_no = vuser_no;
		this.ruser_no = ruser_no;
		this.board_cate = board_cate;
		this.report_date = report_date;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", board_no=" + board_no + ", reason=" + reason + ", reason_detail="
				+ reason_detail + ", vuser_no=" + vuser_no + ", ruser_no=" + ruser_no + ", board_cate=" + board_cate
				+ ", report_date=" + report_date + "]";
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getReason() {
		return reason;
	}

	public void setReason(int reason) {
		this.reason = reason;
	}

	public String getReason_detail() {
		return reason_detail;
	}

	public void setReason_detail(String reason_detail) {
		this.reason_detail = reason_detail;
	}

	public int getVuser_no() {
		return vuser_no;
	}

	public void setVuser_no(int vuser_no) {
		this.vuser_no = vuser_no;
	}

	public int getRuser_no() {
		return ruser_no;
	}

	public void setRuser_no(int ruser_no) {
		this.ruser_no = ruser_no;
	}

	public int getBoard_cate() {
		return board_cate;
	}

	public void setBoard_cate(int board_cate) {
		this.board_cate = board_cate;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	
	
}
