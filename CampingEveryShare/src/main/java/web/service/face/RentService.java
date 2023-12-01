package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Income;
import web.dto.Rent;
import web.dto.Review;
import web.dto.User;
import web.util.Paging;

public interface RentService {

	public Paging getPaging(Paging param);

	public List<Map<String, Object>> getCarList(Paging paging);

	public Car view(Car car);

	public List<Rent> getRentList(Car car);

	public void book(Rent rent);

	public User getGuestInfo(User user);

	public void cancelBooking(Rent rent);

}
