package web.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Board;
import web.service.face.SearchService;
import web.util.Paging;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired SearchService searchService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	@GetMapping("/search")
	public String search( Paging param, @RequestParam(value = "query", required = false) String query ) {
		logger.info("query : {}", query);
		logger.info("param : {}", param);
		
		return "mypage/search";
	}
	
	@PostMapping("/search")
	public String searchProc( 
			Model model,
			Paging param, 
			@RequestParam(value = "query", required = false) String query 
			) {
		logger.info("query : {}", query);
		logger.info("param : {}", param);
		
		Paging paging = searchService.getPaging(param, query);
		
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}
		logger.info("paging : {}", paging);
		logger.info("hasData : {}", hasData);
		
		List<Board> list = searchService.getList(paging);
		
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("hasData", hasData);
		model.addAttribute("list", list);
		
		return "mypage/result";
	}
	
}
