package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;

	@Override
	public Paging getPaging(Paging param) {
		
		int totalCount = adminDao.selectCntAll(param);

		Paging paging = new Paging(totalCount, param.getCurPage());
		paging.setSearch(param.getSearch());
		
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
		
		return paging;
	}

//	@Override
//	public void insertAlert(String param) {
//		adminDao.insertAlertTb(param);
//	}



}
