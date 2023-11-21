package web.dto;

public class Car {
	
	private int carNo;
	private String userId;
	private String carName;
	private String carNumber;
	private int location;
	private int area;
	private String areaDetail;
	private int carSize;
	private int carPax;
	private int carSpax;
	private int price;
	private int carElec;
	private int carWater;
	private int carTable;
	private int carCounter;
	private int carKitchin;
	private int carTemp;
	private int carShower;
	private int carToilet;
	private int carPet;
	private int carSmoke;
	private int carStatus;
	private String content;
	private int deleteStatus;
	
	public Car() {}

	public Car(int carNo, String userId, String carName, String carNumber, int location, int area, String areaDetail,
			int carSize, int carPax, int carSpax, int price, int carElec, int carWater, int carTable, int carCounter,
			int carKitchin, int carTemp, int carShower, int carToilet, int carPet, int carSmoke, int carStatus,
			String content, int deleteStatus) {
		super();
		this.carNo = carNo;
		this.userId = userId;
		this.carName = carName;
		this.carNumber = carNumber;
		this.location = location;
		this.area = area;
		this.areaDetail = areaDetail;
		this.carSize = carSize;
		this.carPax = carPax;
		this.carSpax = carSpax;
		this.price = price;
		this.carElec = carElec;
		this.carWater = carWater;
		this.carTable = carTable;
		this.carCounter = carCounter;
		this.carKitchin = carKitchin;
		this.carTemp = carTemp;
		this.carShower = carShower;
		this.carToilet = carToilet;
		this.carPet = carPet;
		this.carSmoke = carSmoke;
		this.carStatus = carStatus;
		this.content = content;
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Car [carNo=" + carNo + ", userId=" + userId + ", carName=" + carName + ", carNumber=" + carNumber
				+ ", location=" + location + ", area=" + area + ", areaDetail=" + areaDetail + ", carSize=" + carSize
				+ ", carPax=" + carPax + ", carSpax=" + carSpax + ", price=" + price + ", carElec=" + carElec
				+ ", carWater=" + carWater + ", carTable=" + carTable + ", carCounter=" + carCounter + ", carKitchin="
				+ carKitchin + ", carTemp=" + carTemp + ", carShower=" + carShower + ", carToilet=" + carToilet
				+ ", carPet=" + carPet + ", carSmoke=" + carSmoke + ", carStatus=" + carStatus + ", content=" + content
				+ ", deleteStatus=" + deleteStatus + "]";
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

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getAreaDetail() {
		return areaDetail;
	}

	public void setAreaDetail(String areaDetail) {
		this.areaDetail = areaDetail;
	}

	public int getCarSize() {
		return carSize;
	}

	public void setCarSize(int carSize) {
		this.carSize = carSize;
	}

	public int getCarPax() {
		return carPax;
	}

	public void setCarPax(int carPax) {
		this.carPax = carPax;
	}

	public int getCarSpax() {
		return carSpax;
	}

	public void setCarSpax(int carSpax) {
		this.carSpax = carSpax;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCarElec() {
		return carElec;
	}

	public void setCarElec(int carElec) {
		this.carElec = carElec;
	}

	public int getCarWater() {
		return carWater;
	}

	public void setCarWater(int carWater) {
		this.carWater = carWater;
	}

	public int getCarTable() {
		return carTable;
	}

	public void setCarTable(int carTable) {
		this.carTable = carTable;
	}

	public int getCarCounter() {
		return carCounter;
	}

	public void setCarCounter(int carCounter) {
		this.carCounter = carCounter;
	}

	public int getCarKitchin() {
		return carKitchin;
	}

	public void setCarKitchin(int carKitchin) {
		this.carKitchin = carKitchin;
	}

	public int getCarTemp() {
		return carTemp;
	}

	public void setCarTemp(int carTemp) {
		this.carTemp = carTemp;
	}

	public int getCarShower() {
		return carShower;
	}

	public void setCarShower(int carShower) {
		this.carShower = carShower;
	}

	public int getCarToilet() {
		return carToilet;
	}

	public void setCarToilet(int carToilet) {
		this.carToilet = carToilet;
	}

	public int getCarPet() {
		return carPet;
	}

	public void setCarPet(int carPet) {
		this.carPet = carPet;
	}

	public int getCarSmoke() {
		return carSmoke;
	}

	public void setCarSmoke(int carSmoke) {
		this.carSmoke = carSmoke;
	}

	public int getCarStatus() {
		return carStatus;
	}

	public void setCarStatus(int carStatus) {
		this.carStatus = carStatus;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	
}
