package web.controller;

import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartFile;

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
	public void noticeView( Board board, Admin admin, Model model, HttpSession session) {
	
		board = noticeService.noticeView(board);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("board : {}" + board.toString());
		
		admin = noticeService.getAdminCode(admin);
		logger.info("admin : {} " + admin);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);
	}
	
	@GetMapping("/write")
	public void write() {
	}
	
	@PostMapping("/write")
	public String noticeWrite(
			Admin admin
			, Board board
			, HttpSession session
	) {
		logger.info("board : {} " + board);

		board.setUserId((String) session.getAttribute("adminCode"));
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("board : {} " + board);
		
		noticeService.noticeWrite(board);
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}

	@GetMapping("/update")
	public String update(Board board, Admin admin, Model model, HttpSession session) {
		
		if(board.getBoardNo() < 1 ) {
			return "redirect:./view";
		}
		//상세보기 페이지 아님 표시
		board.setHit(-1);
		
		//상세보기 게시글 조회
		board = noticeService.view(board);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("board : {}" + board.toString());
		
		admin = noticeService.getAdminCode(admin);

		model.addAttribute("board", board);
		model.addAttribute("admin", admin);

		
		return "notice/update";
	}
	
	@PostMapping("/update")
	public String updateProc(
			Admin admin
			, Board board
			, HttpSession session
	) {
		
		logger.info("board {}", board);

		board.setUserId((String) session.getAttribute("adminCode"));
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		
		noticeService.updateProc(board);
		
		return"redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board board, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}

		noticeService.delete(board);
		
		return "redirect:./list";
	}
	
	
	
}
