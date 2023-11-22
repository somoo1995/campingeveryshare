package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int reviewNo;
	private int carNo;
	private String userId;
	private String content;
	private Date postDate;
	private double rate;
	private int deleteStatus;

}
