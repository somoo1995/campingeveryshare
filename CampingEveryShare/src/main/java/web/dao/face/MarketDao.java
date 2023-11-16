package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.User;
import web.util.Paging;

public interface MarketDao {

	/**
	 * 전체 리스트
	 * 
	 * @param paging - 페이징 객체
	 * @param board 
	 * @return - 조회된 게시글 전체
	 */
	public List<Map<String, Object>> selectMarketAll(Paging paging);
	
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
	 * Market테이블에 글 등록
	 * 
	 * @param board - 등록한 글을 담은 객체
	 */
	public void insertMarketWrite(Board board);
	
	/**
	 * Market테이블에 파일 등록
	 * 
	 * @param boardFile - 등록한 파일을 담은 객체
	 */
	public void insertMarketFile(BoardFile boardFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 조회된 첨부파일 정보
	 */
	public List<BoardFile> selectMarketFileByBoardNo(Board board);

	/**
	 * 게시글 내용을 수정한다
	 * 제목, 본문을 주어진 게시글 번호를 이용하여 수정한다
	 * 
	 * @param updateParam - 수정할 내용이 담긴 객체
	 */
	public void updateProc(Board board);
	  
	/**
	 * 기존의 첨부파일을 삭제한다
	 * 
	 * @param delFileno - 삭제하려는 파일 번호들
	 */
	public void deleteFiles(int[] delFileNo);
	
	/**
	 * 게시글 삭제
	 * 파일 먼저 삭제하기
	 * @param boardFile - 파일 번호를 가져가서 삭제
	 */
	public void deleteFileByBoardNo(BoardFile boardFile);
	
	/**
	 * 게시글 삭제
	 * 파일 삭제 후 게시글 삭제
	 * @param board - 게시글 번호를 가져가서 삭제
	 */
	public void deleteByBoardNo(Board board);

	
	

}
