package web.controller;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.client.RestTemplate;

import com.siot.IamportRestClient.IamportClient;

import web.dto.Car;
import web.dto.Income;
import web.dto.Rent;
import web.dto.Review;
import web.dto.User;
import web.service.face.RentService;
import web.util.Paging;

@Controller
@RequestMapping("/rent")
public class RentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	@Autowired RentService rentService;
	
	
	@RequestMapping("/list")
	public String rentList( Model model, Paging param  ) {
		
		Paging paging = rentService.getPaging(param);
		logger.info("paging : {}", paging);
		
		List<Map<String, Object>> list = rentService.getCarList(paging);
		logger.info("list : {}", list);
		
		model.addAttribute("list", list);
		
		return "rent/main";
	}
	
	@RequestMapping("/view")
	public void rentView( Model model, Car car ) {
		logger.info("carNo : {}", car);
		
		car = rentService.view(car);
		List<Rent> list = rentService.getRentList(car);
				
		logger.info("car : {}", car);
		
		model.addAttribute("car", car);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/book")
	public String book( Model model, Rent rent, String startDate, @SessionAttribute("loginId") String userId, Income income ) {
		rent.setUserId(userId);
		logger.info("startDate : {} ", startDate);
		logger.info("rent : {}", rent);
		logger.info("income 1st : {}", income);
		
		rentService.book(rent);
		income.setRentNo(rent.getRentNo());
		logger.info("income 2nd : {}", income);
		
		rentService.income(income);

		Car car = new Car();
		car.setCarNo(rent.getCarNo());
		logger.info("car : {} ", car);
		
		List<Rent> list = rentService.getRentList(car);
		model.addAttribute("list", list);
		
		return "redirect:/rent/view?=" + rent.getCarNo();
	}
	
	@RequestMapping("/user")
	public String user( Model model, @SessionAttribute("loginId") String userId) {
		User user = new User();
		user.setUserId(userId);
		
		user = rentService.getGuestInfo(user);
		model.addAttribute("user", user);
		
		return "jsonView";
	}
	
//	@PostMapping("/payment")
//	@ResponseBody
//	public void payment( String merchantUid, String impUid ) {
//		logger.info("impUid : {} ", impUid);
//		logger.info("merchantUid : {} ", merchantUid);
//		
//		RestTemplate restTemplate = new RestTemplate();
//		
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_JSON);
//		
////		JSONObject body = new JSONObject();
////		body.put("imp_key", "2441044643164541");
////		body.put("imp_secret", "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX");
//		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//		body.add("imp_key", "2441044643164541");
//		body.add("imp_secret", "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX");
//		
////		HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
//		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
//		ResponseEntity<JSONObject> token = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", entity, JSONObject.class);
//		
//		logger.info("token :{}", token);
//		logger.info("token :{}", token.getStatusCode());
//		logger.info("token :{}", token.getStatusCodeValue());
//		logger.info("token :{}", token.getBody());
//		logger.info("token :{}", token.getBody().get("response"));
//		
//	}

}
