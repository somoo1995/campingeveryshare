package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.BoardFile;
import web.dto.Car;
import web.dto.User;
import web.util.Paging;

public interface CarDao {
	
	public int selectCntAll(Paging param);

	public List<Map<String, Object>> selectAll(Paging paging);

	public Car selectByCarNo(Car car);

	public void insertCarWrite(Car car);

	public void insertFile(BoardFile boardFile);

	public int selectBycarNumber(Car car);

	public List<Integer> selectCarNoByUserId(User user);

	public Map<String, Object> selectCarSummaryByCarNo(Integer carNo);

	public Car selectCarByCarNo(Car car);

	public BoardFile selectFileInfoByCarNo(Car car);

	public void updateCarByCarNo(Car car);

	public void updateCar(Car car);

	public int checkFile(BoardFile boardFile);

	public void updateFile(BoardFile boardFile);

	public Car selectBycarNumberNew(Car car);

	public void deleteCar(Car car);

	public void updateCarStop(Car car);

	public void resumeCar(Car car);

	public void updateApproveCae(Car car);

	public List<Map<String, Object>> selectRentList(@Param("user") User user, @Param("paging") Paging paging);

	public int selectCntLentList(User user);

	public int selectOngoing(User user);

	public int selectDone(User user);

	public int selectCancel(User user);

	public Integer getAvalible(User user);

	public Integer getExpectation(User user);

	public Integer getTotal(User user);

	public int selectCntProceedsList(User user);

	public List<Map<String, Object>> selectProceedsList(@Param("user") User user, @Param("paging") Paging paging);

	public String selectAccount(User user);

	public void commit(List<String> rentNos);

	public int selectCntWithdrawList(User user);

	public List<Map<String, Object>> selectWithdrawList(@Param("user") User user, @Param("paging") Paging paging);

	public int selectCntChargeList(User user);

	public List<Map<String, Object>> selectChargeList(@Param("user") User user, @Param("paging") Paging paging);
	

}
