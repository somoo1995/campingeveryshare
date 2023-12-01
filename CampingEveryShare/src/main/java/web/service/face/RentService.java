package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.BoardFile;
import web.dto.Car;
import web.dto.Income;
import web.dto.Rent;
import web.dto.Review;
import web.dto.User;
import web.util.Paging;

public interface RentService {

	public Paging getPaging(Paging param, String location);

	public List<Map<String, Object>> getCarList(Paging paging);

	public Car view(Car car);

	public List<Rent> getRentList(Car car);

	public void book(Rent rent);

	public User getGuestInfo(User user);

	public void cancelBooking(Rent rent);

	public Map<String, Object> getReviewInfo(Car car);

	public int checkHeart(Car car);

	public BoardFile getFileInfo(Car car);

//	public void income(Income income);


}
