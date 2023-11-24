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
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Comm;
import web.dto.Group;
import web.dto.Heart;
import web.dto.Recom;
import web.dto.Report;
import web.dto.Share;
import web.dto.User;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired BoardService boardService;
	
	@GetMapping("/qnalist")
	public void List(Paging param, Model model, Board board) {
		
		
		Paging paging = boardService.getPaging( param );
		logger.info("paging : {}", paging);
		
		List<Map<String, Object>> qnaList = boardService.qnaList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("board", board);
		
	}
	
//	@GetMapping("view")
//	public String groupView( Board board, User user, Group group, Model model) {
//	
//		group = groupService.getStatus(group);
//		board = groupService.groupView(board);
//		logger.info("board : {}" + board.toString());
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
//		return "/board/qnaview";
//	}
	
	
}
