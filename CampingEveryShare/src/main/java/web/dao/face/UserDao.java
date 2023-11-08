package web.dao.face;

import web.dto.UserTb;

public interface UserDao {

	/**
	 * id/pw로 조회된 사용자의 수를 반환
	 * 
	 * @param user
	 * @return
	 */
	public int selectCntUser(UserTb user);

}
