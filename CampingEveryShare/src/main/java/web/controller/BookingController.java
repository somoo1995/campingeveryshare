package web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Rent;
import web.service.face.BookingService;
import web.util.Paging;

@Controller
@RequestMapping("/booking")
public class BookingController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BookingService bookingService;
	
	@GetMapping("/main")
	public void bookingMain( 
			Model model, 
			HttpSession session,
			@RequestParam(required = false) String status,
			Paging param
			) {
		
		Rent rent = new Rent();
		rent.setUserId((String) session.getAttribute("loginId"));
			
		Paging paging = bookingService.getPaging(param, status, rent);
		
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}
	
		model.addAttribute("hasData", hasData);
		
	}
	
	@RequestMapping("/list")
	public String bookingList(
			Model model, 
			HttpSession session,
			@RequestParam(required = false) String status,
			Paging param
			) {
		
		Rent rent = new Rent();
		rent.setUserId((String) session.getAttribute("loginId"));
			
		Paging paging = bookingService.getPaging(param, status, rent);
		logger.info("paging : {}", paging);
		
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}
		
		List<Map<String, Object>> list = bookingService.getList(paging, rent);
		logger.info("list {} : ", list);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("hasData", hasData);
		model.addAttribute("list", list);
		return "booking/list";
	}
	
}
