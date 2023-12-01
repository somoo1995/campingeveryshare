package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AlertDao;
import web.dto.Alert;
import web.service.face.AlertService;

@Service
public class AlertServiceImpl implements AlertService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired AlertDao alertDao;

	@Override
	public List<Map<String, Object>> getList(Alert alert) {
		
		List<Map<String, Object>> list = alertDao.selectByUser(alert);
		
		return list;
	}

	@Override
	public int sendAlert(Alert alert) {
		int res = alertDao.insertAlert(alert);
		return res;
	}

	@Override
	public void readAlert(Alert alert) {
		alertDao.updateAlertStatus(alert);
	}

	@Override
	public int hasNew(Alert alert) {
		return alertDao.countStatus(alert);
	}

}

