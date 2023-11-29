package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.CarDao;
import web.dto.BoardFile;
import web.dto.Car;
import web.dto.User;
import web.service.face.CarService;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired CarDao carDao;
	@Autowired ServletContext context;

	@Override
	public int carWrite(Car car, List<MultipartFile> carFile) {
		
		if(carDao.selectBycarNumber(car) >=1) {
			return 1;
		}
		
		carDao.insertCarWrite(car);
		if(carFile.size() == 0) {
			return 0;
		}
		
		for(MultipartFile f : carFile) {
			this.fileinsert(f,car.getCarNo());
		}
		return 0;
		
	}
	
	private void fileinsert(MultipartFile carFile, int carNo) {
		if(carFile.getSize() <= 0) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		System.out.println(storedPath);
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String originName = carFile.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		File dest = new File(storedFolder, storedName);
		
		try {
			carFile.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BoardFile boardFile = new BoardFile();
		boardFile.setBoardNo(carNo);
		boardFile.setOriginName(originName);
		boardFile.setStoredName(storedName);
		boardFile.setBoardCate(1);
		if(carDao.checkFile(boardFile) == 0) {
			carDao.insertFile(boardFile);
		}else {
			carDao.updateFile(boardFile);
		}
	}

	@Override
	public List<Map<String, Object>> getCarNoByUserId(User user) {
		List<Integer> carNoList = new ArrayList<Integer>();
		carNoList = carDao.selectCarNoByUserId(user);
		
		List<Map<String,Object>> carListMap = new ArrayList<Map<String,Object>>();
		for(Integer carNo : carNoList) {
			Map<String,Object> carSummary = carDao.selectCarSummaryByCarNo(carNo);
			carListMap.add(carSummary);
			
		}
		return carListMap;
	}

	@Override
	public Car getCarInfoByCarNo(Car car) {
		
		return carDao.selectCarByCarNo(car);
	}

	@Override
	public BoardFile getFileInfoByCarNo(Car car) {
		// TODO Auto-generated method stub
		return carDao.selectFileInfoByCarNo(car);
	}

	@Override
	public int updateCar(Car car, List<MultipartFile> carFile) {
		carDao.updateCar(car);
		car = carDao.selectBycarNumberNew(car);
		if(carFile != null) {
			if(carFile.size() == 0) {
				return 0;
			}
			for(MultipartFile f : carFile) {
				this.fileinsert(f,car.getCarNo());
			}		
		}
		
		return 0;
		
	}

	@Override
	public void deleteCar(Car car) {
		carDao.deleteCar(car);
	}

	@Override
	public void stopCar(Car car) {
		carDao.updateCarStop(car);
		
	}

	@Override
	public void resumeCar(Car car) {
		carDao.resumeCar(car);
		
	}

	@Override
	public void approveCar(Car car) {
		carDao.updateApproveCae(car);
		
	}

}
