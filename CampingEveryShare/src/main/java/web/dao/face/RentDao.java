package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Rent;
import web.dto.User;
import web.util.Paging;

public interface RentDao {
	
	public List<Rent> selectAllByCarNo(Car car);

	public void insertRent(Rent rent);

	public User selectUserByUserId(User user);

	public void updateCancel(Rent rent);

	public int selectCntAll(Paging param);

	public List<Map<String, Object>> selectAllByRentStatus(Paging paging);



}