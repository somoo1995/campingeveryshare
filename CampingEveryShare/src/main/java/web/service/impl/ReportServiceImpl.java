package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ReportDao;
import web.service.face.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired ReportDao reportDao;
	
}
