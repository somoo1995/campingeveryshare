package web.dto;

public class Notification {

    private String message;

    // 생성자, getter, setter 등 필요한 메서드 추가
    public Notification() {}

    public Notification(String message) {
        this.message = message;
    }

	@Override
	public String toString() {
		return "Notification [message=" + message + "]";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
    
    
    
}
