package web.dao.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface NoticeDao {

	/**
	 * 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @param board 
	 * @return - 조회된 게시글 전체
	 */	
	public List<Map<String, Object>> selectNoticeAll(Paging paging);
	
	/**
	 * 조회된 게시글 수 조회 (페이징)
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

}
