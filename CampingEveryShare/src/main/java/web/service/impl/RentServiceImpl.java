package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CarDao;
import web.dao.face.RentDao;
import web.dto.Car;
import web.dto.Rent;
import web.dto.User;
import web.service.face.RentService;
import web.util.Paging;

@Service
public class RentServiceImpl implements RentService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired CarDao carDao;
	@Autowired RentDao rentDao;

	@Override
	public Paging getPaging(Paging param) {
				
		int totalCount = carDao.selectCntAll(param);
		Paging paging = new Paging( totalCount, param.getCurPage(), 9, 10 );
		
		return paging;
	}

	@Override
	public List<Car> getCarList(Paging paging) {
		
		List<Car> list = carDao.selectAll(paging);
		
		return list;
	}

	@Override
	public Car view(Car car) {
		return carDao.selectByCarNo(car);
	}

	@Override
	public List<Rent> getRentList(Car car) {
		
		List<Rent> list = rentDao.selectAllByCarNo(car);
		
		return list;
	}

	@Override
	public void book(Rent rent) {
		rentDao.insertRent(rent);
	}

	@Override
	public User getGuestInfo(User user) {
		return rentDao.selectUserByUserId(user);
	}

}
