package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MypageDao;
import web.dto.Msg;
import web.service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired MypageDao mypageDao;

	@Override
	public List<Msg> msgList(Msg msg) {
		
		List<Msg> list = mypageDao.selectByReceiver(msg);
		return list;
	}

}

