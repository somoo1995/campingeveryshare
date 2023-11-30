package web.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.dto.Car;
import web.dto.Income;
import web.dto.Rent;
import web.dto.User;
import web.service.face.RentService;
import web.service.face.ReviewService;
import web.util.Paging;

@Controller
@RequestMapping("/rent")
public class RentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired RentService rentService;
	@Autowired ReviewService reviewService;
	
	@RequestMapping("/list")
	public String rentHandler(Model model, Paging param, HttpServletRequest request) {
	    logger.info("param : {}", param);

	    Paging paging = rentService.getPaging(param);
	    logger.info("paging : {}", paging);

	    List<Map<String, Object>> list = rentService.getCarList(paging);
	    logger.info("list : {}", list);

	    model.addAttribute("paging", paging);
	    model.addAttribute("list", list);

	    if (request.getMethod().equals("GET")) {
	        return "rent/main";
	    } else if (request.getMethod().equals("POST")) {
	        return "rent/list";
	    } else {
	        return "error"; 
	    }
	}
	
	
//	@GetMapping("/list")
//	public String rentMain( Model model, Paging param) {
//		logger.info("param : {}", param);
//		
//		Paging paging = rentService.getPaging(param);
//		logger.info("paging : {}", paging);
//		
//		List<Map<String, Object>> list = rentService.getCarList(paging);
//		logger.info("list : {}", list);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("paging", paging);
//		
//		return "rent/main";
//		
//	}
//	
//	@PostMapping("/list")
//	public String rentList( Model model, Paging param ) {
//		logger.info("param : {}", param);
//		
//		Paging paging = rentService.getPaging(param);
//		logger.info("paging : {}", paging);
//		
//		List<Map<String, Object>> list = rentService.getCarList(paging);
//		logger.info("list : {}", list);
//		
//		model.addAttribute("paging", paging);
//		model.addAttribute("list", list);
//		return "rent/list";
//	}
	
	@RequestMapping("/view")
	public void rentView( Model model, Car car ) {
		logger.info("carNo : {}", car);
		
		car = rentService.view(car);
		List<Rent> list = rentService.getRentList(car);
				
		logger.info("car : {}", car);
		
		model.addAttribute("car", car);
		model.addAttribute("list", list);
		
	}
	
	@Transactional                                                                                                     
	@RequestMapping("/book")
	public String book( Model model, Rent rent, String startDate, @SessionAttribute("loginId") String userId, Income income ) {
		rent.setUserId(userId);
//		logger.info("rent : {}", rent);
		
		rentService.book(rent);

		Car car = new Car();
		car.setCarNo(rent.getCarNo());
//		logger.info("car : {} ", car);
		
		List<Rent> list = rentService.getRentList(car);
		model.addAttribute("list", list);
		
//		return "redirect:/rent/view?=" + rent.getCarNo();
		return "redirect:/booking/main";
	}
	
	@RequestMapping("/user")
	public String user( Model model, @SessionAttribute("loginId") String userId) {
		User user = new User();
		user.setUserId(userId);
		
		user = rentService.getGuestInfo(user);
		model.addAttribute("user", user);
		
		return "jsonView";
	}
	
	@RequestMapping("/review")
	public String review( Model model, Car car ) {
		logger.info("car : {}", car);
		
		List<Map<String,Object>> list = reviewService.getReview(car);
//		logger.info("list : {} ", list);
		model.addAttribute("list", list);
		
		return "rent/review";
	}
	

}
