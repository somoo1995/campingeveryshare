package web.dto;

import java.util.Date;

public class UserTb {

	private int userNo;
	private String userId;
	private String userPw;
	private String email;
	private String userName;
	private String userNick;
	private Date birth;
	private String address;
	private String addressDetail;
	private int phone;
	private int profile;
	private Date joinDate;
	private int userStatus;
	
	public UserTb() {}

	public UserTb(int userNo, String userId, String userPw, String email, String userName, String userNick, Date birth,
			String address, String addressDetail, int phone, int profile, Date joinDate, int userStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		this.userName = userName;
		this.userNick = userNick;
		this.birth = birth;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
		this.profile = profile;
		this.joinDate = joinDate;
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "UserTb [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", email=" + email
				+ ", userName=" + userName + ", userNick=" + userNick + ", birth=" + birth + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", phone=" + phone + ", profile=" + profile + ", joinDate="
				+ joinDate + ", userStatus=" + userStatus + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getProfile() {
		return profile;
	}

	public void setProfile(int profile) {
		this.profile = profile;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	
	
	
	
}
