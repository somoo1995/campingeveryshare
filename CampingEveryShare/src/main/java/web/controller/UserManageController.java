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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Admin;
import web.dto.Board;
import web.dto.Car;
import web.dto.Income;
import web.dto.Recom;
import web.dto.Report;
import web.dto.User;
import web.service.face.AdminService;
import web.service.face.UserService;
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
	
//	@GetMapping("/idCheck/{userId}")
//	   @ResponseBody
//	   public boolean joinIdDuplicateCheck(@PathVariable String userId) {
//	      return adminService.joinIdCheck(userId);
//	   }
	
	@GetMapping("/login")
	public void login(HttpSession session) {
		logger.info("login[GET]");
//		session.invalidate();
	}
	
	@PostMapping("/login")
	@ResponseBody
	public boolean loginProc(Admin admin, HttpSession session) {
		logger.info("loginParam : {}", admin);
		logger.info("login[POST]");

		// 로그인 인증
		boolean isAdmin = adminService.loginCheck(admin);
		Admin loginInfo = adminService.loginInfo(admin);
		// [세션] 로그인 인증 결과

		if (!isAdmin) {
			session.invalidate();
			return false;
		}
		
		logger.info("로그인 성공");
		session.setAttribute("isAdmin", isAdmin);
		session.setAttribute("adminCode", loginInfo.getAdminCode());
		session.setAttribute("adminPw", loginInfo.getAdminPw());
		logger.info("session : " + session.getAttribute("adminCode"));
		logger.info("session : " + session.getAttribute("adminPw"));

		return true;		
	}
	
	@RequestMapping("/loginfail")
	public void loginFail() {
		
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
	
	@RequestMapping("/mycar")
	public void list(Model model, Paging param, Car car) {
		
		//페이징 계산
		Paging paging = adminService.getPagingMycar( param );
		logger.info("paging : {}", paging);
		
		//게시글 목록 조회
		List<Map<String, Object>> mycarList = adminService.mycarList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("mycarList", mycarList);
		model.addAttribute("car", car);
		
		logger.info("mycarList : {}", mycarList);
		logger.info("paging {} :" + paging.toString());
		logger.info("model {} :" + model.toString());
	
	}
	
	
	@RequestMapping("/userstatus")
	public ModelAndView toggleDeleteStatus(Report report, User user, Model model, ModelAndView mav) {
		
		logger.info("user 제대로 나오니 : {}", user);
		
//		user.setUserId(report.getVuserId());
//		user.setUserStatus(user.getUserStatus());

		//글 삭제 상태 토글
	    boolean result = adminService.deleteUserStatus(user);
	    
	    logger.info("user user_status 내놔 : {}", user);
	    
	    mav.addObject("result", result);
	    mav.setViewName("jsonView");
	    
	    return mav;
	}
	
	@RequestMapping("/boardstatus")
	public ModelAndView toggleBoardStatus(Report report, Board board, Model model, ModelAndView mav) {
		
		logger.info("board 제대로 나오니 : {}", board);
		
		//글 삭제 상태 토글
	    boolean result = adminService.deleteBoardStatus(board);
	    
	    logger.info("board delete_status 내놔 : {}", board);
	    
	    mav.addObject("result", result);
	    mav.setViewName("jsonView");
	    
	    return mav;
	}
	
	@RequestMapping("/allow")
	public String mycarAllowStatus(Car car) {
		
		logger.info("carAllow 제대로 나오니 : {}", car);
		
		adminService.carAllowStatus(car);
	    
	    logger.info("carAllow car_status 내놔 : {}", car);
	    
	    return "jsonView";
	}
	
	@RequestMapping("/hold")
	public String mycarHoldStatus(Car car) {
		
		logger.info("carHold 제대로 나오니 : {}", car);
		
		adminService.carHoldStatus(car);
	    
	    logger.info("carHold car_status 내놔 : {}", car);
	    
	    return "jsonView";
	}
	
	@RequestMapping("/carStatus")
	public ModelAndView toggleDeleteStatus(Car car, Model model, ModelAndView mav) {
		
		logger.info("car 제대로 나오니 : {}", car);
		
		//글 삭제 상태 토글
	    boolean result = adminService.deleteCarStatus(car);
	    
	    logger.info("car delete_status 내놔 : {}", car);
	    
	    mav.addObject("result", result);
	    mav.setViewName("jsonView");
	    
	    return mav;
	}

	@RequestMapping("/permit")
	public String incomePermitStatus(Income income) {
		
		logger.info("income 제대로 나오니 : {}", income);
		
		adminService.incomePermitStatus(income);
	    
	    logger.info("income income_status 내놔 : {}", income);
	    
	    return "jsonView";
	}
	
	
	
} // UserManageController end
