package web.dto;

import java.util.Date;

public class Income {

	private int incomeNo;
	private int rentNo;
	private int account;
	private int money;
	private Date moneyDate;
	private int moneyCate;
	
	public Income() {}

	public Income(int incomeNo, int rentNo, int account, int money, Date moneyDate, int moneyCate) {
		super();
		this.incomeNo = incomeNo;
		this.rentNo = rentNo;
		this.account = account;
		this.money = money;
		this.moneyDate = moneyDate;
		this.moneyCate = moneyCate;
	}

	@Override
	public String toString() {
		return "Income [incomeNo=" + incomeNo + ", rentNo=" + rentNo + ", account=" + account + ", money=" + money
				+ ", moneyDate=" + moneyDate + ", moneyCate=" + moneyCate + "]";
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

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getMoneyDate() {
		return moneyDate;
	}

	public void setMoneyDate(Date moneyDate) {
		this.moneyDate = moneyDate;
	}

	public int getMoneyCate() {
		return moneyCate;
	}

	public void setMoneyCate(int moneyCate) {
		this.moneyCate = moneyCate;
	}
	
	
	
}
