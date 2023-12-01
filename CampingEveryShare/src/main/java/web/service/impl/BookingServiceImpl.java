package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.RentDao;
import web.service.face.BookingService;
import web.util.Paging;

@Service
public class BookingServiceImpl implements BookingService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RentDao rentDao;

	@Override
	public Paging getPaging(Paging param, String status, String userId) {
		
		param.setSearch(userId);
		
		
		if( status != null && status.equals("now") ) {
			param.setCategory(0);

		} else if (status != null && status.equals("history")) {
			param.setCategory(1);
		} else if (status != null && status.equals("cancel")) {
			param.setCategory(2);
		}
		
		logger.info("param : {}", param);
		
		int totalCount = rentDao.selectCntAll(param);
		Paging paging = new Paging( totalCount, param.getCurPage(), 5, 10 );
		paging.setCategory(param.getCategory());
		paging.setSearch(userId);
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> getList(Paging paging) {
		
		List<Map<String, Object>> list = rentDao.selectAllByRentStatus(paging);
		
		return list;
	}



}
