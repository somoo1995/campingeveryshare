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
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Board;
import web.dto.Comm;
import web.dto.User;
import web.service.face.ShareService;
 
@Controller
@RequestMapping("/comm")
public class CommController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ShareService shareService;
	
	@RequestMapping("/insert")
	public String insert(Board board, User user, Comm comm, Model model, HttpSession session) {
		logger.info("comm : " + comm.toString());
		logger.info("session : {}" + session.getId());
		
		int res = shareService.insertComm(comm);
		logger.info("comm : " + comm.toString());
		
		return "jsonView";
	}

	@GetMapping("/list")
	public String getCommList(Board board, User user, Comm comm, Model model, HttpSession session) {
		
		List<Map<String,Object>> getCommList = shareService.getCommListByUserNick(comm);
		
		model.addAttribute("getCommList", getCommList);
		
		return "/comm/list";
	}
	
	@RequestMapping("/delete")
	public void delete(Comm comm, Model model, User user) {
		boolean success = shareService.deleteComm(comm);
		
	}
}
