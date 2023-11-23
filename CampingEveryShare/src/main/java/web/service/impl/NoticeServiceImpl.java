package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.service.face.NoticeService;
import web.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired NoticeDao noticeDao;

	@Override
	public List<Map<String, Object>> list(Paging paging) {

		List<Map<String, Object>> list = noticeDao.selectNoticeAll(paging);
		
		return list;
	}

	@Override
	public Paging getPaging(Paging param) {

		int totalCount = noticeDao.selectCntAll();

		Paging paging = new Paging(totalCount, param.getCurPage(), 9, param.getPageCount());
		
		return paging;
	}


}



