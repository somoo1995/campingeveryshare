package web.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import web.dto.BoardFile;
import web.dto.Car;
import web.dto.User;

public interface CarService {

	int carWrite(Car car, List<MultipartFile> carFile);

	List<Map<String, Object>> getCarNoByUserId(User user);

	Car getCarInfoByCarNo(Car car);

	BoardFile getFileInfoByCarNo(Car car);

	int updateCar(Car car, List<MultipartFile> carFile);

	void deleteCar(Car car);

	void stopCar(Car car);

	void resumeCar(Car car);

}
