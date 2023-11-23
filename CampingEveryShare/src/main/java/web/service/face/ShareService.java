package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
  
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.Heart;
import web.dto.Recom;
import web.dto.Report;
import web.dto.Share;
import web.dto.User;
import web.util.Paging;

public interface ShareService {

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
	
	/**
	 * shareList 글 제목 클릭시 게시글 상세 조회
	 * 
	 * @param board - 클릭한 게시글의 boardNo
	 * @return - DB에서 가져온 게시글 정보
	 */
	public Board shareView(Board board);
	
	/**
	 * 글 상세조회시 닉네임을 가져오기 위한 아주 저렴한 친구
	 * 
	 * @param user - 유저 닉 가져와야함
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
	 * 글 , 파일 등록
	 * 
	 * @param board - 입력된 글
	 * @param file - 업로드한 파일
	 * @param share 
	 */
	public void shareWrite(Board board, List<MultipartFile> file, Share share);
	
	/**
	 * 등록된 게시글 상세보기
	 * 
	 * @param board - 등록되어있는 글번호
	 * @return - 글번호로 불러온 정보
	 */
	public Board view(Board board);

	/**
	 * 게시글 번호를 사용한 업로드된 파일의 정보를 조회
	 * 
	 * @param viewBoard - 조회할 게시글 번호를 가진 객체
	 * @return 첨부파일 정보
	 */
	public List<BoardFile> getAttachFile(Board board);
	
	/**
	 * 게시글 수정 처리
	 *  + 첨부 파일을 처리한다
	 *  (첨부 파일은 여러 개 가능)
	 *  + 삭제할 첨부 파일을 처리한다
	 * 
	 * @param updateParam - 게시글 정보 객체
	 * @param file - 첨부 파일 리스트
	 * @param share 
	 * @param delFileno - 삭제할 첨부 파일 번호
	 */
	public void updateProc(Board board, List<MultipartFile> file, int[] delFileNo, Share share);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Board board);

	/**
	 * 댓글 리스트 조회
	 * 
	 * @param comm - 댓글 리스트를 받아올 comm 객체
	 * @return - 받아온 댓글 리스트
	 */
	public List<Comm> getCommList(Comm comm);
	
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
	 * 로그인 한 아이디가 추천 했는지 조회
	 * 
	 * @param recom - 유저 아이디
	 * @return - 했으면 1 / 안했으면 0
	 */
	public boolean reComCnt(Recom recom);

	/**
	 * 추천 상태 확인 후 추천 토글 작업
	 * 
	 * @param recom - 추천 대상 정보
	 * @return - true : 추천함, false : 추천 취소
	 */
	public boolean recom(Recom recom);
	
	/**
	 * 총 추천수
	 * 
	 * @param recom - 추천수 파악할 게시글 정보
	 * @return - 총 추천 수
	 */
	public int getTotalCntRecom(Recom recom);
	
	/**
	 * paid를 가져오자
	 * 
	 * @param share - board_no를 가져가자
	 * @return 
	 */
	public Share getPaid(Share share);
	
	/**
	 * 총 찜 수
	 * 
	 * @param heart - 찜 수 파악할 게시글 정보
	 * @return - 총 찜 수
	 */
	public int getTotalCntHeart(Heart heart);
	
	/**
	 * 로그인 한 아이디가 찜 했는지 조회
	 * 
	 * @param heart - 유저 ID
	 * @return - 했으면 1 / 안했으면 0
	 */
	public boolean heartCnt(Heart heart);
	
	/**
	 * 찜 상태 확인 후 토글작업
	 * 
	 * @param heart - 찜 대상 정보
	 * @return - true : 찜함 / false : 찜 취소
	 */
	public boolean heart(Heart heart);
	
	/**
	 * 공유 게시글 신고
	 * 
	 * @param report - 신고 정보
	 */
	public void insertReport(Report report);
	
	/**
	 * 총 신고수
	 * 
	 * @param report - 신고 수 파악할 게시글 정보
	 * @return - 총 신고 수
	 */
	public int getTotalCntReport(Report report);
	
	/**
	 * 신고 상태 확인 후 토글작업
	 * 
	 * @param report - 신고 대상 정보
	 * @return - true : 신고 함 / false : 신고 안함
	 */
	public boolean reportCnt(Report report);
	
	
	

	




}
