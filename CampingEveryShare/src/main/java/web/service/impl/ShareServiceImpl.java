package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ShareDao;
import web.dto.Board;
import web.service.face.ShareService;
import web.util.Paging;

@Service
public class ShareServiceImpl implements ShareService {

	@Autowired ShareDao shareDao;
	@Override
	public List<Map<String, Object>> list(Paging paging) {
		return shareDao.selectShareAll(paging);
	}

	@Override
	public Paging getPaging(Paging param) {

		int totalCount = shareDao.selectCntAll();

		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}

	@Override
	public List<Map<String,Object>> shareView(Board board) {

		List<Map<String,Object>> boardtb = shareDao.selectBoardView(board);
		shareDao.hit(board);
		
		return boardtb;
	}

}
