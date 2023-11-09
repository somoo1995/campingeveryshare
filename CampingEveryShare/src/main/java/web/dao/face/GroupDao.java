package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.User;
import web.util.Paging;

public interface GroupDao {

	//게시글 목록 조회
	public int selectCntAll(Paging param);

	public List<Board> selectBoardList(Paging paging);

	//여기부터 게시글 상세 조회
	public void updateHit(Board board);

	public Board selectByBoardNo(Board board);

	public List<User> selectUserNick(Paging paging);


}
