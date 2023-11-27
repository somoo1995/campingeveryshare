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

	/**
	 * 일반로그인 회원정보 조회
	 * 
	 * @param login
	 * @return
	 */
	public User selectInfo(User login);

	/**
	 * 비밀번호 찾기
	 * @param findPw  
	 * @return
	 */
	public String findPw(User findPw);
	
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
	/**
	 * 비밀번호 찾기를 통한 비밀번호 재설정
	 * 
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public boolean updatePw(User pwupdate);
	
	/**
	 * 회원 상태 1로 변경
	 * 
	 * @param user
	 */
	public void deleteInfo(User user);

	/**
	 * 이메일존재여부 통한 카카오로그인
	 * 
	 * @param email
	 * @return
	 */
	public int selectCntKakao(String email);

	/**
	 * 카카오 로그인 회원정보 조회
	 * 
	 * @param login
	 * @return
	 */
	public User selectKakaoInfo(User login);

	/**
	 * 카카오 로그인 회원가입
	 * 
	 * @param signup
	 */
	public void kakaoInsert(User signup);
}

