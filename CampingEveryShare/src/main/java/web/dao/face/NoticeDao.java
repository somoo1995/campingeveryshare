package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
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
	
	/**
	 * 클릭한 게시물 상세조회
	 * 
	 * @param board - 클릭한 게시글의 상세조회
	 * @return - 상세조회된 게시글
	 */
	public Board selectBoardView(Board board);
	
	/**
	 * notice 게시판에 글 등록
	 * 
	 * @param board - 등록할 글을 담은 객체
	 */
	public void insertNoticeWrite(Board board);
	
	/**
	 * admin 코드 가져오기위한 친구
	 * 
	 * @param admin - admin 코드를 가지러가자
	 * @return
	 */
	public Admin selectByAdminCode(Admin admin);
	
	/**
	 * 조회수 증가
	 * 
	 * @param board - 게시글 조회시 조회수 증가
	 */
	public void hit(Board board);
	
	/**
	 * 게시글 내용을 수정한다
	 * 제목, 본문을 주어진 게시글 번호를 이용하여 수정한다
	 * 
	 * @param board - 수정할 내용이 담긴 객체
	 */
	public void updateProc(Board board);
	
	/**
	 * 공지사항 글 삭제
	 * 
	 * @param board - 보드넘버
	 */
	public void deleteByBoardNo(Board board);
	

}
