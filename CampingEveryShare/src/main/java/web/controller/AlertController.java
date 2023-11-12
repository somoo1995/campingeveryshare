package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Alert;
import web.service.face.AlertService;

@Controller
@RequestMapping("/mypage")
public class AlertController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired AlertService alertService;
	
	@RequestMapping("/fail")
	public void noLogin() {}
	
	@GetMapping("/alert")
	public String alert( Model model, Alert alert ) {
		logger.info("alert : {}", alert);
		
		List<Alert> list = alertService.getList(alert);
		
		model.addAttribute("list", list);
		
		return "mypage/alert";
	}
	

	
	
}
