package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import web.dao.face.GroupDao;
import web.dto.Board;
import web.dto.Group;
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
	public List<Map<String, Object>> list(Paging paging) {

		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
		
		 // 1. 게시글 목록 조회
		mapList = groupDao.selectBoardList(paging);
	      
	    // 2. 페이징 정보 계산
	    Paging calculatedPaging = getPaging(paging);

		return mapList;
	}

	@Override
	public int viewHit(Board board) {
		return groupDao.updateHit(board);
	}

	@Override
	public Map<String, Object> view(Board board) {
		
		Map<String, Object> mapView = new HashMap<>();
		
		 // 1. 게시글 목록 조회
		mapView = groupDao.selectBoardView(board);
		
		return mapView;
	      
	}

	@Override
	public Map<String, Object> content(Board board) {
		
		Map<String, Object> contentView = new HashMap<>();
		
		//게시글 내용 조회
		contentView = groupDao.selectByContent(board);
		
		return contentView;
	}

	@Override
	public Map<String, Object> recruit(Group group) {
		
		Map<String, Object> groupView = new HashMap<>();
		
		//모집현황 조회
		groupView = groupDao.selectByRecruit(group);
		
		return groupView;
	}
	
//	@Override
//	public void write(Board writeParam) {
//		
//		if( writeParam.getTitle() == null || "".equals(writeParam.getTitle()) ) {
//			writeParam.setTitle("(제목없음)");
//		}
//		
//		groupDao.insert( writeParam );
//	}	
	
	public void write(Board writeParam, Group groupParam) {
	    writeParam.setTitle(writeParam.getTitle() == null || writeParam.getTitle().isEmpty() ? "(제목없음)" : writeParam.getTitle());
	    writeParam.setContent(writeParam.getContent() == null || writeParam.getContent().isEmpty() ? "(내용없음)" : writeParam.getContent());
	   
	    groupDao.insert(writeParam);
	    groupParam.setBoardNo(writeParam.getBoardNo());
	    groupDao.insertGroup(groupParam);
	}

	






	







	


	

}