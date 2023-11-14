package web.service.impl;

import java.util.List;

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
	public List<Alert> getList(Alert alert) {
		return alertDao.selectByUser(alert);
	}

}

