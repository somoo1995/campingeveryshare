package web.dao.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface BoardDao {

	/**
	 * 조회된 총 문의게시글 수
	 * 
	 * @param param
	 * @return 총 게시글 수
	 */
	public int selectCntAllQna(Paging param);

	/**
	 * 문의게시판 전체 리스트
	 * 
	 * @param paging
	 * @return 조회된 문의게시글 전체
	 */
	public List<Map<String, Object>> selectAllQna(Paging paging);


}
