package web.controller;



import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.Msg;
import web.dto.User;
import web.service.face.MsgService;

@Controller
@RequestMapping("/message")
public class MsgController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MsgService msgService;
	
	@GetMapping("/list")
	public String Msg(HttpSession session, Model model,
			@RequestParam(value = "boardNo", required = false, defaultValue = "0") int boardNo,
			@RequestParam(value = "boardCate", required = false, defaultValue = "0") int boardCate,
			@RequestParam(value = "receiverId", required = false,defaultValue = "anonymous") String receiverId,
			@RequestParam(value = "title", required = false, defaultValue = "unknown") String title,
			@RequestParam(value = "nick", required = false, defaultValue = "unknown") String nick,
			@RequestParam(value = "profile", required = false, defaultValue = "unknown") String profile) throws JsonProcessingException {
		User user = new User();
		user.setUserId(session.getAttribute("loginId").toString());
//		logger.info(session.getAttribute("loginId").toString());
		List<Map<String,Object>> list  = new ArrayList<Map<String,Object>>();
		list = msgService.getmsglist(user);
		logger.info(list.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		if(boardNo != 0) {
			map.put("newBoardNo", boardNo);
			map.put("newReceiverId", receiverId);
			map.put("newBoardCate",boardCate);
			map.put("newWriterId", user.getUserId());
			map.put("newTitle", title);
			map.put("newNick", nick);
			map.put("newProfile", profile);
			Integer checkRoom = 0;
			logger.info("이부분 나오냐?");
			if(msgService.checkNewRoom(map) != null) {
				checkRoom = msgService.checkNewRoom(map);
				model.addAttribute("targetRoomNo",checkRoom);
				logger.info("이부분은 새로운 채팅방이 있을때");
			}else {
				logger.info("이부분은 새로운 채팅방이 없을때");
				ObjectMapper objectMapper = new ObjectMapper();
				String newMakingJson = objectMapper.writeValueAsString(map);
				model.addAttribute("newMaking",newMakingJson);
			}
			
			
		}
		
		model.addAttribute("list",list);
		
		return "/message/list";
		
		
		
	}
	
	@GetMapping("/msgload")
	@ResponseBody
	public List<Msg> msgload(Msg roomNo, @RequestParam("currentUserId") String currentUserId) {
		logger.info("여기 왓는데요?");
		logger.info(currentUserId);
		logger.info(roomNo.toString());
		List<Msg> msgload = new ArrayList<Msg>();
		msgload = msgService.getMsgLoad(roomNo,currentUserId);
		logger.info(msgload.toString());
		return msgload;
		
	}
	
	@RequestMapping("/getNick")
	@ResponseBody
	public Map<String,Object> getNick(@RequestParam("targetId") String targetId){
		logger.info(targetId);
		logger.info("getNikc 오냐!!");
		
		return null;
	}
}
