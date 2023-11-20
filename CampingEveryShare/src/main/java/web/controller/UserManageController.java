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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Admin;
import web.dto.Income;
import web.dto.Report;
import web.dto.User;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
@RequestMapping("/admin")
public class UserManageController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminService adminService;
	
	@GetMapping("/codeCheck/{adminCode}")
	@ResponseBody
	public boolean joinIdDuplicateCheck(@PathVariable Admin admin) {
		return adminService.loginCheck(admin);
	}
	
	@GetMapping("/login")
	public void login(HttpSession session) {
		logger.info("login[GET]");
	}
	
	@PostMapping("/login")
	@ResponseBody
	public boolean loginProc(Admin admin, HttpSession session) {
		logger.info("loginParam : {}", admin);
		logger.info("login[POST]");

		// 로그인 인증
		boolean isLogin = adminService.loginCheck(admin);
		Admin loginInfo = adminService.loginInfo(admin);
		// [세션] 로그인 인증 결과

		if (!isLogin) {
			session.invalidate();
			return false;
		}
		
		logger.info("로그인 성공");
		session.setAttribute("isLogin", isLogin);
		session.setAttribute("adminCode", loginInfo.getAdminCode());
		session.setAttribute("adminPw", loginInfo.getAdminPw());
		logger.info("session : " + session.getAttribute("adminCode"));
		logger.info("session : " + session.getAttribute("adminPw"));

		return true;		
	}
	
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
		
		//확인용
//		logger.info("user : {}", user);
//		logger.info("list : {}", list);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
	
	}
	
	@RequestMapping("/report")
	public void reportList(Model model, Paging param, Report report) {
		
		//페이징 계산
		Paging paging = adminService.getPagingReport( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String, Object>> reportList = adminService.reportList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("reportList", reportList);
		model.addAttribute("report", report);
		
		//확인용
//		logger.info("report : {}", report);
//		logger.info("reportList : {}", reportList);
//		logger.info("paging {} :" + paging.toString());
//		logger.info("model {} :" + model.toString());
	
	}
	
	@RequestMapping("/income")
	public void list(Model model, Paging param, Income income) {
		
		//페이징 계산
		Paging paging = adminService.getPagingIncome( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String, Object>> incomeList = adminService.incomeList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("incomeList", incomeList);
		model.addAttribute("income", income);
		
		logger.info("income : {}", income);
		logger.info("incomeList : {}", incomeList);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	
	}
		
	
} // UserManageController end
