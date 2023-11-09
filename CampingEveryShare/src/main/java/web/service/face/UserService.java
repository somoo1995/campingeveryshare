package web.service.face;

import web.dto.User;

public interface UserService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param user 입력한 id/pw 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(User user);

	/**
	 * 아이디 찾기
	 * 
	 * @param user
	 * @return
	 */
	public User findId(User user);

	/**
	 * 회원가입 아이디 중복체크
	 * 
	 * @param userId
	 * @return
	 */
	public boolean joinIdCheck(String userId);

	/**
	 * 회원가입 이메일 중복체크
	 * 
	 * @param email
	 * @return
	 */
	public boolean joinEmailCheck(String email);

	/**
	 * 회원가입 닉네임 중복체크
	 * 
	 * @param userNick
	 * @return
	 */
	public boolean joinNickCheck(String userNick);

	/**
	 * 회원가입
	 * 
	 * @param user
	 * @return
	 */
	public boolean join(User user);

	public User info(User user);
	

}
