package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.BoardTb;
import web.dto.UserTb;
import web.util.Paging;

public interface GroupService {

	/**
	 * 게시글 목록 조회
	 * @param param
	 * @return
	 */
	public Paging getPaging(Paging param);

	public Map<String, Object> list(Paging paging);
	
	/**
	 * 여기부터 게시글 상세 조회
	 * @param board
	 * @return
	 */
	public BoardTb view(BoardTb board);

	/**
	 * 유저 닉네임 가져오기
	 * @param user
	 * @return
	 */





	
}
