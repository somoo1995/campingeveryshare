package web.dao.face;

import web.util.Paging;

public interface SearchDao {

	public int selectCntAll(Paging param);

	public int selectCntCar(Paging param);

}
