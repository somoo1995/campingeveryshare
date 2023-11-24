package web.service.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface BoardService {

	public Paging getPaging(Paging param);

	public List<Map<String, Object>> qnaList(Paging paging);

}
