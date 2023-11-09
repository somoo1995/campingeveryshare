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

	/**
	 * 입력된 정보로 id찾기
	 * 
	 * @param user
	 * @return
	 */
	public UserTb findId(UserTb user);

	/**
	 * 조회된 사용자의 수를 반환
	 * 
	 * @param userId
	 * @return
	 */
	public int selectCntUserId(String userId);

	/**
	 *조회된 사용자의 수를 반환
	 *
	 * @param email
	 * @return
	 */
	public int selectCntEmail(String email);

	/**
	 *  조회된 사용자의 수를 반환
	 * @param userNick
	 * @return
	 */
	public int selectCntUserNick(String userNick);

	/**
	 * 회원정보 삽입
	 * 
	 * @param user
	 */
	public void insert(UserTb user);


	
	
}
