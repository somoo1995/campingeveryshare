package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.User;
import web.util.Paging;

public interface GroupService {

	/**
	 * 게시글 목록 조회
	 * @param param
	 * @return
	 */
	public Paging getPaging(Paging param);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> list(Paging paging);

	/**
	 * 게시글 조회수
	 * @param viewBoard
	 * @return
	 */
	public int viewHit(Board board);

	/**
	 * 게시글 상세 조회
	 * @param board 
	 * @return
	 */
	public Map<String, Object> view(Board board);



	
}
