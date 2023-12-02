package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Admin;
import web.dto.Board;
import web.dto.Car;
import web.dto.Income;
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
		Paging paging = new Paging(totalCount, param.getCurPage(), 10, 4);
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

		Paging paging = new Paging(totalCount, param.getCurPage(), 10, 4);
		paging.setSearch(param.getSearch());
		paging.setCategory(param.getCategory()); // 추가된 부분: 게시판 카테고리 설정
		
		return paging;
	}

	@Override
	public List<Map<String, Object>> incomeList(Paging paging) {
		
		return adminDao.selectAllIncome(paging);
	}

	@Override
	public Paging getPagingIncome(Paging param) {
		
		int totalCount = adminDao.selectCntAllIncome(param);

		Paging paging = new Paging(totalCount, param.getCurPage(), 10, 4);
		paging.setSearch(param.getSearch());

		return paging;
	}

	@Override
	public boolean adminIdCheck(String adminCode) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean joinIdCheck(String userId) {
		int idCheck = adminDao.selectCntUserId(userId);
		return idCheck <= 0;
	}


	@Override
	public boolean deleteUserStatus(User user) {
		
		logger.info("user user 가기 전: {}", user);
		
		int status = adminDao.checkStatus(user);
		
		logger.info("user user 간 후: {}", user);
		
		if(status > 0) {
		adminDao.statusToZero(user);
		
			return false;
			
		} else {
			adminDao.statusToOne(user);
			
			return true;
		}
	}


	@Override
	public boolean deleteBoardStatus(Board board) {
		
		logger.info("board 가기 전: {}", board);
		
		int status = adminDao.checkBoardStatus(board);
		
		logger.info("board 간 후: {}", board);
		
		if(status > 0) {
		adminDao.BoardstatusToZero(board);
		
			return false;
			
		} else {
			adminDao.BoardstatusToOne(board);
			
			return true;
		}
	}


	@Override
	public Paging getPagingMycar(Paging param) {
		
		int totalCount = adminDao.selectCntAllMycar(param);

		//페이징 객체 생성
		Paging paging = new Paging(totalCount, param.getCurPage(), 10, 4);
		paging.setSearch(param.getSearch());	 // 검색어 설정
//		paging.setCategory(param.getCategory()); // 추가된 부분: 게시판 카테고리 설정
				
		return paging;
	}


	@Override
	public List<Map<String, Object>> mycarList(Paging paging) {

		return adminDao.selectAllMycar(paging);
	}


	@Override
	public void carAllowStatus(Car car) {
		
		adminDao.carStatusToTwo(car);
	}


	@Override
	public void carHoldStatus(Car car) {
		
		adminDao.carStatusToThree(car);
	}


	@Override
	public void incomePermitStatus(Income income) {

		adminDao.incomeStatusToTwo(income);
	}


	@Override
	public boolean deleteCarStatus(Car car) {
		
		logger.info("car 가기 전: {}", car);
		
		int status = adminDao.checkCarDeleteStatus(car);
		
		logger.info("car 간 후: {}", car);
		
		if(status > 0) {
		adminDao.carDeletestatusToZero(car);
		
			return false;
			
		} else {
			adminDao.carDeletestatusToOne(car);
			
			return true;
		}
		
	}


	
}
