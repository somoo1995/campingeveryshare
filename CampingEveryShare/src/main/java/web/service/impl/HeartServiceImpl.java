package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.HeartDao;
import web.dto.Board;
import web.service.face.HeartService;
import web.util.Paging;

@Service
public class HeartServiceImpl implements HeartService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired HeartDao heartDao;
	
	@Override
	public Paging getPaging(Paging param) {
		int totalCount = heartDao.selectCntAll(param);

		Paging paging = new Paging(totalCount, param.getCurPage(), 9, param.getPageCount());
		
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> list(Paging paging) {
		
		List<Map<String, Object>> list = heartDao.selectShareAll(paging);
		logger.info("list : {}" + list.toString());
		return list;
	}

}
