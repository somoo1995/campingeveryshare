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
	
	@GetMapping("/list")
	public void bookinglist( 
			Model model, 
			HttpSession session,
			@RequestParam(value="rentstatus", required = false) String status,
			Paging param
			) {
//		logger.info("param : {}", param);
//		logger.info("status : {}", status);
		
		Rent rent = new Rent();
		rent.setUserId((String) session.getAttribute("userId"));
		logger.info("rent : {}", rent);
		
		Paging paging = bookingService.getPaging(param, status, rent);
	
//		List<Rent> list = bookingService.getList(paging);
//		logger.info("list {} : ", list);
		
		List<Map<String, Object>> list = bookingService.getList(paging, rent);
		
	}
}
