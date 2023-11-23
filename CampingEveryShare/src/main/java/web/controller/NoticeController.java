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

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.Group;
import web.dto.Recom;
import web.dto.Report;
import web.dto.User;
import web.service.face.NoticeService;
import web.util.Paging;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired NoticeService noticeService;
	
	@GetMapping("list")
	public void noticeList(Paging param, Model model, Board board, Admin admin, HttpSession session) {
		
		param.setType((String) session.getAttribute("adminCode"));
		
		Paging paging = noticeService.getPaging( param );
		logger.info("paging : {}", paging);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("admin : {}", admin);
		
		List<Map<String, Object>> list = noticeService.list(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);
		
//		logger.info("board : {}", board);
		logger.info("list : {}", list);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
	}

	@GetMapping("view")
	public String noticeView( Board board, Admin admin, Model model, HttpSession session) {
	
//		board = noticeService.noticeView(board);
//		admin.setAdminCode((String) session.getAttribute("adminCode"));
//		logger.info("board : {}" + board.toString());
//		
//		List<BoardFile> boardFile = groupService.fileView(board);
//		model.addAttribute("boardFile", boardFile);
//		model.addAttribute("group", group);
//		logger.info("boarFile : {}", boardFile);
//		logger.info("group : {}", group);
//		
//		//댓글 리스트
//		List<Comm> commList = groupService.getCommList(comm);
//		logger.info("user : {} " + user.toString());
//		logger.info("board : {} " + board.toString());
//		logger.info("commList : {} " + commList.toString());
//
//		model.addAttribute("commList", commList);
//		model.addAttribute("board", board);
//		model.addAttribute("user", user);
//		model.addAttribute("totalCnt", totalCnt);
		return "/group/view";
	}
	
	
	
}
