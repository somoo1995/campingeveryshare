package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.dto.Car;
import web.dto.Review;
import web.service.face.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired ReviewService reviewService;

	@RequestMapping("/list")
	public String review( Model model, Car car ) {
		
		List<Map<String, Object>> list = reviewService.getReview(car);
		model.addAttribute("list", list);
		
		return "rent/review";
	}
	
	@PostMapping("/write")
	public String reviewWrite( Review review, @SessionAttribute("loginId") String userId ) {
		review.setUserId(userId);
		
		
		logger.info("review : {}", review);
		reviewService.writeReview(review);
		
		return "jsonView";
	}
	
	
}
