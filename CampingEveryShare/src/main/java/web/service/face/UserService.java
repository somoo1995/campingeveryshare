package web.service.face;

import web.dto.UserTb;

public interface UserService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param user 입력한 id/pw 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(UserTb user);

	

}
