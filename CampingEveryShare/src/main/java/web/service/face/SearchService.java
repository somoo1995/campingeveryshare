package web.service.face;

import java.util.List;
import java.util.Map;

import web.util.Paging;

public interface SearchService {

	public Paging getPaging(Paging param, String query);

	public List<Map<String, Object>> getList(Paging paging);

}
