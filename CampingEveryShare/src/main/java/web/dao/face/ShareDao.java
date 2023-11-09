package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.util.Paging;

public interface ShareDao {

	/**
	 * 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 게시글 전체
	 */
	public List<Map<String, Object>> selectShareAll(Paging paging);
	
	/**
	 * 조회된 게시글 수 조회 (페이징)
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();
	
	/**
	 * 클릭한 게시물 상세조회
	 * 
	 * @param board - 클릭한 게시글의 상세조회
	 * @return - 상세조회된 게시글
	 */
	public List<Map<String,Object>> selectBoardView(Board board);
	
	/**
	 * 글 상세조회시 조회수 증가
	 * 
	 * @param board - 게시글 클릭하면 조회수 증가
	 */
	public void hit(Board board);

}
