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

	/**
	 * 입력된 정보로 id찾기
	 * 
	 * @param user
	 * @return
	 */
	public String findId(User user);

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
	public void insert(User user);

	

	public User selectInfo(User login);

	/**
	 * 비밀번호 찾기
	 * @param findPw  
	 * @return
	 */
	public User findPw(User findPw);
	
	/**
	 * 마이페이지 아이디
	 * 
	 * @param loginId
	 * @return
	 */
	public User selectById(String loginId);

	/**
	 * 회원정보수정
	 * 
	 * @param updateUser
	 */
	public void updateUser(User updateUser);

}

