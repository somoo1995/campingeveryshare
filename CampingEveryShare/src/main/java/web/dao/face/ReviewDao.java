package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Car;
import web.dto.Review;

public interface ReviewDao {

	public void insertReview(Review review);

	public List<Map<String, Object>> selectReviewByCar(Car car);

}
