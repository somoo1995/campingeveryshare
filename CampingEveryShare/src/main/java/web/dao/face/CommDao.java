package web.dao.face;

import java.util.List;

import web.dto.Comm;
import web.dto.Recom;

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

//	/**
//	 * 상세조회한 게시글의 추천을 눌렀는지 확인
//	 * 
//	 * @param comm - 사용자와 게시글 정보를 가지고 있는 객체
//	 * @return - 1 : 추천한적 있음 / 0 : 추천한적 없음
//	 */
//	public int selectCntRecommend(Comm comm);


	

}
