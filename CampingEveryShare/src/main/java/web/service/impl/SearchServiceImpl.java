package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.SearchDao;
import web.dto.Board;
import web.service.face.SearchService;
import web.util.Paging;

@Service
public class SearchServiceImpl implements SearchService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired SearchDao searchDao;
	
	@Override
	public Paging getPaging(Paging param, String query) {
		
		param.setSearch(query);
		
		int totalCount = searchDao.selectCntAll(param);
		Paging paging = new Paging( totalCount, param.getCurPage(), 20, 10 );
		
		paging.setCategory(param.getCategory());
		paging.setSearch(param.getSearch());
		
		return paging;
		
	}

	@Override
	public List<Board> getList(Paging paging) {
		
		return searchDao.selectBySearch(paging);
	}
	

	
}
