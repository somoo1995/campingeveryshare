package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Rent;

public interface RentDao {
	
	public int selectCntAll(Map<String, Object> map);

	public List<Map<String, Object>> selectAllByRentStatus(Map<String, Object> map);

	public List<Rent> selectAllByCarNo(Car car);



}