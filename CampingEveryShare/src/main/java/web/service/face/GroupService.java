package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import web.dto.Board;
import web.dto.Group;
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

	/**
	 * 게시글 내용 CLOB 형식으로 전환
	 * @param board
	 * @return
	 */
	public Map<String, Object> content(Board board);

	/**
	 * 게시글 작성
	 * @param writeParam
	 * @param groupParam 
	 */
	public void write(Board writeParam, Group groupParam);

	/**
	 * 상세보기 - 모집현황 가져오기
	 * @param group
	 * @return
	 */
	public Map<String, Object> recruit(Group group);






	
}
