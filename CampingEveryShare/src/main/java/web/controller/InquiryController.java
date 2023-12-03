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
import web.dto.User;
import web.service.face.AdminService;
import web.service.face.InquiryService;
import web.util.Paging;

@Controller
public class InquiryController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired InquiryService inquiryService;
	@Autowired AdminService adminService;
	
	@GetMapping("/inquiry/list")
	public void inquiryList(Paging param, Admin admin, Model model, Board board, HttpSession session) {
		
		logger.info("sessionAd : " + session.getAttribute("adminCode"));
		param.setType((String) session.getAttribute("adminCode"));

		Paging paging = inquiryService.getPaging( param );
		logger.info("paging : {}", paging);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		
		
		List<Map<String, Object>> list = inquiryService.list(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);

	     logger.info("sessionId : " + session.getAttribute("loginId"));

//		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("admin : {}", admin);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
	}
	
	@GetMapping("/inquiry/view")
	public String groupView( Board board, BoardFile file, User user, Comm comm, Model model, Admin admin, HttpSession session) {
	
		board = inquiryService.inquiryView(board);
		user.setUserId(board.getUserId());
		user = inquiryService.getNick(user);
		logger.info("board : {}" + board.toString());
		
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		admin = inquiryService.getAdminCode(admin);
		
		List<BoardFile> boardFile = inquiryService.fileView(board);
		model.addAttribute("boardFile", boardFile);
		logger.info("boarFile : {}", boardFile);
		
		
		//댓글 리스트
		List<Comm> commList = inquiryService.getCommList(comm);
		logger.info("user : {} " + user.toString());
		logger.info("board : {} " + board.toString());
		logger.info("commList : {} " + commList.toString());

		model.addAttribute("commList", commList);
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		model.addAttribute("admin", admin);

		return "/inquiry/view";
	}
	
	
	@GetMapping("/inquiry/write")
	public void write() {
	}
	
	@PostMapping("/inquiry/write")
	public String groupWrite(
			User user
			, Board board
			, List<MultipartFile> file
			, HttpSession session ) {
		logger.info("user : {} " + user);
		logger.info("board : {} " + board);

		board.setUserId((String) session.getAttribute("loginId"));
		logger.info("sessionId : {}" + session.getAttribute("loginNick").toString());
		user.setUserNick((String) session.getAttribute("loginNick"));
		logger.info("board : {} " + board);
		
		inquiryService.inquiryWrite(board, file);
		
		return "redirect:/inquiry/view?boardNo=" + board.getBoardNo();
	}
	
	@GetMapping("/inquiry/update")
	public String update(Board board, BoardFile file, User user, Model model, HttpSession session) {
		
		if(board.getBoardNo() < 1 ) {
			return "redirect:./view";
		}
		//상세보기 페이지 아님 표시
		board.setHit(-1);
		
		//상세보기 게시글 조회
		board = inquiryService.view(board);
		model.addAttribute("board", board);

		//첨부파일 정보 전달
		List<BoardFile> boardfile = inquiryService.getAttachFile( board );
		model.addAttribute("boardfile", boardfile);
		
		return "/inquiry/update";
	}
	
	@PostMapping("/inquiry/update")
	public String updateProc(
			User user
			, Board board
			, List<MultipartFile> file
			, HttpSession session
			, int[] delFileNo ) {
		
		logger.info("board {}", board);
		logger.info("file {}", file);
		logger.info("delFileno {}", Arrays.toString(delFileNo));

		board.setUserId((String) session.getAttribute("userId"));
		user.setUserNick((String) session.getAttribute("userNick"));
		
		inquiryService.updateProc(board, file, delFileNo);
		
		return"redirect:/inquiry/view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/inquiry/delete")
	public String delete(Board board, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "redirect:/inquiry/list";
		}

//		groupService.delete(board, boardFile);
		inquiryService.delete(board);
		
		return "redirect:/inquiry/list";
	}

	@GetMapping("/admin/inquirylist")
	public void inquiryAdminList(Paging param, Admin admin, Model model, Board board, HttpSession session) {
		
		logger.info("sessionAd : " + session.getAttribute("adminCode"));
		param.setType((String) session.getAttribute("adminCode"));

		Paging paging = inquiryService.getPaging( param );
		logger.info("paging : {}", paging);
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		
		
		List<Map<String, Object>> list = inquiryService.list(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		model.addAttribute("admin", admin);

	     logger.info("sessionId : " + session.getAttribute("loginId"));

//		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("admin : {}", admin);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
	}
	
	@GetMapping("/admin/inquiryview")
	public String inquiryAdminView( Board board, BoardFile file, User user, Comm comm, Model model, Admin admin, HttpSession session) {
	
		board = inquiryService.inquiryView(board);
		user.setUserId(board.getUserId());
		user = inquiryService.getNick(user);
		logger.info("board : {}" + board.toString());
		
		admin.setAdminCode((String) session.getAttribute("adminCode"));
		admin = inquiryService.getAdminCode(admin);
		
		List<BoardFile> boardFile = inquiryService.fileView(board);
		model.addAttribute("boardFile", boardFile);
		logger.info("boarFile : {}", boardFile);
		
		
		//댓글 리스트
		List<Comm> commList = inquiryService.getCommList(comm);
		logger.info("user : {} " + user.toString());
		logger.info("board : {} " + board.toString());
		logger.info("commList : {} " + commList.toString());

		model.addAttribute("commList", commList);
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		model.addAttribute("admin", admin);

		return "/admin/inquiryview";
	}
	
	
	
}
