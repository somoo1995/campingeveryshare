package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Rent;
import web.util.Paging;

public interface BookingService {

	public Paging getPaging(Paging param, String status, Rent rent);

	public List<Rent> getList(Paging paging);

	public List<Map<String, Object>> getList(Paging paging, Rent rent);

	


}
