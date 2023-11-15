package web.dto;

import java.util.Date;

public class Rent {

	private int rentNo;
	private int carNo;
	private String userId;
	private int rentStatus;
	private Date bookingDate;
	private Date startDate;
	private Date endDate;
	private int reservPax;
	private int addOption;
	private int deleteStatus;
	
	public Rent() {}

	public Rent(int rentNo, int carNo, String userId, int rentStatus, Date bookingDate, Date startDate, Date endDate,
			int reservPax, int addOption, int deleteStatus) {
		super();
		this.rentNo = rentNo;
		this.carNo = carNo;
		this.userId = userId;
		this.rentStatus = rentStatus;
		this.bookingDate = bookingDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservPax = reservPax;
		this.addOption = addOption;
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", carNo=" + carNo + ", userId=" + userId + ", rentStatus=" + rentStatus
				+ ", bookingDate=" + bookingDate + ", startDate=" + startDate + ", endDate=" + endDate + ", reservPax="
				+ reservPax + ", addOption=" + addOption + ", deleteStatus=" + deleteStatus + "]";
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRentStatus() {
		return rentStatus;
	}

	public void setRentStatus(int rentStatus) {
		this.rentStatus = rentStatus;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getReservPax() {
		return reservPax;
	}

	public void setReservPax(int reservPax) {
		this.reservPax = reservPax;
	}

	public int getAddOption() {
		return addOption;
	}

	public void setAddOption(int addOption) {
		this.addOption = addOption;
	}

	public int getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
