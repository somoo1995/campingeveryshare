package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Car;

public interface CarService {

	void carWrite(Car car, List<MultipartFile> carFile);

}
