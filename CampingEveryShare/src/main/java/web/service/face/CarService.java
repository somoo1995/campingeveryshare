package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Account;
import web.dto.BoardFile;
import web.dto.Car;
import web.dto.User;
import web.util.Paging;

public interface CarService {

	int carWrite(Car car, List<MultipartFile> carFile);

	List<Map<String, Object>> getCarNoByUserId(User user);

	Car getCarInfoByCarNo(Car car);

	BoardFile getFileInfoByCarNo(Car car);

	int updateCar(Car car, List<MultipartFile> carFile);

	void deleteCar(Car car);

	void stopCar(Car car);

	void resumeCar(Car car);

	void approveCar(Car car);

	List<Map<String, Object>> getRentList(User user, Paging paging);

	Paging getPaging(Paging param, User user);

	int getOngoing(User user);

	int getDone(User user);

	int getCancel(User user);

	Map<String, Object> getIndexInfo(User user);

	List<Map<String, Object>> getProceedsInfo(User user, Paging param);

	void commit(List<String> rentNos);

	List<Map<String, Object>> getWithdrawoInfo(User user, Paging withPaging);

	List<Map<String, Object>> getChargeInfo(User user, Paging chargePaging);

	void changeAccount(Account account);


}
