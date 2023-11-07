package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Msg;
import web.service.face.MypageService;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired MypageService mypageService;

	@RequestMapping("/main")
	public void main() {}
	
	@GetMapping("/message")
	public void message(Model model, Msg msg) {
		
		msg.setReceiverId("dain");
		
		List<Msg> rList = mypageService.msgList(msg);
		logger.info("rList : {}", rList);
		model.addAttribute("rList", rList);
		
		msg.setReceiverId(null);
		msg.setWriterId("dain");
		
		List<Msg> wList = mypageService.msgList(msg);
		logger.info("wList : {}", wList);
		model.addAttribute("wList", wList);
	}
	
	@PostMapping("/message")
	public void messageProc(Msg msg) {
		
		mypageService.sendMsg(msg);
		
	}
	
	@RequestMapping("/fail")
	public void noLogin() {}
	
	@GetMapping("/alert")
	public void alert() {
		
	}
	
}
