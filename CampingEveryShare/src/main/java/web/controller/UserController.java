package web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.User;
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
    public String joinProc(User user, @RequestParam("profile") int selectedProfile, @RequestParam("userPwConfirm") String userPwConfirm, HttpSession session) {
        logger.info("joinParam : {}", user);

        // 프로필 번호 확인
        logger.info("Selected Profile: {}", selectedProfile);

        // 회원가입 처리
        boolean joinResult = userService.join(user, selectedProfile, userPwConfirm);

        if (joinResult) {
            logger.info("회원가입 성공");

            // 로그인 처리 (세션에 사용자 정보 저장)
            session.setAttribute("isLogin", true);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userNick", user.getUserNick());

            return "redirect:/";
        } else {
            logger.info("회원가입 실패");
            return "redirect:./join";
        }
    }

   
   @GetMapping("/view")
   public void userView(User user, Model model) {
      
   }
   
   @GetMapping("/delete")
   public String userDelete(User user) {
      return null;
   }
   
   @RequestMapping("/loginduple")
   public void loginDuplicateCheck(User user) {
      
   }
   
   @GetMapping("/update")
   public String userUpdate(User user) {
      return null;
   }
   
   @GetMapping("/login")
   public void login(HttpSession session) {
      logger.info("login[GET]");
      session.invalidate();
   }
   
   @PostMapping("/login")
   public String loginProc(User login, HttpSession session, Model model ) {
      logger.info("loginParam : {}", login);
      logger.info("login[POST]");
      
      //로그인 인증
      boolean isLogin = userService.login( login );
      User loginInfo = userService.info(login);
      
      //[세션] 로그인 인증 결과
      
      if( isLogin ) {
         logger.info("로그인 성공");
         session.setAttribute("isLogin", isLogin);
         session.setAttribute("loginId", loginInfo.getUserId());
         session.setAttribute("loginNick", loginInfo.getUserNick());
           logger.info("session : " + session.getAttribute("loginId"));
           logger.info("session : " + session.getAttribute("loginNick"));

         return "redirect:/";
      
   }
      logger.info("로그인 실패");
      model.addAttribute("loginFailureMessage", "아이디 또는 비밀번호가 잘못되었습니다.");
      logger.info("model{}",model);
      return "redirect:/user/login";
   }   
   
   @GetMapping("/logout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }

   @GetMapping("/idfind")
   public void idFind() {}
   @PostMapping("/idfind")
   public String idFind(User findId) {
      return null;
   }
   @GetMapping("/pwfind")
   public void pwFind() {}
   @PostMapping("/pwfind")
   public String pwFind(User user) {
      return null;
   }
   

}
