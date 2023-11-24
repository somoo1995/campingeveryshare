package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.BoardFile;
import web.dto.Car;
import web.util.Paging;

public interface CarDao {
	
	public int selectCntAll(Paging param);

	public List<Map<String, Object>> selectAll(Paging paging);

	public Car selectByCarNo(Car car);

	public void insertCarWrite(Car car);

	public void insertFile(BoardFile boardFile);
	

}
