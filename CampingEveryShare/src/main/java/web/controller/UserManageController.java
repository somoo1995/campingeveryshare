package web.controller;

import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Report;
import web.dto.User;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class UserManageController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminService adminService;
	
	@RequestMapping("/list")
	public void list(Model model, Paging param, User user) {
		
		//페이징 계산
		Paging paging = adminService.getPaging( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String, Object>> list = adminService.list(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		
		logger.info("user : {}", user);
		logger.info("list : {}", list);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	
	}
	
	@RequestMapping("/report")
	public void list(Model model, Paging param, Report report) {
		
		//페이징 계산
		Paging paging = adminService.getPagingReport( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String, Object>> reportList = adminService.reportList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("reportList", reportList);
		model.addAttribute("report", report);
		
		logger.info("report : {}", report);
		logger.info("reportList : {}", reportList);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	
	}
		
	
//	@RequestMapping("/alertIn")
//	public String insertAlert(@RequestParam("valueArr") String[] alertMsg) {
//		
//		int size = alertMsg.length;
//		for(int i=0; i<size; i++) {
//			adminService.insertAlert(alertMsg[i]);
//		}
//		return "redirect:list";
//	}
//	
	
} // UserManageController end
