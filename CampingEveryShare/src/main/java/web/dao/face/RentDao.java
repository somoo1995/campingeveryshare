package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Rent;
import web.util.Paging;

public interface RentDao {
	
//	public int selectCntAll(Paging param, String loginId);

	public List<Rent> selectRentByRentStatus(Paging paging);

	public int selectCntAll(Map<String, Object> map);



}
