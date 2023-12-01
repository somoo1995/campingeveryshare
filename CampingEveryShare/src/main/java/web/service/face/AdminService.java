package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Board;
import web.dto.Car;
import web.dto.Income;
import web.dto.User;
import web.util.Paging;

public interface AdminService {
	
	public boolean adminIdCheck(String adminCode);
	/**
	 * 로그인 인증 처리
	 * 
	 * @param user 입력한 admin 접속코드/pw 정보
	 * @return 로그인 인증 결과
	 */
	public boolean loginCheck(Admin admin);
	
	/**
	 * 입력받은 관리자 접속코드/pw 확인
	 * @param login
	 * @return
	 */
	public Admin loginInfo(Admin admin);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	전달파라미터 객체의 curPage - 현재 페이지
	 *  DB에서 조회한 totalCount - 총 게시글 수
	 *  
	 *  두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환한다
	 *  
	 * 
	 * @param param - curPage정보를 담고 있는 객체
	 * @return 페이징 계산이 완료된 객체
	 */
	public Paging getPaging(Paging param);


	public List<Map<String, Object>> list(Paging paging);

	/**
	 * 신고게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 신고게시글 목록
	 */
	public List<Map<String, Object>> reportList(Paging paging);

	public Paging getPagingReport(Paging param);

	public List<Map<String, Object>> incomeList(Paging paging);

	public Paging getPagingIncome(Paging param);
	
	public boolean joinIdCheck(String userId);
	
	public boolean deleteUserStatus(User user);
	
	public boolean deleteBoardStatus(Board board);
	
	public Paging getPagingMycar(Paging param);
	
	public List<Map<String, Object>> mycarList(Paging paging);
	
	public void carAllowStatus(Car car);
	
	/**
	 * car_status를 승인 대기 or 승인 완료 -> 신청 상태로 되돌리기
	 * 
	 * @param car
	 */
	public void carHoldStatus(Car car);
	
	public void incomePermitStatus(Income income);
	

}
