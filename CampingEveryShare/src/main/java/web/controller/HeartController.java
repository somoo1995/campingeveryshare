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
import web.dto.Heart;
import web.service.face.HeartService;
import web.util.Paging;

@Controller
@RequestMapping("/heart")
public class HeartController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired HeartService heartService;
	
	@GetMapping("main")
	public void heartListMain() {}
	
	@PostMapping("rent")
	public String rentList(			
			Model model,
			Paging param, 
			HttpSession session,
			Heart heart,
			Board board
			) {
		
		param.setType((String) session.getAttribute("loginId"));
		param.setCategory(heart.getBoardCate());
		logger.info("param : {}", param);
		
		Paging paging = heartService.getPaging( param );
		logger.info("paging : {}", paging);
		paging.setType((String) session.getAttribute("loginId"));
		paging.setCategory(heart.getBoardCate());
		
		
		
		List<Map<String, Object>> list = heartService.list(paging);
		
		board.setBoardCate(heart.getBoardCate());
		board.setUserId(heart.getUserId());
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("heart : {}", heart);
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
		
		return "heart/rent";
	}

	
	@PostMapping("share")
	public String shareList(			
			Model model,
			Paging param, 
			HttpSession session,
			Heart heart,
			Board board
			) {

		param.setType((String) session.getAttribute("loginId"));
		param.setCategory(heart.getBoardCate());
		logger.info("param : {}", param);
		
		Paging paging = heartService.getPaging( param );
		logger.info("paging : {}", paging);
		paging.setType((String) session.getAttribute("loginId"));
		paging.setCategory(heart.getBoardCate());
		
		
		
		List<Map<String, Object>> list = heartService.list(paging);
		
		board.setBoardCate(heart.getBoardCate());
		board.setUserId(heart.getUserId());
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("heart : {}", heart);
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
		
		return "heart/share";
	}

	@PostMapping("market")
	public String marketList(			
			Model model,
			Paging param, 
			HttpSession session,
			Heart heart,
			Board board
			) {
		
		param.setType((String) session.getAttribute("loginId"));
		param.setCategory(heart.getBoardCate());
		logger.info("param : {}", param);
		
		Paging paging = heartService.getPaging( param );
		logger.info("paging : {}", paging);
		paging.setType((String) session.getAttribute("loginId"));
		paging.setCategory(heart.getBoardCate());
		
		
		
		List<Map<String, Object>> list = heartService.list(paging);
		
		board.setBoardCate(heart.getBoardCate());
		board.setUserId(heart.getUserId());
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("heart : {}", heart);
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
		
		return "heart/market";
	}

	@PostMapping("group")
	public String groupList(			
			Model model,
			Paging param, 
			HttpSession session,
			Heart heart,
			Board board
			) {
		
		param.setType((String) session.getAttribute("loginId"));
		param.setCategory(heart.getBoardCate());
		logger.info("param : {}", param);
		
		Paging paging = heartService.getPaging( param );
		logger.info("paging : {}", paging);
		paging.setType((String) session.getAttribute("loginId"));
		paging.setCategory(heart.getBoardCate());
		
		
		
		List<Map<String, Object>> list = heartService.list(paging);
		
		board.setBoardCate(heart.getBoardCate());
		board.setUserId(heart.getUserId());
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("heart : {}", heart);
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
		
		return "heart/group";
	}
	
}
