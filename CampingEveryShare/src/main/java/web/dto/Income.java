package web.dto;

import java.util.Date;

public class Income {

	private int incomeNo;
	private int rentNo;
	private int amount;
	private int incomeStatus;
	private Date postDate;
	
	public Income() {}

	public Income(int incomeNo, int rentNo, int amount, int incomeStatus, Date postDate) {
		super();
		this.incomeNo = incomeNo;
		this.rentNo = rentNo;
		this.amount = amount;
		this.incomeStatus = incomeStatus;
		this.postDate = postDate;
	}

	@Override
	public String toString() {
		return "Income [incomeNo=" + incomeNo + ", rentNo=" + rentNo + ", amount=" + amount + ", incomeStatus="
				+ incomeStatus + ", postDate=" + postDate + "]";
	}

	public int getIncomeNo() {
		return incomeNo;
	}

	public void setIncomeNo(int incomeNo) {
		this.incomeNo = incomeNo;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getIncomeStatus() {
		return incomeStatus;
	}

	public void setIncomeStatus(int incomeStatus) {
		this.incomeStatus = incomeStatus;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

}
