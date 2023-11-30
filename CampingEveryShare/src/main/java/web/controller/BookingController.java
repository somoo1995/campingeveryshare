package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.service.face.BookingService;
import web.util.Paging;

@Controller
@RequestMapping("/booking")
public class BookingController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BookingService bookingService;
	
	@GetMapping("/main")
	public void bookingMain() {}
	
	@PostMapping("/main")
	public String bookingList(
			Model model, 
			@SessionAttribute("loginId") String userId,
			@RequestParam(value="status", required = false) String status,
			Paging param
			) {
		logger.info("status : {}", status);
		Paging paging = bookingService.getPaging(param, status, userId);
		logger.info("paging : {}", paging);
		
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}
		
		logger.info("hasData : {}", hasData);
		
		List<Map<String, Object>> list = bookingService.getList(paging);
		
		logger.info("Booking list : {}", list);
			
		
		model.addAttribute("paging", paging);
		model.addAttribute("hasData", hasData);
		model.addAttribute("list", list);
		return "booking/list";
	}
	

}
