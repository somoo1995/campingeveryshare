package web.dao.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface AdminDao {

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

//	public void insertAlertTb(String param);


}
