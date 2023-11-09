package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.BoardFile;
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
	 */
	public void shareWrite(Board board, List<MultipartFile> file);
	
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

}
