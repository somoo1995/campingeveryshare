package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.util.Paging;

public interface NoticeService {

	/**
	 * 게시글 전체 리스트 (delete_status 가 0:활성 인 리스트 불러오기)
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
	
	/**
	 * noticeList 글 제목 클릭시 게시글 상세 조회
	 * 
	 * @param board - 클릭한 게시글의 boardNo
	 * @return - DB에서 가져온 게시글 정보
	 */
	public Board noticeView(Board board);
	
	/**
	 * 글 등록
	 * 
	 * @param board - 입력된 글
	 */
	public void noticeWrite(Board board);
	
	/**
	 * admincode 가지러가자
	 * 
	 * @param admin - admincode를 들고간다
	 * @return
	 */
	public Admin getAdminCode(Admin admin);

	/**
	 * 등록된 게시글 상세보기
	 * 
	 * @param board - 등록되어있는 글번호
	 * @return - 글번호로 불러온 정보
	 */
	public Board view(Board board);
	
	/**
	 * 게시글 수정
	 * 
	 * @param board - 게시글 정보 객체
	 */
	public void updateProc(Board board);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Board board);

	/**
	 * 글 삭제 토글을 해보자 제발 되라
	 * 
	 * @param board
	 */
	public boolean deleteStatus(Board board);

	/**
	 * 게시글 전체 리스트 (관리자용, delete_status 상관없이 모두 불러오기)
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 게시글 리스트
	 */
	public List<Map<String, Object>> adminList(Paging paging);

	/**
	 * 글 상태 조회
	 * 
	 * @param boardStatus - 글 상태 
	 * @return - 0 : 활성/ 1 : 비활성
	 */
//	public boolean noticeDeleteCnt(Board boardStatus);
	

}
