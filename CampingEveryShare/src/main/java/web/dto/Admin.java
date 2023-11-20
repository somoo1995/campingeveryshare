package web.dto;

public class Admin {
	
	private String adminCode;
	private String adminPw;
	
	public Admin() {}

	@Override
	public String toString() {
		return "Admin [adminCode=" + adminCode + ", adminPw=" + adminPw + "]";
	}

	public Admin(String adminCode, String adminPw) {
		super();
		this.adminCode = adminCode;
		this.adminPw = adminPw;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
	

	
}
