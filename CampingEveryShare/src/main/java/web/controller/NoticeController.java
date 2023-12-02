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
import org.springframework.web.servlet.ModelAndView;

import web.dto.Admin;
import web.dto.Board;
import web.dto.User;
import web.service.face.NoticeService;
import web.util.Paging;

@Controller
public class NoticeController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired NoticeService noticeService;
	
	@GetMapping("notice/list")
	public void noticeListByUser(Paging param, Model model, Board board, HttpSession session) {
		
//		param.setType((String) session.getAttribute("adminCode"));
		
		Paging paging = noticeService.getPaging( param );
		logger.info("paging : {}", paging);
//		admin.setAdminCode((String) session.getAttribute("adminCode"));
//		logger.info("admin : {}", admin);
		
		List<Map<String, Object>> list = noticeService.list(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
//		model.addAttribute("admin", admin);
		
//		logger.info("board : {}", board);
		logger.info("list : {}", list);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
	}

	@GetMapping("notice/view")
	public void noticeViewByUser( Board board, Model model, HttpSession session) {
	
		board = noticeService.noticeView(board);
//		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("board : {}" + board.toString());
		
//		admin = noticeService.getAdminCode(admin);
//		logger.info("admin : {} " + admin);
		model.addAttribute("board", board);
//		model.addAttribute("admin", admin);
	}
	
	@GetMapping("admin/noticelist")
	public void noticeList(Paging param, Model model, Board board, Admin admin, HttpSession session) {
		
		param.setType((String) session.getAttribute("adminCode"));
		
		Paging paging = noticeService.getPaging( param );
		logger.info("paging : {}", paging);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("admin : {}", admin);
		
		List<Map<String, Object>> list = noticeService.adminList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);
		
//		logger.info("board : {}", board);
//		logger.info("list : {}", list);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
	}

	@GetMapping("admin/noticeview")
	public void noticeView( Board board, Admin admin, Model model, HttpSession session) {
	
		board = noticeService.noticeView(board);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		logger.info("board : {}" + board.toString());
		
		admin = noticeService.getAdminCode(admin);
		logger.info("admin : {} " + admin);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);
	}
	
	@GetMapping("admin/noticewrite")
	public void write() {
	}
	
	@PostMapping("admin/noticewrite")
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
		
		return "redirect:/admin/noticeview?boardNo=" + board.getBoardNo();
	}

	@GetMapping("admin/noticeupdate")
	public String update(Board board, Admin admin, Model model, HttpSession session) {
		
		if(board.getBoardNo() < 1 ) {
			return "redirect:/admin/noticeview";
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

		
		return "/admin/noticeupdate";
	}
	
	@PostMapping("admin/noticeupdate")
	public String updateProc(
			Admin admin
			, Board board
			, HttpSession session
	) {
		
		logger.info("board {}", board);

		board.setUserId((String) session.getAttribute("adminCode"));
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		
		noticeService.updateProc(board);
		
		return"redirect:/admin/noticeview?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("admin/noticedelete")
	public String deleteNotice(Board board, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "/admin/noticelist";
		}

		noticeService.delete(board);
		
		return "redirect:/admin/noticelist";
	}
	
	@RequestMapping("/admin/status")
	public ModelAndView toggleDeleteStatus(Board board, Model model, ModelAndView mav) {
		logger.info("board 제대로 나오니 : {}", board);
		
		board.setBoardNo(board.getBoardNo());
		board.setBoardCate(board.getBoardCate());
		board.setDeleteStatus(board.getDeleteStatus());

		//글 삭제 상태 토글
	    boolean result = noticeService.deleteStatus(board);
	    
	    logger.info("board delete_status 내놔 : {}", board);
	    
	    mav.addObject("result", result);
	    mav.setViewName("jsonView");
	    
	    return mav;
	}
	
	
}
