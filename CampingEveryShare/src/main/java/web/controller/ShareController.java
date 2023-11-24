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
import web.dto.Heart;
import web.dto.Recom;
import web.dto.Report;
import web.dto.Share;
import web.dto.User;
import web.service.face.ShareService;
import web.util.Paging;
  
@Controller
@RequestMapping("/share")
public class ShareController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	
	
	@Autowired ShareService shareService;
	
	@GetMapping("list")
	public String shareList(Paging param, Model model, Board board) {
		
		
		Paging paging = shareService.getPaging( param );
		logger.info("paging : {}", paging);
		
		
		
		List<Map<String, Object>> list = shareService.list(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
//		logger.info("board : {}", board);
		logger.info("list : {}", list);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
		
		return "share/main";
		
	}
	
	@GetMapping("view")
	public String shareView( Board board, BoardFile file, User user, Comm comm,  Model model, HttpSession session, Share share) {
		share = shareService.getPaid(share);

		board = shareService.shareView(board);
		
		user.setUserId(board.getUserId());
		
		user = shareService.getNick(user);
		
		List<BoardFile> boardFile = shareService.fileView(board);
		
		model.addAttribute("boardFile", boardFile);
		model.addAttribute("share", share);
		
		logger.info("board : {}" + board.toString());
		logger.info("model : {}" + model.toString());
		logger.info("share : {}" + share);
		logger.info("boarFile : {}", boardFile);
		
		
		//찜 상태 조회
		Heart heart = new Heart();
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setHeartNo(board.getBoardNo());
		heart.setBoardCate(board.getBoardCate());
		int heartCnt = shareService.getTotalCntHeart(heart);
		logger.info("totalHeart" + heartCnt);
		
		//찜 상태 전달
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setHeartNo(board.getBoardNo());
		heart.setBoardCate(board.getBoardCate());
		boolean isHeart = shareService.heartCnt(heart);
		model.addAttribute("isHeart", isHeart);
		model.addAttribute("cntHeart", shareService.getTotalCntHeart(heart));

		//신고 상태 조회
		Report report = new Report();
		report.setRuserId((String) session.getAttribute("loginId"));
		report.setBoardNo(board.getBoardNo());
		report.setBoardCate(board.getBoardCate());
		int reportCnt = shareService.getTotalCntReport(report);
		logger.info("totalHeart" + reportCnt);
		
		//신고 상태 전달
		report.setRuserId((String) session.getAttribute("loginId"));
		report.setBoardNo(board.getBoardNo());
		report.setBoardCate(board.getBoardCate());
		boolean isReport = shareService.reportCnt(report);
		model.addAttribute("isReport", isReport);
		model.addAttribute("cntReport", shareService.getTotalCntReport(report));
		
		//추천 상태 전달
		Recom recom = new Recom();
		recom.setUserId( (String) session.getAttribute("loginId"));
		recom.setBoardCate(board.getBoardCate());
		recom.setRecomNo(board.getBoardNo());
		logger.info("recom : {} " + recom.toString());
		boolean isRecom = shareService.reComCnt(recom);
		model.addAttribute("isRecom", isRecom);
		model.addAttribute("cntRecom", shareService.getTotalCntRecom(recom));
		logger.info("isRecom : {} " + isRecom);
//		logger.info("model : {} " + model.toString());
		
		//추천 상태 조회
		recom.setUserId((String) session.getAttribute("loginId"));
		recom.setRecomNo(board.getBoardNo());
		recom.setBoardCate(board.getBoardCate());	
		int totalCnt = shareService.getTotalCntRecom(recom);
		logger.info("totalCnt" + totalCnt);
		
		//댓글 리스트
		List<Comm> commList = shareService.getCommList(comm);
		logger.info("user : {} " + user.toString());
		logger.info("board : {} " + board.toString());
		logger.info("commList : {} " + commList.toString());

		model.addAttribute("commList", commList);
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		model.addAttribute("totalCnt", totalCnt);
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
			, HttpSession session
			, Share share) {
		logger.info("user : {} " + user);
		logger.info("board : {} " + board);
		logger.info("share : {} " + share);
		
		board.setUserId((String) session.getAttribute("loginId"));
		logger.info("sessionId : {}" + session.getAttribute("loginNick").toString());
		user.setUserNick((String) session.getAttribute("loginNick"));
		
		shareService.shareWrite(board, file, share);
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@GetMapping("/update")
	public String update(Board board, BoardFile file, User user, Share share, Model model, HttpSession session) {
		
		if(board.getBoardNo() < 1 ) {
			return "redirect:./view";
		}
		
		//상세보기 페이지 아님 표시
		board.setHit(-1);
		
		//상세보기 게시글 조회
		board = shareService.view(board);
		model.addAttribute("board", board);
		logger.info("board : {} " + board);
		share = shareService.getPaid(share);
		logger.info("share : {} " + share);
		model.addAttribute("share", share);
		
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
			, int[] delFileNo
			, Share share) {
		
		logger.info("board {}", board);
		logger.info("file {}", file);
		logger.info("delFileno {}", Arrays.toString(delFileNo));
		logger.info("share : {} : " + share);
		
		board.setUserId((String) session.getAttribute("userId"));
		user.setUserNick((String) session.getAttribute("userNick"));
		
		shareService.updateProc(board, file, delFileNo, share);
		
		return"redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board board, BoardFile boardFile, Model model) {
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}

//		shareService.delete(board, boardFile);
		shareService.delete(board);
		
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
		boolean result = shareService.recom(recom);
		logger.info("recom : {} " + recom.toString());
		mav.addObject("result", result);
		
		//추천 수
		int cnt = shareService.getTotalCntRecom(recom);
		mav.addObject("cnt", cnt);
		logger.info("cnt : {}" + cnt);
		
		mav.setViewName("jsonView");
		
		return mav;
	}

	@RequestMapping("/heart")
	public ModelAndView heart(Model model, Heart heart, Board board, ModelAndView mav, HttpSession session) {
		
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setBoardCate(board.getBoardCate());
		boolean hResult = shareService.heart(heart);

		mav.addObject("hResult", hResult);
		
		int hCnt = shareService.getTotalCntHeart(heart);
		mav.addObject("hCnt", hCnt);
		
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping("/report")
	public void report(Board board, Model model, Report report, HttpSession session, ModelAndView mav) {
		logger.info("board : {} " + board.toString());
		logger.info("model : {} " + model.toString());
		logger.info("report : {} " + report.toString());
	}
	
	@PostMapping("/report")
	public String reportProc(Board board, Model model, Report report, HttpSession session) {
		
		report.setRuserId((String) session.getAttribute("loginId"));
		report.setVuserId(board.getUserId());
		
		shareService.insertReport(report);
		return"redirect:./view?boardNo=" + board.getBoardNo();
	}
} 

