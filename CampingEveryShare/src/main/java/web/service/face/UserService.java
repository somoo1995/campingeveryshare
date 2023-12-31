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
	public String findId(User user);

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
	 * @return 왜안나와
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
	 * @return
	 */
	public boolean join(User user, int selectedProfile);

	/**
	 * 회원 정보
	 * @param user
	 * @return
	 */
	public User info(User user);

	/**
	 * 비밀번호 찾기
	 * @param findPw
	 * @return
	 */
	public String findPw(User findPw);
	
	/**
	 * 내정보확인 로그인 아이디
	 * 
	 * @param loginId
	 * @return
	 */
	public User info(String loginId);

	/**
	 * 회원정보 수정 후 업데이트
	 * 
	 * @param updateUser
	 * @param userPwConfirm 
	 * @param selectedProfile 
	 * @return
			 */
	public boolean updateUser(User updateUser, String userPwConfirm);

	/**
	 * 비밀번호 찾기 성공시 비밀번호만 변경
	 * 
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public boolean updatePw(User pwupdate);

	/**
	 * 아이디와 비밀번호 일치시 상태1로 변경
	 * 
	 * @param userId
	 * @param password
	 * @return
	 */
	public boolean deleteUser(String userId, String password);

	/**
	 * 이메일확인통해 로그인
	 * 
	 * @param email
	 * @return
	 */
	public boolean findByEmail(String email);

	/**
	 * 카카오로그인한 회원정보 조회
	 * 
	 * @param login
	 * @return
	 */
	public User kakaoInfo(User login);

	/**
	 * 카카오로그인 회원가입
	 * 
	 * @param signup
	 * @return
	 */
	public boolean kakaoJoin(User signup);


}

