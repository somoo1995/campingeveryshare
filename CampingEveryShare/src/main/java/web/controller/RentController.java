package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Car;
import web.dto.Rent;
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
		
		List<Car> list = rentService.getCarList(paging);
		
		model.addAttribute("list", list);
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
	public void calendar() {
		
	}
	
	
	
}
