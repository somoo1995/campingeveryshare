package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Review;

public interface ReviewService {
	
	public void writeReview(Review review);

	public List<Map<String, Object>> getReview(Car car);

	public void deleteReview(Review review);


}
