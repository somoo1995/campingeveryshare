package web.dto;

import java.util.Date;

public class Account {
	
	private int account;
	private int userNo;
	private int bandAccount;
	private String bankName;
	private Date bankDate;
	
	public Account() {}

	public Account(int account, int userNo, int bandAccount, String bankName, Date bankDate) {
		super();
		this.account = account;
		this.userNo = userNo;
		this.bandAccount = bandAccount;
		this.bankName = bankName;
		this.bankDate = bankDate;
	}

	@Override
	public String toString() {
		return "account [account=" + account + ", userNo=" + userNo + ", bandAccount=" + bandAccount + ", bankName="
				+ bankName + ", bankDate=" + bankDate + "]";
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBandAccount() {
		return bandAccount;
	}

	public void setBandAccount(int bandAccount) {
		this.bandAccount = bandAccount;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Date getBankDate() {
		return bankDate;
	}

	public void setBankDate(Date bankDate) {
		this.bankDate = bankDate;
	}
	
	
	
	
}
