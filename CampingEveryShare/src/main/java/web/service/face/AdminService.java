package web.service.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface AdminService {

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

	/**
	 * 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체 
	 * @return 게시글 목록
	 */
	public List<Map<String, Object>> list(Paging paging);

	/**
	 * 신고게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 신고게시글 목록
	 */
	public List<Map<String, Object>> reportList(Paging paging);

	public Paging getPagingReport(Paging param);

//	public void insertAlert(String param);

	

}
