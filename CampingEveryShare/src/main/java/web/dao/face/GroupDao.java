package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Group;
import web.dto.User;
import web.util.Paging;

public interface GroupDao {

	//게시글 목록 조회
	public int selectCntAll(Paging param);

	/**
	 * 게시글 정보 조회
	 * @param paging
	 * @return
	 */
	public List<Map<String, Object>> selectBoardList(Paging paging);

	/**
	 * 유저 정보 조회
	 * @param paging
	 * @return
	 */
	public List<User> selectUserNick(Paging paging);

	/**
	 * 게시글 조회수 업데이트
	 * @param board
	 * @return 
	 */
	public int updateHit(Board board);

	/**
	 * 게시글 상세 조회
	 * @param viewBoard
	 * @return
	 */
	public Map<String, Object> selectBoardView(Board board);
	/**
	 * 유저 닉네임 가져오기
	 */
	public List<User> selectUserInfo();



}
