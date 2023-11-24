package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Admin;
import web.dto.User;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminDao adminDao;
	
	
	@Override
	public boolean loginCheck(Admin admin) {
		
		int loginChk = adminDao.selectCntAdmin(admin);
        if( loginChk > 0)
        	return true;
        return false;
	}

	
	@Override
	public Admin loginInfo(Admin admin) {
		return adminDao.selectInfo(admin);
	}
	

	@Override
	public Paging getPaging(Paging param) {
		
		int totalCount = adminDao.selectCntAll(param);

		//페이징 객체 생성
		//페이징 계산하기
		Paging paging = new Paging(totalCount, param.getCurPage());
		paging.setSearch(param.getSearch());	 // 검색어 설정
		paging.setCategory(param.getCategory()); // 추가된 부분: 게시판 카테고리 설정
		
//		String search = param.getSearch();
//		int category = param.getCategory();
//		logger.info("검색어: {}", search); // 로그로 검색어 확인
//		logger.info("검색 카테고리: {}", category); // 로그로 검색 카테고리 확인
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> list(Paging paging) {
		
		return adminDao.selectAll(paging);
	}

	@Override
	public List<Map<String, Object>> reportList(Paging paging) {
		
		return adminDao.selectAllReport(paging);
	}

	@Override
	public Paging getPagingReport(Paging param) {
		
		int totalCount = adminDao.selectCntAllReport(param);

		Paging paging = new Paging(totalCount, param.getCurPage());
		paging.setSearch(param.getSearch());
		paging.setCategory(param.getCategory()); // 추가된 부분: 게시판 카테고리 설정
		
//		String search = param.getSearch();
//		int category = param.getCategory();
//		logger.info("검색어: {}", search); // 로그로 검색어 확인
//		logger.info("검색어 카테고리: {}", category); // 로그로 검색어 카테고리 확인
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> incomeList(Paging paging) {
		
		return adminDao.selectAllIncome(paging);
	}

	@Override
	public Paging getPagingIncome(Paging param) {
		
		int totalCount = adminDao.selectCntAllIncome(param);

		Paging paging = new Paging(totalCount, param.getCurPage());
		paging.setSearch(param.getSearch());
		paging.setCategory(param.getCategory());

		return paging;
	}

	@Override
	public boolean adminIdCheck(String adminCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateUserStatus(String userId) {
		
	    User user = adminDao.selectById(userId);

		 // 사용자가 존재하고 일치하면 상태를 1로 업데이트
		    if (user != null) {
		        user.setUserStatus(1);
		        adminDao.updateUserStatus(user);
		        return true; // 삭제 성공
		    }

		    return false; // 사용자가 존재하지 않을 경우 삭제 실패
		}


	@Override
	public boolean joinIdCheck(String userId) {
		int idCheck = adminDao.selectCntUserId(userId);
		return idCheck <= 0;
	}

}
