package web.service.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface NoticeService {

	/**
	 * 게시글 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 게시글 리스트
	 */
	public List<Map<String, Object>> list(Paging paging);

	/**
	 * 페이징 계산
	 * 
	 * @param param - curPage 정보를 담고있는 객체
	 * @return - 페이징 계산이 완료된 객쳉
	 */
	public Paging getPaging(Paging param);

}
