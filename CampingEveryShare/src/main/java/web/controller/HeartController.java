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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Board;
import web.service.face.HeartService;
import web.util.Paging;

@Controller
@RequestMapping("/heart")
public class HeartController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired HeartService heartService;
	
	@GetMapping("main")
	public void heartListMain() {}
	
	@PostMapping("list")
	public String heartList(			
			Model model,
			Paging param, 
			HttpSession session
			) {
		logger.info("param : {}", param);
		
		Paging paging = heartService.getPaging(param);
		
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}
		logger.info("paging : {}", paging);
		logger.info("hasData : {}", hasData);
		
		List<Board> list = heartService.getList(paging);
		
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("hasData", hasData);
		model.addAttribute("list", list);
		
		return "heart/result";
	}
}
