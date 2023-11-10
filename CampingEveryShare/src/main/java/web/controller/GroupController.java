package web.controller;

import java.util.HashMap;
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

import web.dao.face.GroupDao;
import web.dto.Board;
import web.dto.User;
import web.service.face.GroupService;
import web.util.Paging;

@RequestMapping("/group")
@Controller
public class GroupController {

	@Autowired GroupService groupService;
	@Autowired GroupDao groupDao;
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@RequestMapping("/list")
	public void groupList( Paging param, Model model ) {
	
		//페이징 계산
		Paging paging = groupService.getPaging( param );
		logger.info("{}", paging);
		logger.info("{}",paging.getStartNo());
		logger.info("===================");
		model.addAttribute("paging", paging);
		
		//게시글 목록 가져오기
		List<Map<String,Object>> map = groupService.list( paging );
		logger.info(map.toString());
		model.addAttribute("board", map);

		logger.info("=====/group/list [FINISH]=====");

		//------------------------------------------------------------------

		}
	
	@GetMapping("/view")
    public String groupView( Board board, Model model, HttpSession httpSession ) {
		
		logger.info("=====/group/view [START]=====");
		
	
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		//2-1. 상세보기 게시글 조회, 모델값 전달
		groupService.viewHit( board );
		
		//2-2. 맵을 사용해서 유저 정보 가져오기
		Map<String,Object> map = groupService.view( board );
		model.addAttribute("writerView", map);
		
        logger.info("=====/group/view [FINISH]=====");
        
        return "group/view"; 
       
    }
	
	@GetMapping("/write")
	public void boardWrite(){
		
	}
//	public String boardWriteProc(Board, BoardFile, MultipartFile, HttpSession){}
//
//	public void boardUpdate(Model, Board, BoardFile){}
//	public String boardUpdateProc(Board, BoardFile, MultipartFile) {}
//
//
//	public void boardDelete(Board) {}
//
//	public String recommend(Recommend, Model) {}
	
	
}
