package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface SearchDao {

	public int selectCntAll(Paging param);

	public List<Board> selectBySearch(Paging paging);

}
