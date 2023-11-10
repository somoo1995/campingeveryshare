package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Comm;
import web.service.face.ShareService;
 
@Controller
@RequestMapping("/comm")
public class CommController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ShareService shareService;
	
	@RequestMapping(value="/insert")
	public String insert(Comm comm, Model model, HttpSession session) {

		comm.setUserId( (String) session.getAttribute("userId") );
		shareService.insertComm(comm);
		logger.info("comm : " + comm.toString());
		return "redirect:/board/view?boardNo="+comm.getBoardNo();
	}
}
