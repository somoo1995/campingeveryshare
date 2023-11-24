package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ReviewDao;
import web.dto.Car;
import web.dto.Review;
import web.service.face.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired ReviewDao reviewDao;

	@Override
	public void writeReview(Review review) {
		reviewDao.insertReview(review);
	}

	@Override
	public List<Map<String, Object>> getReview(Car car) {
		
		
		
		List<Map<String, Object>> list = reviewDao.selectReviewByCar(car);
		
		return list;
	}
	
}
