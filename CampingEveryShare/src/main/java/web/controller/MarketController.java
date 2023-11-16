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
import org.springframework.web.servlet.ModelAndView;

import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.Recom;
import web.dto.User;
import web.service.face.MarketService;
import web.util.Paging;
  
@Controller
@RequestMapping("/market")
public class MarketController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	
	
	@Autowired MarketService marketService;
	
	@GetMapping("list")
	public void marketList(Paging param, Model model, Board board) {
		
		
		Paging paging = marketService.getPaging( param );
		logger.info("paging : {}", paging);
		
		
		
		List<Map<String, Object>> list = marketService.list(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	}
	
	@GetMapping("view")
	public String marketView( Board board, BoardFile file, User user, Comm comm,  Model model, HttpSession session) {
	
		board = marketService.marketView(board);
		user.setUserId(board.getUserId());
		user = marketService.getNick(user);
		logger.info("board : {}" + board.toString());
		
		List<BoardFile> boardFile = marketService.fileView(board);
		model.addAttribute("boardFile", boardFile);
		logger.info("boarFile : {}", boardFile);
		
		
		//추천 상태 전달
		Recom recom = new Recom();
		recom.setUserId( (String) session.getAttribute("loginId"));
		recom.setBoardCate(board.getBoardCate());
		recom.setRecomNo(board.getBoardNo());
		logger.info("recom : {} " + recom.toString());
		boolean isRecom = marketService.reComCnt(recom);
		model.addAttribute("isRecom", isRecom);
		model.addAttribute("cntRecom", marketService.getTotalCntRecom(recom));
		logger.info("isRecom : {} " + isRecom);
//		logger.info("model : {} " + model.toString());
		
		//추천 상태 조회
		recom.setUserId((String) session.getAttribute("loginId"));
		recom.setRecomNo(board.getBoardNo());
		recom.setBoardCate(board.getBoardCate());	
		int totalCnt = marketService.getTotalCntRecom(recom);
		logger.info("totalCnt" + totalCnt);
		
		//댓글 리스트
		List<Comm> commList = marketService.getCommList(comm);
		logger.info("user : {} " + user.toString());
		logger.info("board : {} " + board.toString());
		logger.info("commList : {} " + commList.toString());

		model.addAttribute("commList", commList);
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		model.addAttribute("totalCnt", totalCnt);
		return "/market/view";
	}
	
	
	@GetMapping("/write")
	public void write() {
	}
	
	@PostMapping("/write")
	public String marketWrite(
			User user
			, Board board
			, List<MultipartFile> file
			, HttpSession session) {
		logger.info("user : {} " + user);
		logger.info("board : {} " + board);

		board.setUserId((String) session.getAttribute("loginId"));
		logger.info("sessionId : {}" + session.getAttribute("loginNick").toString());
		user.setUserNick((String) session.getAttribute("loginNick"));
		logger.info("board : {} " + board);
		
		marketService.marketWrite(board, file);
		
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
		board = marketService.view(board);
		model.addAttribute("board", board);

		//첨부파일 정보 전달
		List<BoardFile> boardfile = marketService.getAttachFile( board );
		model.addAttribute("boardfile", boardfile);
		
		return "market/update";
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
		
		marketService.updateProc(board, file, delFileNo);
		
		return"redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board board, BoardFile boardFile, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}

		marketService.delete(board, boardFile);
		
		return "redirect:./list";
	}

	@RequestMapping("/recom")
	public ModelAndView recom(Model model, Recom recom, Board board, ModelAndView mav, HttpSession session) {

		//추천 정보 토글
		logger.info("session : {}" + session.getAttribute("loginId").toString());
		logger.info("board : {}" + board.toString());
		logger.info("model : {}" + model.toString());
		recom.setUserId((String) session.getAttribute("loginId"));
		recom.setBoardCate(board.getBoardCate());
		boolean result = marketService.recom(recom);
		logger.info("recom : {} " + recom.toString());
		mav.addObject("result", result);
		
		//추천 수
		int cnt = marketService.getTotalCntRecom(recom);
		mav.addObject("cnt", cnt);
		logger.info("cnt : {}" + cnt);
		
		mav.setViewName("jsonView");
		
		return mav;
	}






} 

