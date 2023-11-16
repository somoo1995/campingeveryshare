package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.face.GroupDao;
import web.dto.Board;
import web.dto.Group;
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
    public String groupView( Board board, Group group, Model model ) {
		
		logger.info("=====/group/view [START]=====");
		
	
		if( board.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		//2-1. 상세보기 게시글 조회, 모델값 전달
		groupService.viewHit( board );
		
		//2-2. 맵을 사용해서 유저 정보 가져오기
		Map<String,Object> map = groupService.view( board );
		model.addAttribute("writerView", map);
		
		Map<String,Object> map2 = groupService.content( board );
		model.addAttribute("contentView", map2);
		
		Map<String,Object> map3 = groupService.recruit( group );
		model.addAttribute("groupView", map3);
		
		logger.info("groupView:", map3);
        logger.info("=====/group/view [FINISH]=====");
        //커밋 다시
        return "group/view"; 
       
    }
	
	@GetMapping("/write")
	public void boardWrite(){}
	
	//커밋 왜 안 됨????
	@PostMapping("/write")
	public String groupWriteProc(Board writeParam, Group groupParam, @RequestParam int recruitStatus, HttpSession session){
		
		logger.info("writeParam : {}", writeParam);
		
		//유저 아이디 세션에서 가져오기
		writeParam.setUserId((String) session.getAttribute("loginId"));
		
//		if( userIdObject == null) {
//			return "redirect:/login";	//아이디값이 null인 경우 로그인 페이지로 이동
//		}
		
		//테스트
		logger.info("====세션 테스트====");
		logger.info("Session userId: {}", writeParam.getUserId());
		
		//recruitStatus 데이터 가져오기
		groupParam.setRecruitStatus(recruitStatus);
		logger.info("groupParam : {}", groupParam);
		
		//작성
		groupService.write( writeParam, groupParam );
		logger.info("writeParam, groupParam : {}", writeParam, groupParam);
		
		return "redirect:./view?boardNo=" + writeParam.getBoardNo();
		
		
	}
	
	@GetMapping("/update")
	public String groupUpdate(Map<Object, String> updateParam){
		
		logger.info("================update [START]================");
		
		//board 객체를 선언한다
		
		//맵을 가져온다
		Map<String, Object> updateView = groupService.view(board);
		//updateView에 해당하는 객체를 가져온 후 Board로 캐스팅
		Board board = (Board) updateView.get("board");
		
		//게시판 번호 조회해서 없으면 목록으로 이동
		if( updateParam.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		//상세보기 페이지 아님 표시
		updateParam.setHit(-1);
                     				
		//1. 상세보기 게시글 조회
		updateParam = groupService.view(updateParam);
		
		//2. 수정할 데이터를 뷰에 전달
		model.addAttribute("updateBoard", updateParam );
		
		return "group/update";
		

		
		
		
		
	}
	
//	@PostMapping("/update")
//	public String groupUpdateProc(Board updateParam, HttpSession sesison) {
//		
//		
//	}
//
//
//	public void boardDelete(Board) {}
//
//	public String recommend(Recommend, Model) {}
	
}
