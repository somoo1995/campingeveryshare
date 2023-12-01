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
import org.springframework.web.servlet.ModelAndView;

import web.dto.Board;
import web.dto.Heart;
import web.service.face.HeartService;
import web.service.face.MarketService;
import web.service.face.RentService;
import web.service.face.ShareService;
import web.util.Paging;

@Controller
@RequestMapping("/heart")
public class HeartController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired HeartService heartService;
	@Autowired MarketService marketService;
	@Autowired RentService rentService;
	@Autowired ShareService shareService;
	
	
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
		model.addAttribute("param", param);

		//찜 상태 조회
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
		model.addAttribute("param", param);

		//찜 상태 조회
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
		
		//찜 상태 조회
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setHeartNo(board.getBoardNo());
		heart.setBoardCate(board.getBoardCate());
		int heartCnt = marketService.getTotalCntHeart(heart);
		logger.info("totalHeart" + heartCnt);
		
		//찜 상태 전달
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setHeartNo(board.getBoardNo());
		heart.setBoardCate(board.getBoardCate());
		boolean isHeart = marketService.heartCntList(heart);
		model.addAttribute("isHeart", isHeart);
		model.addAttribute("cntHeart", marketService.getTotalCntHeart(heart));
		model.addAttribute("loginId", session.getAttribute("loginId"));
		
		logger.info("heart : {}", heart);
		logger.info("board : {}", board);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
		
		return "heart/market";
	}

	
	@RequestMapping("/heart")
	public ModelAndView heart(Model model, Heart heart, Board board, ModelAndView mav, HttpSession session) {
		
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setBoardCate(board.getBoardCate());
		boolean hResult = marketService.heart(heart);

		mav.addObject("hResult", hResult);
		
		int hCnt = marketService.getTotalCntHeart(heart);
		mav.addObject("hCnt", hCnt);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/heart2")
	public ModelAndView heart2(Model model, Heart heart, Board board, ModelAndView mav, HttpSession session) {
		
		heart.setUserId((String) session.getAttribute("loginId"));
		heart.setBoardCate(board.getBoardCate());
		boolean hResult = shareService.heart(heart);

		mav.addObject("hResult", hResult);
		
		int hCnt = shareService.getTotalCntHeart(heart);
		mav.addObject("hCnt", hCnt);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
}
