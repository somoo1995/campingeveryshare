package web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	@Autowired private JavaMailSender mailSender;	
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
    
    // mailSending 코드
 	@RequestMapping(value = "mailSender.do", method = RequestMethod.GET)
 	@ResponseBody
 	public String mailSending(String m_email) {

 		//뷰에서 넘어왔는지 확인
 		System.out.println("이메일 전송");
 		
 		//난수 생성(인증번호)
 		Random r = new Random();
 		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
 		System.out.println("인증번호:" + num);
 		
 		/* 이메일 보내기 */
         String setFrom = "campingeveryshare@gmail.com"; //보내는 이메일
         String toMail = m_email; //받는 사람 이메일
         String title = "회원가입 인증 이메일 입니다.";
         String content = 
                 "campingeveryshare 홈페이지를 방문해주셔서 감사합니다." +
                 "<br><br>" + 
                 "인증 번호는 " + num + "입니다." + 
                 "<br>" + 
                 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
         try {
             
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
             helper.setFrom(setFrom);
             helper.setTo(toMail); 
             helper.setSubject(title);
             helper.setText(content,true);
             mailSender.send(message);
             
         }catch(Exception e) {
             e.printStackTrace();
         }
         
         String rnum = Integer.toString(num);  //view로 다시 반환할 때 String만 가능
         
         return rnum;
  
 		
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
	
	@PostMapping("/delete")
	@ResponseBody
	public String userDelete(@RequestParam("userId") String userId, @RequestParam("password") String password, Model model) {
	    logger.info("delete[GET]");
	    logger.info("deleteId: {}", userId);
	    logger.info("deleteId: {}", password);

	    boolean isDeleted = userService.deleteUser(userId, password);

	    if (isDeleted) {
	        model.addAttribute("deleteUser", isDeleted);
	        logger.info("회원상태1로변경");
	        return "done";
	    } else {
	        model.addAttribute("error", "비밀번호를 확인해주세요");
	        logger.info("회원상태 변경 실패");
	        return "undone";
	    }
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
	public String loginProc(User login, HttpSession session) {
		logger.info("loginParam : {}", login);
		logger.info("login[POST]");

		// 로그인 인증
		boolean isLogin = userService.login(login);
		User loginInfo = userService.info(login);
		// [세션] 로그인 인증 결과

		if (!isLogin) {
			return "loginfalse";
		}
		else if (loginInfo.getUserStatus() == 1) {
			return "false";
		}
		
		logger.info("로그인 성공");
		session.setAttribute("isLogin", isLogin);
		session.setAttribute("loginId", loginInfo.getUserId());
		session.setAttribute("loginNick", loginInfo.getUserNick());
		logger.info("session : " + session.getAttribute("loginId"));
		logger.info("session : " + session.getAttribute("loginNick"));

		return "true";		
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
	public String idFindProc(User user, Model model) {
		logger.info("idFind:{}",user);
		logger.info("idFind[POST]");
		
	    // 찾은 아이디를 클라이언트로 전송
	    return userService.findId(user);
	}

	@GetMapping("/pwfind")
	public void pwFind() {}
	
	@PostMapping("/pwfind")
	@ResponseBody
	public String pwFind(User user, Model model,HttpSession session) {
	    logger.info("pwFind:{}", user);
	    logger.info("pwFind[POST]");

	    String resetSuccess = userService.findPw(user);

	    if (resetSuccess == "success") {
	        return "success"; // 성공 시 문자열 "sucess" 반환
	    } else {
	        return "fail"; // 실패 시 문자열 "fail" 반환
	    }
	}
	
	@PostMapping("/pwReset")
	@ResponseBody
	public String pwUpdate (User pwupdate) {
		System.out.println("userUpdate");
		boolean success = userService.updatePw(pwupdate);

		if(success) {
			logger.info("패스워드업뎃성공했니?");
			logger.info("아이디:{}",pwupdate.getUserId());
			
			return "success";
		}else {
			logger.info("또실패야????");
			return "fail";
		}
	}
	
	@RequestMapping(value = "/kakaoLogin.ajax")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id");
		loginUrl.append("ce1568eb40d41fed6eb58ca0a4e9a6eb");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:8088/user/login");
		loginUrl.append("&response_type=code");
	
		return "redirect:"+loginUrl.toString();
	}
	
//	@RequestMapping(value = "/kakaoCallback", method = RequestMethod.GET)
//	public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException{
//		logger.info(code);
//		
//		//접속토큰 get
//		String kakaoToken = userService.getReturnAccessToken(code);
//		
//		//접속자 정보 get
//		Map<String,Object> result = userService.getUserInfo(kakaoToken);
//        logger.info("result:: " + result);
//        String snsId = (String) result.get("id");
//        String userName = (String) result.get("nickname");
//        String email = (String) result.get("email");
//        String userpw = snsId;
//		SessionConfigVO config = new org.apache.tomcat.util.descriptor.web.SessionConfig()
//		return code;
//		
//		
//	}
	
	
	
	
}
