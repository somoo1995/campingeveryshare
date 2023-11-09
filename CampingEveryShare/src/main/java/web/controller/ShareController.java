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

import web.dto.Board;
import web.service.face.ShareService;
import web.util.Paging;

@Controller
@RequestMapping("/share")
public class ShareController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	
	
	@Autowired ShareService shareService;
	
	@GetMapping("list")
	public void shareList(Paging param, Model model) {
		
		//페이징 계산
		Paging paging = shareService.getPaging( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String,Object>> list = shareService.list(paging);
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		logger.info("model {} :" + model.toString());
	}
	
	@GetMapping("view")
	public String shareView(Board board, Model model, HttpSession session) {
	
		List<Map<String,Object>> list = shareService.shareView(board);
		
		model.addAttribute("list", list);
		logger.info("list {} : " + list.toString());
		//ji
		logger.info("session {} : " + session.toString());
		return "/share/view";
	}
	
	
	@GetMapping("/write")
	public void write() {
		
	}
	
}
