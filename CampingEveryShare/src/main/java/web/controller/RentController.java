package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.face.RentService;
import web.util.Paging;

@Controller
@RequestMapping("/rent")
public class RentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired RentService rentService;
	
	@RequestMapping("/list")
	public void rentList( Model model, Paging param  ) {
		
		Paging paging = rentService.getPaging(param);
		logger.info("paging : {}", paging);
		
	}
}
