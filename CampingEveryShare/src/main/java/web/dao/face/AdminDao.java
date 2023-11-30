package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Board;
import web.dto.User;
import web.util.Paging;

public interface AdminDao {
	
	/**
	 * 관리자 접속코드/pw로 조회된 사용자의 수를 반환
	 * 
	 * @param admin
	 * @return 
	 */
	public int selectCntAdmin(Admin admin);

	public Admin selectInfo(Admin admin);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging param);

	/**
	 * 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 게시글 전체
	 */
	public List<Map<String, Object>> selectAll(Paging paging);

	/**
	 * 신고게시글 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 신고게시글 전체
	 */
	public List<Map<String, Object>> selectAllReport(Paging paging);

	public int selectCntAllReport(Paging param);

	public List<Map<String, Object>> selectAllIncome(Paging paging);

	public int selectCntAllIncome(Paging param);

	public User selectById(String userId);

	public int selectCntUserId(String userId);

	public int checkStatus(User user);

	public void statusToZero(User user);

	public void statusToOne(User user);

	public int checkBoardStatus(Board board);

	public void BoardstatusToZero(Board board);

	public void BoardstatusToOne(Board board);

	public int selectCntAllMycar(Paging param);

	public List<Map<String, Object>> selectAllMycar(Paging paging);

}
