package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Comm;

public interface CommDao {
 
	/**
	 * 댓글 리스트 조회
	 * 
	 * @param comm - 댓글 리스트를 담아올 comm객체
	 * @return - 조회된 댓글 리스트
	 */
	public List<Comm> selectComm(Comm comm);
	
	/**
	 * 공유게시판 내에 댓글달기
	 * 
	 * @param comm - 입력한 댓글
	 * @return 
	 */
	public int insertCommByShare(Comm comm);
	
	/**
	 * 댓글 삭제
	 * 
	 * @param comm - 삭제할 댓글의 정보
	 */
	public void deleteComm(Comm comm);
	
	/**
	 * 댓글 갯수 
	 * 
	 * @param comm - 게시글에 작성된 댓글 갯수 구하기
	 * @return - 댓글 갯수
	 */
	public int countComm(Comm comm);
	
	/**
	 * 댓글 리스트를 새로 불러올 때 필요한 유저닉을 가져오기 위한 저렴한 친구
	 * 
	 * @param comm - 댓글 리스트를 불러오기 위해 필요한 유저 아이디
	 * @return - 유저 닉
	 */
	public List<Map<String,Object>> selectCommByUserId(Comm comm);
	
	/**
	 * 유저닉을 가져오기 위한 저렴한 친구
	 * 
	 * @param comm - 댓글 정보가 담겨있는 comm객체
	 * @return - 유저 닉네임
	 */
	public List<Map<String, Object>> getCommListByUserNick(Comm comm);

	


	

}
