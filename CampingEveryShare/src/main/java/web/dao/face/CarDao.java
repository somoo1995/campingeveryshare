package web.dao.face;

import java.util.List;

import web.dto.BoardFile;
import web.dto.Car;
import web.util.Paging;

public interface CarDao {
	
	public int selectCntAll(Paging param);

	public List<Car> selectAll(Paging paging);

	public Car selectByCarNo(Car car);

	public void insertCarWrite(Car car);

	public void insertFile(BoardFile boardFile);
	

}
