package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
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

	@Override
	public Board noticeView(Board board) {
		Board boardtb = noticeDao.selectBoardView(board);
		noticeDao.hit(board);
		return boardtb;
	}
	
	@Override
	public void noticeWrite(Board board) {
	
		if( board.getTitle() == null || "".equals(board.getTitle())) {
			board.setTitle("(제목없음)");
		}			
	
		noticeDao.insertNoticeWrite(board);
	}
	
	@Override
	public Admin getAdminCode(Admin admin) {

		Admin adminCode = noticeDao.selectByAdminCode(admin);
		
		return adminCode;
	}
	
	@Override
	public Board view(Board board) {
		
		if( board.getHit() != -1 ) {
			noticeDao.hit(board);
		}
		
		return noticeDao.selectBoardView(board);
	}

	@Override
	public void updateProc(Board board) {
		
		if( board.getTitle() == null || "".equals(board.getTitle())) {
			board.setTitle("(제목없음)");
		}			
	
		noticeDao.updateProc(board);		
	}
	
	@Override
	public void delete(Board board) {
		noticeDao.deleteByBoardNo(board);
	}

	@Override
	public boolean deleteStatus(Board board) {
		
		int status = noticeDao.checkStatus(board);
		
		if(status > 0) {
		noticeDao.statusToOne(board);
		
			return false;
			
		} else {
			noticeDao.statusToZero(board);
			
			return true;
		}
	}

	@Override
	public boolean status(Board board) {
		
		int status = noticeDao.checkStatus(board);
		
		if(status>0) {
			return true;
		}
		return false;


	}

}



