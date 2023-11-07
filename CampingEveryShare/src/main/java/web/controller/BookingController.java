package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//어성권

@Controller
@RequestMapping("/booking")
public class BookingController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/list")
	public void bookinglist() {
		logger.info("하이?");
	}
}