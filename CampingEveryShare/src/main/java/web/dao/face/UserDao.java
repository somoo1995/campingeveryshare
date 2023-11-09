package web.dao.face;

import web.dto.User;

public interface UserDao {

	/**
	 * id/pw로 조회된 사용자의 수를 반환
	 * 
	 * @param user
	 * @return
	 */
	public int selectCntUser(User user);

}
