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
	 * 
	 * 회원가입 닉네임 중복체크
	 * 
	 * @param userNick
	 * @return
	 */
	public boolean joinNickCheck(String userNick);

	/**
	 * 회원가입
	 * 
	 * @param user 사용자
	 * @param selectedProfile 프로필 사진 번호 입력
	 * @param userPwConfirm 비밀번호,비밀번호 확인값 일치여부 확인
	 * @return
	 */
	public boolean join(User user, int selectedProfile, String userPwConfirm);

	public User info(User user);
	

}