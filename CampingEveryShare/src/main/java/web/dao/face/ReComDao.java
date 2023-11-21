package web.dao.face;

import web.dto.Board;
import web.dto.Comm;
import web.dto.Heart;
import web.dto.Recom;

public interface ReComDao {
	
	/**
	 * 로그인한 아이디가 추천 했는지 조회
	 * 
	 * @param recom - 조회할 아이디
	 * @return - 했으면 1 / 안했으면 0
	 */
	public int selectCntRecomByUserId(Recom recom);
	
	/**
	 * 추천 상태 지우기
	 * 
	 * @param recom - 추천 정보 객체
	 */
	public void deleteReCom(Recom recom);
	
	/**
	 * 추천 상태 넣기
	 * 
	 * @param recom - 추천 정보 객체
	 */
	public void insertReCom(Recom recom);
	
	/**
	 * 게시글 전체 추천 수 조회
	 * 
	 * @param recom - 추천 수를 조회할 게시글
	 * @return - 전체 추천 수
	 */
	public int selectTotalCntRecom(Recom recom);
	
	

}
