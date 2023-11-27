package web.dto;

import java.util.Date;

import lombok.Data;

@Data
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
	private String merchantUid;

}
