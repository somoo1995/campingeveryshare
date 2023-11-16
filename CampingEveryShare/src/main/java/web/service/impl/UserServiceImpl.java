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
	        if( loginChk > 0)
	        	return true;
	        return false;
	}

	@Override
	public String findId(User user) {
		String userId = userDao.findId(user);
		if (userId == null) {
			userId = "";
		}
		return userId;
	}
	
	@Override
	public boolean joinIdCheck(String userId) {
		int idCheck = userDao.selectCntUserId(userId);
		return idCheck <= 0;
	}

	@Override
	public boolean joinEmailCheck(String email) {
		return userDao.selectCntEmail(email) == 0;
	}

	@Override
	public boolean joinNickCheck(String userNick) {
		int nickCheck = userDao.selectCntUserNick(userNick);
		return nickCheck <= 0;
	}

	@Override  
	public boolean join(User user, int selectedProfile, String userPwConfirm) {

	    String userId = user.getUserId();
	    String userPw = user.getUserPw();

	    // 중복 ID인지 확인
	    if (userDao.selectCntUserId(userId) > 0) {
	        return false;
	    }

	    // 비밀번호와 비밀번호 확인이 일치할 때만 회원 정보 삽입
	    if (userPw.equals(userPwConfirm)) {
	        // 프로필 번호 설정
	        user.setProfile(selectedProfile);

	        // 회원 정보 삽입
	        userDao.insert(user);

	        // 가입 결과 확인
	        return userDao.selectCntUserId(userId) > 0;
	    } else {
	        // 비밀번호가 일치하지 않는 경우 가입 실패
	        return false;
	    }
	}

	@Override
	public User info(User login) {
	    return userDao.selectInfo(login);
	}

	@Override
	public User findPw(User findPw) {
		return userDao.findPw(findPw);
	}

	
	@Override
	public User info(String loginId) {
		return userDao.selectById(loginId);
	}

	@Override
	public boolean updateUser(User updateUser, String userPwConfirm) {

	    String userId = updateUser.getUserId();
	    String userPw = updateUser.getUserPw();

	    // 중복 ID인지 확인
	    if (userDao.selectCntUserId(userId) < 0 ) {
	        return false;
	    }

	    // 비밀번호와 비밀번호 확인이 일치할 때만 회원 정보 삽입
	    if (userPw.equals(userPwConfirm)) {
	        // 프로필 번호 설정
//	    	updateUser.setProfile(selectedProfile);

	        // 회원 정보 삽입
	        userDao.updateUser(updateUser);
	        
	        return true;

	    } else {
	        // 비밀번호가 일치하지 않는 경우 가입 실패
	        return false;
	    }
	}


}

