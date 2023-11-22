package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Rent;
import web.dto.Review;
import web.dto.User;

public interface RentDao {
	
	public int selectCntAll(Map<String, Object> map);

	public List<Map<String, Object>> selectAllByRentStatus(Map<String, Object> map);

	public List<Rent> selectAllByCarNo(Car car);

	public void insertRent(Rent rent);

	public User selectUserByUserId(User user);



}