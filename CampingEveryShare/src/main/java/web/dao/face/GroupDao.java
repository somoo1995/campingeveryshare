package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.BoardTb;
import web.dto.GroupTb;
import web.dto.UserTb;
import web.util.Paging;

public interface GroupDao {

	//게시글 목록 조회
	public int selectCntAll(Paging param);

	public List<BoardTb> selectBoardList(Paging paging);

	//여기부터 게시글 상세 조회
	public void updateHit(BoardTb board);

	public BoardTb selectByBoardNo(BoardTb board);

	public List<UserTb> selectUserNick(Paging paging);


}
