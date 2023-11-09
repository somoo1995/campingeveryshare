package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UserDao;
import web.dto.User;
import web.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {
    // 로그 객체 생성
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserDao userDao;

	@Override
	public boolean login(User user) {
		 int loginChk = userDao.selectCntUser(user);
	        return loginChk > 0;
	}

	

}
