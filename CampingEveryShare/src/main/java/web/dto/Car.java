package web.dto;


import lombok.Data;

@Data
public class Car {
	
	private int carNo;
	private String userId;
	private String carName;
	private String carNumber;
	private int carSize;
	private int location;
	private int area;
	private String areaDetail;
	private String pickupTimeStart,pickupTimeEnd;
	private String content;
	private int carPax;
	private int carSpax;
	private int carBeds;
	private int price;
	private int extraPrice;
	private int carElec,carWater,carTable,carSink,carKitchen,carTemp,carShower,
	carToilet,carPet,carSmoke;
	private int carStatus;
	private int deleteStatus;

	
}
