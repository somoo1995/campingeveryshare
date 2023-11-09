package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.BoardFile;
import web.dto.User;
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
	public Board selectBoardView(Board board);
	
	/**
	 * 글 상세조회시 조회수 증가
	 * 
	 * @param board - 게시글 클릭하면 조회수 증가
	 */
	public void hit(Board board);
	
	/**
	 * 유저닉을 가져오자
	 * 
	 * @param user - 유저닉을 가져올 user 객체
	 * @return - 꺼내온 userNick
	 */
	public User selectByUserNick(User user);
	
	/**
	 * boardNo를 이용한 파일 정보 추출
	 * 
	 * @param board - 파일정보를 가져올 board객체
	 * @return - 가져온 파일 정보
	 */
	public List<BoardFile> selectGetFileByBoardNo(Board board);
	
	/**
	 * Share테이블에 글 등록
	 * 
	 * @param board - 등록한 글을 담은 객체
	 */
	public void insertShareWrite(Board board);
	
	/**
	 * Share테이블에 파일 등록
	 * 
	 * @param boardFile - 등록한 파일을 담은 객체
	 */
	public void insertShareFile(BoardFile boardFile);
	
	

}
