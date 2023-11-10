package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.RentDao;
import web.dto.Rent;
import web.service.face.BookingService;
import web.util.Paging;

@Service
public class BookingServiceImpl implements BookingService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RentDao rentDao;

	@Override
	public Paging getPaging(Paging param, String status, Rent rent) {
		
		if( status != null && status.equals("now") ) {
//			param.setStatus(0);
			rent.setRentStatus(0);
		} else if (status != null && status.equals("history")) {
//			param.setStatus(1);
			rent.setRentStatus(1);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("param", param);
		map.put("rent", rent);
		
		logger.info("map : {}", map);
		
		int totalCount = rentDao.selectCntAll(map);
		logger.info("totalCount : ", totalCount);
		Paging paging = new Paging( totalCount, param.getCurPage() );
		
		return paging;
		
	}
	
	@Override
	public List<Rent> getList(Paging paging) {
		
		List<Rent> list = rentDao.selectRentByRentStatus(paging);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getList(Paging paging, Rent rent) {
		// TODO Auto-generated method stub
		return null;
	}



}