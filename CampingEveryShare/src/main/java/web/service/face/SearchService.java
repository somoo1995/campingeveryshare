package web.service.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface SearchService {

	public Paging getPaging(Paging param, String query);

	public List<Board> getList(Paging paging);

}
