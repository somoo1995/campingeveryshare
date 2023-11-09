package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.GroupDao;
import web.dto.Board;
import web.dto.User;
import web.service.face.GroupService;
import web.util.Paging;

@Service
public class GroupServiceImpl implements GroupService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired private GroupDao groupDao;

	@Override
	public Paging getPaging(Paging param) {
		
		//총 게시글 수 조회
		int totalCount = groupDao.selectCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging( totalCount, param.getCurPage() );
		return paging;
	}

	@Override
	public Map<String, Object> list(Paging paging) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		 // 1. 게시글 목록 조회
	    List<Board> boardList = groupDao.selectBoardList(paging);
	    
	    List<User> userNickList = groupDao.selectUserNick(paging);
	    

	    // 2. 페이징 정보 계산
	    Paging calculatedPaging = getPaging(paging);

	    // 3. "list" 키에 게시글 목록 추가
	    map.put("list", boardList);

	    // "paging" 키에 페이징 정보 추가
	    map.put("paging", calculatedPaging);
	    
	    map.put("usernickList", userNickList);

//	    map.put("userNick", userNick);
			
		return map;
	}


	@Override
	public Board view(Board board) {
		
		//조회수 증가
		groupDao.updateHit(board);
	
		return groupDao.selectByBoardNo(board);
	}



	


	

}