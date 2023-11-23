package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.CarDao;
import web.dto.BoardFile;
import web.dto.Car;
import web.service.face.CarService;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired CarDao carDao;
	@Autowired ServletContext context;

	@Override
	public void carWrite(Car car, List<MultipartFile> carFile) {
		
		carDao.insertCarWrite(car);
		if(carFile.size() == 0) {
			return;
		}
		
		for(MultipartFile f : carFile) {
			this.fileinsert(f,car.getCarNo());
		}
		
	}
	
	private void fileinsert(MultipartFile carFile, int carNo) {
		if(carFile.getSize() <= 0) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		
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
		
		carDao.insertFile(boardFile);
	}

}
