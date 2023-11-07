package web.dto;

import java.util.Date;

public class Rent {

	private int rentNo;
	private int carNo;
	private int rentStatus;
	private Date startDate;
	private Date endDate;
	private Date submitDate;
	private int reservPerson;
	private int addoption;
	private int deleteStatus;
	
	public Rent() {}

	public Rent(int rentNo, int carNo, int rentStatus, Date startDate, Date endDate, Date submitDate, int reservPerson,
			int addoption, int deleteStatus) {
		super();
		this.rentNo = rentNo;
		this.carNo = carNo;
		this.rentStatus = rentStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.submitDate = submitDate;
		this.reservPerson = reservPerson;
		this.addoption = addoption;
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", carNo=" + carNo + ", rentStatus=" + rentStatus + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", submitDate=" + submitDate + ", reservPerson=" + reservPerson
				+ ", addoption=" + addoption + ", deleteStatus=" + deleteStatus + "]";
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

	public int getRentStatus() {
		return rentStatus;
	}

	public void setRentStatus(int rentStatus) {
		this.rentStatus = rentStatus;
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

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public int getReservPerson() {
		return reservPerson;
	}

	public void setReservPerson(int reservPerson) {
		this.reservPerson = reservPerson;
	}

	public int getAddoption() {
		return addoption;
	}

	public void setAddoption(int addoption) {
		this.addoption = addoption;
	}

	public int getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	
	
	
	
}
