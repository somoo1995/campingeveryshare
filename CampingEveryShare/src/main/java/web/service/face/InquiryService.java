package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.User;
import web.util.Paging;

public interface InquiryService {
	
	/**
	 * 페이징 계산
	 * @param param - curPage 정보
	 * @return - 페이징 계산 완료된 정보
	 */
	public Paging getPaging(Paging param);
	
	/**
	 * 게시글 리스트 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return - 조회된 게시글 리스트
	 */
	public List<Map<String, Object>> list(Paging paging);
	
	/**
	 * inquiryList 글 제목 클릭시 게시글 상세 조회
	 * 
	 * @param board - 클릭한 게시글의 boardNo
	 * @return - DB에서 가져온 게시글 정보
	 */
	public Board inquiryView(Board board);

	/**
	 * 글 상세조회시 닉네임을 가져와야함
	 * 
	 * @param user - 유저 닉을 가져오기
	 * @return - 가져온 유저 닉네임
	 */
	public User getNick(User user);
	
	/**
	 * 파일 정보 조회
	 * 
	 * @param board - boardNo를 이용한 파일 조회
	 * @return - 조회된 파일 목록
	 */
	public List<BoardFile> fileView(Board board);
	
	/**
	 * 댓글 리스트 조회
	 * 
	 * @param comm - 댓글 리스트를 받아올 comm 객체
	 * @return - 받아온 댓글 리스트
	 */
	public List<Comm> getCommList(Comm comm);
	
	/**
	 * 글, 파일 등록
	 * 
	 * @param board - 입력된 글
	 * @param file - 업로드한 파일
	 */
	public void inquiryWrite(Board board, List<MultipartFile> file);
	
	/**
	 * 등록된 게시글 상세보기
	 * 
	 * @param board - 등록되어있는 글 번호
	 * @return - 글 번호로 불러온 정보
	 */
	public Board view(Board board);
	
	/**
	 * 게시글 번호를 사용한 업로드된 파일의 정보를 조회
	 * 
	 * @param board - 조회할 게시글 번호를 가진 객체
	 * @return - 첨부파일 정보
	 */
	public List<BoardFile> getAttachFile(Board board);

	/**
	 * 게시글 수정 처리
	 *  + 첨부 파일을 처리한다
	 *  (첨부 파일은 여러 개 가능)
	 *  + 삭제할 첨부 파일을 처리한다
	 *  
	 * @param board - 게시글 정보
	 * @param file - 첨부 파일 리스트
	 * @param delFileNo - 삭제할 첨부 파일 번호
	 */
	public void updateProc(Board board, List<MultipartFile> file, int[] delFileNo);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Board board);
	
	/**
	 * 댓글 삽입
	 * 
	 * @param comm - 등록된 댓글
	 * @return 
	 */
	public int insertComm(Comm comm);
	
	/**
	 * 댓글 삭제
	 * 
	 * @param - 삭제할 댓글의 정보
	 * @return - 삭제 성공 여부
	 */
	public void deleteComm(Comm comm);

	/**
	 * 유저닉을 가져오기 위한 저렴한 친구들
	 * 
	 * @param comm - 댓글 정보를 가져감
	 * @return - 유저닉
	 */
	public List<Map<String, Object>> getCommListByUserNick(Comm comm);
	
	/**
	 * 문의게시판 상세보기를 위해 adminCode를 가져와야함
	 * 
	 * @param admin - adminCode를 들고간다
	 * @return - 가져온 adminCode
	 */
	public Admin getAdminCode(Admin admin);

}
