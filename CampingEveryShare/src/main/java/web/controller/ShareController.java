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

import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.User;
import web.service.face.ShareService;
import web.util.Paging;

@Controller
@RequestMapping("/share")
public class ShareController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	
	
	@Autowired ShareService shareService;
	
	@GetMapping("list")
	public void shareList(Paging param, Model model, Board board) {
		
		
		Paging paging = shareService.getPaging( param );
		logger.info("paging : {}", paging);

		logger.info("board : {}" + board.toString());
		
		List<Map<String,Object>> list = shareService.list(paging);
		logger.info("list : {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	}
	
	@GetMapping("view")
	public String shareView(Board board, BoardFile file, User user, Comm comm,  Model model, HttpSession session) {
	
		board = shareService.shareView(board);
		user.setUserId(board.getUserId());
		user = shareService.getNick(user);
		
		List<BoardFile> boardFile = shareService.fileView(board);
		model.addAttribute("boardFile", boardFile);
		logger.info("boarFile : {}", boardFile);
		
//		//추천 상태 조회
//		Recom recom = new Recom();
//		recom.setBoardCate(board.getBoardCate()); //게시글 번호
//		recom.setUserId((String)session.getAttribute("userId")); //로그인한 아이디
//		
//		//추천 상태 전달
//		boolean isRecom = shareService.isRecom(comm);
//		model.addAttribute("isRecom", isRecom);
//		model.addAttribute("cntRecom", shareService.getTotalCntRecom(comm));
				
		List<Comm> commList = shareService.getCommList(comm);
		
		logger.info("user : {} " + user.toString());
		logger.info("board : {} " + board.toString());
		logger.info("commList : {} " + commList.toString());
		
		model.addAttribute("commList", commList);
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		return "/share/view";
	}
	
	
	@GetMapping("/write")
	public void write() {
	}
	
	@PostMapping("/write")
	public String shareWrite(
			User user
			, Board board
			, List<MultipartFile> file
			, HttpSession session) {
		user.setUserId((String) session.getAttribute("userId"));
		user.setUserNick((String) session.getAttribute("userNick"));
		
		shareService.shareWrite(board, file);
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@GetMapping("/update")
	public String update(Board board, BoardFile file, User user, Model model, HttpSession session) {
		
		if(board.getBoardNo() < 1 ) {
			return "redirect:./view";
		}
		//상세보기 페이지 아님 표시
		board.setHit(-1);
		
		//상세보기 게시글 조회
		board = shareService.view(board);
		model.addAttribute("board", board);

		//첨부파일 정보 전달
		List<BoardFile> boardfile = shareService.getAttachFile( board );
		model.addAttribute("boardfile", boardfile);
		
		return "share/update";
	}
	
	@PostMapping("/update")
	public String updateProc(
			User user
			, Board board
			, List<MultipartFile> file
			, HttpSession session
			, int[] delFileNo) {
		
		logger.info("board {}", board);
		logger.info("file {}", file);
		logger.info("delFileno {}", Arrays.toString(delFileNo));

		board.setUserId((String) session.getAttribute("userId"));
		user.setUserNick((String) session.getAttribute("userNick"));
		
		shareService.updateProc(board, file, delFileNo);
		
		return"redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board board, BoardFile boardFile, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}

		shareService.delete(board, boardFile);
		
		return "redirect:./list";
	
	}
} 
