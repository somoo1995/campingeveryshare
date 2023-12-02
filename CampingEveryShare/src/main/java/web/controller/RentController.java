package web.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import web.dto.BoardFile;
import web.dto.Car;
import web.dto.Heart;
import web.dto.Income;
import web.dto.Rent;
import web.dto.User;
import web.service.face.RentService;
import web.service.face.ReviewService;
import web.util.Paging;

@Controller
@RequestMapping("/rent")
public class RentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired RentService rentService;
	@Autowired ReviewService reviewService;
	
	@RequestMapping("/list")
	public String rentHandler(Model model, Paging param, HttpServletRequest request, HttpSession session) {
	    logger.info("param : {}", param);

	    Paging paging = rentService.getPaging(param);
	    logger.info("paging : {}", paging);
	    //

	    //
		boolean hasData = false;
		if( paging.getTotalCount() > 0 ) {
			hasData = true; 
		}

	    List<Map<String, Object>> list = rentService.getCarList(paging);
	    logger.info("list : {}", list);
	    logger.info("--------------------");
	    if(session.getAttribute("loginId") != null) {
	    	for (Map<String, Object> map : list) {
		        Heart heart = new Heart();
		        heart.setUserId((String)(session.getAttribute("loginId")));
		        heart.setBoardCate(1);
		        heart.setHeartNo((Integer.parseInt(map.get("CAR_NO").toString())));
		        map.put("HEART", rentService.checkHeartList(heart));
		    }
	    }else {
	       	for (Map<String, Object> map : list) {
		        map.put("HEART", 0);
		    }
	    }
	    
	    logger.info(list.toString());
	    logger.info("하트 들어오는지 확인할것");
	    model.addAttribute("paging", paging);
	    model.addAttribute("hasData", hasData);
	    model.addAttribute("list", list);

	    if (request.getMethod().equals("GET")) {
	        return "rent/main";
	    } else if (request.getMethod().equals("POST")) {
	        return "rent/list";
	    } else {
	        return "error"; 
	    }
	}
	
	@RequestMapping("/view")
	public void rentView( Model model, Car car,HttpSession session) {
		Map<String,Object> target =new HashMap<String, Object>(); // 모델로 넘겨줄 맵 생성
		User user = new User();
		int heartCheck = 0;
		if(session.getAttribute("loginId") != null) {
			car.setUserId((String)session.getAttribute("loginId"));
			heartCheck = 0;
			heartCheck = rentService.checkHeart(car);
		}
		logger.info("carNo : {}", car);
		logger.info("---------------------------");
		// 캠핑카 정보 
		car = rentService.view(car); 
		//평균 리뷰점수와 리뷰갯수
		Map<String,Object> reviewInfo = new HashMap<String, Object>();
		reviewInfo = rentService.getReviewInfo(car);
		BoardFile file = rentService.getFileInfo(car);
		
		
		target.put("car", car);
		target.put("heart", heartCheck);
		target.put("reviewInfo", reviewInfo);
		target.put("file", file);
		
		
		
		logger.info(target.toString());
		List<Rent> list = rentService.getRentList(car);
				
//		logger.info("car : {}", car);
		model.addAttribute("target",target);
		model.addAttribute("list", list);
		model.addAttribute("car",car);
		
	}
	
	@Transactional                                                                                                     
	@RequestMapping("/book")
	public String book( Model model, Rent rent, String startDate, @SessionAttribute("loginId") String userId, Income income ) {
		rent.setUserId(userId);
//		logger.info("rent : {}", rent);
		
		rentService.book(rent);

		Car car = new Car();
		car.setCarNo(rent.getCarNo());
//		logger.info("car : {} ", car);
		
		List<Rent> list = rentService.getRentList(car);
		model.addAttribute("list", list);
		
//		return "redirect:/rent/view?=" + rent.getCarNo();
		return "redirect:/booking/main";
	}
	
	@RequestMapping("/user")
	public String user( Model model, @SessionAttribute("loginId") String userId) {
		User user = new User();
		user.setUserId(userId);
		
		user = rentService.getGuestInfo(user);
		model.addAttribute("user", user);
		
		return "jsonView";
	}
	
	@RequestMapping("/review")
	public String review( Model model, Car car ) {
		logger.info("car : {}", car);
		
		List<Map<String,Object>> list = reviewService.getReview(car);
//		logger.info("list : {} ", list);
		model.addAttribute("list", list);
		
		return "rent/review";
	}
	
	@RequestMapping("/heart")
	@ResponseBody
	public String heart(Heart heart) {
		logger.info(heart.toString());
		int heartInfo = 0;
		heartInfo = rentService.changeHeart(heart);
		if(heartInfo == 1) {
			return "done";
		}else {
			return "cancel";
		}
	}
	

}
