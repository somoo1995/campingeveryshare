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
	        return "";
	    } else {
	    	logger.info("userId:{}",userId);
			
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
//	    User loginInfo = userDao.selectInfo(login);
//	    
//	    logger.info("회원정보 조회 결과: {}", loginInfo);
//	    return loginInfo;
	    return userDao.selectInfo(login);

	}

	@Override
	public String findPw(User user) {
	   //사용자 정보 가져오기
		String foundUser = userDao.findPw(user);
	    if (foundUser != null) {
	    	logger.info("성공했니?");
	    	//정보일치시 성공
	        return "success";
	    } else {
	    	logger.info("실패래");
	    	//불일치시 실패
	    	return "fail"; 
		}
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

	
	@Override
	public boolean updatePw(User pwupdate) {
		
		return userDao.updatePw(pwupdate);
	}


	@Override
	public boolean  deleteUser(String userId, String password) {
	    User user = userDao.selectById(userId);

	 // 사용자가 존재하고 비밀번호가 일치하면 상태를 1로 업데이트
	    if (user != null && password.equals(user.getUserPw())) {
	        user.setUserStatus(1);
	        userDao.deleteInfo(user);
	        return true; // 삭제 성공
	    }

	    return false; // 비밀번호가 일치하지 않거나 사용자가 존재하지 않을 경우 삭제 실패
	}


}

