package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired BoardDao boardDao;

	@Override
	public Paging getPaging(Paging param) {
		
		int totalCount = boardDao.selectCntAllQna(param);

		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
		
	@Override
	public List<Map<String, Object>> qnaList(Paging paging) {
		
		return boardDao.selectAllQna(paging);
	}

}
