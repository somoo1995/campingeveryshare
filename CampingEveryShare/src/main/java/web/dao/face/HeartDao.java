package web.dao.face;

import web.dto.Heart;

public interface HeartDao {
	
	/**
	 * 찜 전체 수 조회
	 * 
	 * @param heart - 찜 수를 조회할 게시글
	 * @return - 전체 찜 수
	 */
	public int selectTotalCntHeart(Heart heart);
	
	/**
	 * 로그인한 아이디가 찜 했는지 조회
	 * 
	 * @param heart - 조회할 아이디
	 * @return - 했으면 1 / 안했으면 0
	 */
	public int selectCntHeartByUserId(Heart heart);
	
	/**
	 * 찜 상태 지우기
	 * 
	 * @param heart - 찜 정보 객체
	 */
	public void deleteHeart(Heart heart);
	
	/**
	 * 찜 상태 넣기
	 * 
	 * @param heart - 찜 정보 객체
	 */
	public void insertHeart(Heart heart);

}
