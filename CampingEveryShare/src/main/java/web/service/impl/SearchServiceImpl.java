package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CarDao;
import web.dao.face.GroupDao;
import web.dao.face.MarketDao;
import web.dao.face.SearchDao;
import web.dao.face.ShareDao;
import web.service.face.SearchService;
import web.util.Paging;

@Service
public class SearchServiceImpl implements SearchService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired SearchDao searchDao;
	@Autowired CarDao carDao;
	@Autowired ShareDao shareDao;
	@Autowired MarketDao marketDao;
	@Autowired GroupDao groupDao;
	
	@Override
	public Paging getPaging(Paging param, String query) {
		param.setSearch(query);
		
		int totalCount = 0;
		Paging paging = null;
		
		if(param.getCategory() == 1) {
			totalCount = searchDao.selectCntCar(param);
			paging = new Paging( totalCount, param.getCurPage(), 9, 10 );
		} else if (param.getCategory() == 4) {
			totalCount = searchDao.selectCntAll(param);
			paging = new Paging( totalCount, param.getCurPage(), 15, 10 );
		} else {
			totalCount = searchDao.selectCntAll(param);
			paging = new Paging( totalCount, param.getCurPage(), 9, 10 );
		}
				
		paging.setCategory(param.getCategory());
		paging.setSearch(param.getSearch());
		
		return paging;
		
	}

	@Override
	public List<Map<String, Object>> getList(Paging paging) {
		
		List<Map<String, Object>> list = null;
		
		if (paging.getCategory() == 1) {
			list = carDao.selectAll(paging);
		} else if (paging.getCategory() == 2) {
			list = shareDao.selectShareAll(paging);
		} else if (paging.getCategory() == 3) {
			list = marketDao.selectMarketAll(paging);
		} else {
			list = groupDao.selectGroupAll(paging);
		}
		
		return list;
	}
	

	
}
