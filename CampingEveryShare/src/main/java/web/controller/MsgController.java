package web.controller;



import java.util.ArrayList;
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

import web.dto.Msg;
import web.dto.User;
import web.service.face.MsgService;

@Controller
@RequestMapping("/message")
public class MsgController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MsgService msgService;
	
	@GetMapping("/list")
	public void Msg(HttpSession session, Model model) {
		User user = new User();
		user.setUserId(session.getAttribute("loginId").toString());
//		logger.info(session.getAttribute("loginId").toString());
		List<Map<String,Object>> list  = new ArrayList<Map<String,Object>>();
		list = msgService.getmsglist(user);
		logger.info(list.toString());
		
		model.addAttribute("list",list);
		
		
		
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
}
