package web.controller;

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

import web.dto.UserTb;
import web.service.face.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	//로그 객체 생성	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
		
	@Autowired private UserService userService;
		
	@GetMapping("/idCheck/{userId}")
	@ResponseBody
	public boolean joinIdDuplicateCheck(@PathVariable String userId) {
		return userService.joinIdCheck(userId);
	}
	
	@GetMapping("/emailCheck/{email}")
	@ResponseBody
	public boolean joinEmailDuplicateCheck(@PathVariable String email) {
		return userService.joinEmailCheck(email);
	}
	
	@GetMapping("/nickCheck/{userNick}")
	@ResponseBody
	public boolean joinNickDuplicateCheck(@PathVariable String userNick) {
		return userService.joinNickCheck(userNick);
	}
	
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinProc(UserTb user ) {
		logger.info("joinParam : {}",user);
		//회원가입 처리
		boolean joinResult = userService.join(user);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/";
		} else {
			logger.info("회원가입 실패");
			return "redirect:./join";
		}
	}
	
	@GetMapping("/view")
	public void userView(UserTb user, Model model) {
		
	}
	
	@GetMapping("/delete")
	public String userDelete(UserTb user) {
		return null;
	}
	
	@RequestMapping("/loginduple")
	public void loginDuplicateCheck(UserTb user) {
		
	}
	
	@GetMapping("/update")
	public String userUpdate(UserTb user) {
		return null;
	}
	@GetMapping("/login")
	public void login(HttpSession session) {
		session.invalidate();
		logger.info("login[GET]");
	}
	@PostMapping("/login")
	public String loginProc(UserTb user, HttpSession session ) {
		logger.info("loginParam : {}", user);
		
		//로그인 인증
		boolean loginResult = userService.login( user );
		
		//[세션] 로그인 인증 결과
		session.setAttribute("login", loginResult);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("isLogin", true);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userNick", user.getUserNick());
			
//			return "redirect:./main";
			return "redirect:/";
			
		} else {
			logger.info("로그인 실패");
			
			return "redirect:/user/login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/idfind")
	public void idFind() {
	}
	@PostMapping("/idfind")
	public String idFind(UserTb user) {
		return null;
	}
	@GetMapping("/pwfind")
	public void pwFind() {
		
	}
	@PostMapping("/pwfind")
	public String pwFind(UserTb user) {
		return null;
	}
	

}
