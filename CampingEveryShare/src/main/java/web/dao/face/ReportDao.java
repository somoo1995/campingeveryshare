package web.dao.face;

import web.dto.Report;

public interface ReportDao {
	
	/**
	 * 게시글 신고
	 * 
	 * @param report - 신고할 게시글 정보
	 */
	public void insertReport(Report report);
	
	/**
	 * 신고 전체 수 조회
	 * 
	 * @param report - 신고 수를 조회할 게시글
	 * @return - 전체 신고 수
	 */
	public int selectTotalCntReport(Report report);
	
	/**
	 * 로그인한 아이디가 신고 했는지 조회
	 * 
	 * @param report - 조회할 아이디
	 * @return - 했으면 1 / 안했으면 0
	 */
	public int selectCntReportByUserId(Report report);

}
