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
import web.dto.Rent;
import web.dto.Review;
import web.dto.User;
import web.service.face.RentService;
import web.util.Paging;

@Controller
@RequestMapping("/rent")
public class RentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired RentService rentService;
	
	
	@RequestMapping("/list")
	public String rentList( Model model, Paging param  ) {
		
		Paging paging = rentService.getPaging(param);
		logger.info("paging : {}", paging);
		
		List<Map<String, Object>> list = rentService.getCarList(paging);
		logger.info("list : {}", list);
		
		model.addAttribute("list", list);
		
		return "rent/main";
	}
	
	@RequestMapping("/view")
	public void rentView( Model model, Car car ) {
		logger.info("carNo : {}", car);
		
		car = rentService.view(car);
		List<Rent> list = rentService.getRentList(car);
				
		logger.info("car : {}", car);
		
		model.addAttribute("car", car);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/book")
	public String book( Model model, Rent rent, @SessionAttribute("loginId") String userId ) {
		rent.setUserId(userId);		
		logger.info("rent : {}", rent);
		
		rentService.book(rent);
//		rentService.income(rent);

		Car car = new Car();
		car.setCarNo(rent.getCarNo());
		logger.info("car : {} ", car);
		
		List<Rent> list = rentService.getRentList(car);
		model.addAttribute("list", list);
		
		return "redirect:/rent/view?carNo=" + car.getCarNo();
	}
	
	@RequestMapping("/user")
	public String user( Model model, @SessionAttribute("loginId") String userId) {
		User user = new User();
		user.setUserId(userId);
		
		user = rentService.getGuestInfo(user);
		model.addAttribute("user", user);
		
		return "jsonView";
	}
	
	@PostMapping("/payment")
	public void payment( String merchantUid, String impUid ) {
		logger.info("impUid : {} ", impUid);
		logger.info("merchantUid : {} ", merchantUid);
	}
	

}
