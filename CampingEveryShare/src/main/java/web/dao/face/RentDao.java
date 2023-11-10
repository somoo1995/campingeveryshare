package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Rent;
import web.util.Paging;

public interface RentDao {
	
	public int selectCntAll(Map<String, Object> map);

	public List<Map<String, Object>> selectAllByRentStatus(Map<String, Object> map);



}