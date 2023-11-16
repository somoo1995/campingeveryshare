package web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.dto.User;
import web.service.face.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	
	//로그 객체 생성d	
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


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // SimpleDateFormat을 이용하여 날짜 형식 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

        // int 형식의 필드에 빈 문자열이나 null 값이 들어올 경우 0으로 초기화
        binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true) {

        	
        });
    }

    @GetMapping("/join")
	public void join() {}
	
	@Transactional
	@PostMapping("/join")
	public String joinProc(User user, @RequestParam("userPwConfirm") String userPwConfirm) {
		logger.info("joinParam : {}",user);
		int selectedProfile;
		selectedProfile = user.getProfile();
	    

		//회원가입 처리
		boolean joinResult = userService.join(user, selectedProfile, userPwConfirm);

		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/";
		} else {
			logger.info("회원가입 실패");
			return "redirect:./join";
		}
	}
	
	@GetMapping("/view")
	public void userView(
		@SessionAttribute("loginId") String loginId
		, Model model) {
		logger.info("loginId : {}",loginId);
		User login = userService.info(loginId);
		model.addAttribute("login",login);

	}
	
	@GetMapping("/delete")
	public String userDelete(User user) {
		return null;
	}
	
	@RequestMapping("/loginduple")
	public void loginDuplicateCheck(User user) {
		
	}
	
	@GetMapping("/update")
	public String userUpdate(@SessionAttribute("loginId") String loginId, Model model) {
		logger.info("update[GET]");
		logger.info("loginId: {}", loginId);
		User updateUser = userService.info(loginId); // Assuming there is a method to get the user
		model.addAttribute("updateUser", updateUser); // Add the user to the model
		return "/user/update"; // Return the view name (assuming "user/update" is the update page)
	}

	@PostMapping("/update")
	public String userUpdateProc(@ModelAttribute User updateUser, @SessionAttribute("loginId") String loginId,
			@RequestParam(value = "userPwConfirm", required = false) String userPwConfirm, HttpSession session,
			Model model) {
		logger.info("update[POST]");
		logger.info("loginId: {}", loginId);

		// 올바른 user_id 설정
		updateUser.setUserId(loginId);

		boolean updateResult = userService.updateUser(updateUser, userPwConfirm);

		if (updateResult) {
			logger.info("정보수정 성공");
			model.addAttribute("message", "사용자 정보가 성공적으로 업데이트되었습니다.");
			return "redirect:/user/view";
		} else {
			logger.info("정보수정 실패");
			return "redirect:/user/update";
		}
	}
	
	
	@GetMapping("/login")
	public void login(HttpSession session) {
		logger.info("login[GET]");
		session.invalidate();
	}

	
	@PostMapping("/login")
	@ResponseBody
	public boolean loginProc(User login, HttpSession session) {
		logger.info("loginParam : {}", login);
		logger.info("login[POST]");

		// 로그인 인증
		boolean isLogin = userService.login(login);
		User loginInfo = userService.info(login);
		// [세션] 로그인 인증 결과

		if (!isLogin) {
			session.invalidate();
			return false;
		}
		
		logger.info("로그인 성공");
		session.setAttribute("isLogin", isLogin);
		session.setAttribute("loginId", loginInfo.getUserId());
		session.setAttribute("loginNick", loginInfo.getUserNick());
		logger.info("session : " + session.getAttribute("loginId"));
		logger.info("session : " + session.getAttribute("loginNick"));

		return true;		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/idfind")
	public void idFind() {}
	
	@PostMapping("/idfind")
	@ResponseBody
	public String idFind(User idFind) {
		logger.info("idFind:{}",idFind);
		logger.info("idFind[POST]");
		
//		String idFind = userService.findId(idFind);
//		
//		if(!idFind)
		return null;
		
		
	}
	@GetMapping("/pwfind")
	public void pwFind() {}
	@PostMapping("/pwfind")
	public String pwFind(User user) {
		return "redirect:/user/login";
	}
	

}
