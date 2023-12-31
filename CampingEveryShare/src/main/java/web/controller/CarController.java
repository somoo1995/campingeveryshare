package web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dto.Account;
import web.dto.BoardFile;
import web.dto.Car;
import web.dto.User;
import web.service.face.CarService;
import web.util.Paging;

@Controller
@RequestMapping("/car")
@Slf4j
public class CarController {
	@Autowired CarService carService;
	@GetMapping("/main")
	public void main(HttpSession session,Model model) {
		User user = new User();
		user.setUserId((String)session.getAttribute("loginId"));
		Map<String,Object> map = new HashMap<String, Object>();
		int ongoing = 0;
		ongoing = carService.getOngoing(user);
		int done = 0;
		done = carService.getDone(user);
		int cancel = 0;
		cancel = carService.getCancel(user);
		log.info("{}",ongoing);
		log.info("{}",done);
		log.info("{}",cancel);
		map.put("ongoing", ongoing);
		map.put("done", done);
		map.put("cancel", cancel);
		model.addAttribute("index",map);
		log.info(map.toString());
		
		
		
	}
	
	@RequestMapping("/history")
	public String history(HttpSession session,Model model,Paging param) {
		User user = new User();
		user.setUserId((String)session.getAttribute("loginId"));
		log.info(user.toString());
		Paging paging = carService.getPaging(param,user);
		log.info(paging.toString());
		List<Map<String,Object>> rentList = new ArrayList<Map<String,Object>>();
		rentList = carService.getRentList(user,paging);
		model.addAttribute("rentList",rentList);
		model.addAttribute("paging",paging);
//		log.info(rentList.toString());
		
		return "/car/history";
	}
	
	@GetMapping("/mycar")
	public String mycar(HttpSession session, Model model) {
		User user = new User();
		user.setUserId((String)session.getAttribute("loginId"));
		List<Map<String,Object>> carNoList = new ArrayList<Map<String,Object>>();
		carNoList = carService.getCarNoByUserId(user);
		log.info(carNoList.toString());
		model.addAttribute("carNoList",carNoList);
		return "car/mycar";
	}

	

	
	@GetMapping("/regi")
	public void regi(Car car, Model model) {
		log.info("잘 나오는지 확인 하자구요");
		
		if(car.getCarNumber() != null) {
			log.info("{}",car);
			car = carService.getCarInfoByCarNo(car);
			log.info(car.toString());
			model.addAttribute("carModel",car);
			log.info("모델값 전달 완료");
			BoardFile file = new BoardFile();
			file = carService.getFileInfoByCarNo(car);
			log.info(file.toString());
			model.addAttribute("file",file);
		}
		
		
		
	}
	
   @PostMapping(value="/save",produces="application/text; charset=UTF-8")
   @ResponseBody
    public String saveCar(
            @RequestParam("carName") String carName,
            @RequestParam("carNumber") String carNumber,
            @RequestParam("carSize") int carSize,
            @RequestParam("carPax") int carPax,
            @RequestParam("carSpax") int carSpax,
            @RequestParam("carBeds") int carBeds,
            @RequestParam("price") int price,
            @RequestParam("extraPrice") int extraPrice,
            @RequestParam("pickupTimeStart") String pickupTimeStart,
            @RequestParam("pickupTimeEnd") String pickupTimeEnd,
            @RequestParam("location") String location,
            @RequestParam("areaDetail") String areaDetail,
            @RequestParam("selectedOptions") String[] selectedOptions,
            @RequestParam("content") String content,
            @RequestParam(value="carFile", required=false) List<MultipartFile> carFile,
            @RequestParam(value="update", required=false) boolean update,
            HttpSession session
            // 다른 필드가 있으면 여기에 추가
    ) {
	   String userId = (String) session.getAttribute("loginId");
	   Car car = new Car();
	   car.setUserId(userId);
	   log.info(carName);
	   car.setCarName(carName);
	   log.info("{}",carNumber);
	   car.setCarNumber(carNumber);
	   log.info("{}",carSize);
	   car.setCarSize(carSize);
	   log.info("{}",carPax);
	   car.setCarPax(carPax);
	   log.info("{}",carSpax);
	   car.setCarSpax(carSpax);
	   log.info("{}",carBeds);
	   car.setCarBeds(carBeds);
	   log.info("{}",price);
	   car.setPrice(price);
	   log.info("{}",extraPrice);
	   car.setExtraPrice(extraPrice);
	   log.info(pickupTimeStart);
	   car.setPickupTimeStart(pickupTimeStart);
	   log.info(pickupTimeEnd);
	   car.setPickupTimeEnd(pickupTimeEnd);
	   log.info(location);
	   String [] locationarray = location.split(" ");
	   log.info(locationarray[0]);
	   log.info(locationarray[1]);
	   if(locationarray[0].toString().equals("서울")) {
		   car.setLocation(1);
		   if(locationarray[1].toString().equals("강남구")) {
			   car.setArea(1);
		   } else if(locationarray[1].toString().equals("강동구")) {
			   car.setArea(2);
		   } else if(locationarray[1].toString().equals("강북구")) {
			   car.setArea(3);
		   } else if(locationarray[1].toString().equals("강서구")) {
			   car.setArea(4);
		   } else if(locationarray[1].toString().equals("관악구")) {
			   car.setArea(5);
		   } else if(locationarray[1].toString().equals("광진구")) {
			   car.setArea(6);
		   } else if(locationarray[1].toString().equals("구로구")) {
			   car.setArea(7);
		   } else if(locationarray[1].toString().equals("금천구")) {
			   car.setArea(8);
		   } else if(locationarray[1].toString().equals("노원구")) {
			   car.setArea(9);
		   } else if(locationarray[1].toString().equals("도봉구")) {
			   car.setArea(10);
		   } else if(locationarray[1].toString().equals("동대문구")) {
			   car.setArea(11);
		   } else if(locationarray[1].toString().equals("동작구")) {
			   car.setArea(12);
		   } else if(locationarray[1].toString().equals("마포구")) {
			   car.setArea(13);
		   } else if(locationarray[1].toString().equals("서대문구")) {
			   car.setArea(14);
		   } else if(locationarray[1].toString().equals("서초구")) {
			   car.setArea(15);
		   } else if(locationarray[1].toString().equals("성동구")) {
			   car.setArea(16);
		   } else if(locationarray[1].toString().equals("성북구")) {
			   car.setArea(17);
		   } else if(locationarray[1].toString().equals("송파구")) {
			   car.setArea(18);
		   } else if(locationarray[1].toString().equals("양천구")) {
			   car.setArea(19);
		   } else if(locationarray[1].toString().equals("영등포구")) {
			   car.setArea(20);
		   } else if(locationarray[1].toString().equals("용산구")) {
			   car.setArea(21);
		   } else if(locationarray[1].toString().equals("은평구")) {
			   car.setArea(22);
		   } else if(locationarray[1].toString().equals("종로구")) {
			   car.setArea(23);
		   }
		   
	   } else {
		   car.setLocation(2);
		   if(locationarray[1].toString().equals("중구")) {
			   car.setArea(1);
		   } else if(locationarray[1].toString().equals("남동구")) {
			   car.setArea(2);
		   } else if(locationarray[1].toString().equals("동구")) {
			   car.setArea(3);
		   } else if(locationarray[1].toString().equals("미추홀구")) {
			   car.setArea(4);
		   } else if(locationarray[1].toString().equals("부평구")) {
			   car.setArea(5);
		   } else if(locationarray[1].toString().equals("서구")) {
			   car.setArea(6);
		   } else if(locationarray[1].toString().equals("연수구")) {
			   car.setArea(7);
		   } else if(locationarray[1].toString().equals("계양구")) {
			   car.setArea(8);
		   }else if(locationarray[1].toString().equals("강화군")) {
			   car.setArea(9);
		   }else if(locationarray[1].toString().equals("옹진군")) {
			   car.setArea(10);
		   }
	   }
	   log.info(areaDetail);
	   car.setAreaDetail(areaDetail);
	   log.info("selectedOptions: " + Arrays.toString(selectedOptions));
	   for(String option : selectedOptions) {
		   if("carElec".equals(option)) {
			   car.setCarElec(1);
		   }else if("carTable".equals(option)) {
			   car.setCarTable(1);
		   }else if("carWater".equals(option)) {
			   car.setCarWater(1);
		   }else if("carTable".equals(option)) {
			   car.setCarTable(1);
		   }else if("carSink".equals(option)) {
			   car.setCarSink(1);
		   }else if("carKitchen".equals(option)) {
			   car.setCarKitchen(1);
		   }else if("carTemp".equals(option)) {
			   car.setCarTemp(1);
		   }else if("carShower".equals(option)) {
			   car.setCarShower(1);
		   }else if("carToilet".equals(option)) {
			   car.setCarToilet(1);
		   }else if("carPet".equals(option)) {
			   car.setCarPet(1);
		   }else if("carSmoke".equals(option)) {
			   car.setCarSmoke(1);
		   }
	   }
	   log.info(content);
	   car.setContent(content);
	   if(carFile != null) {
		   log.info(carFile.toString());
		   log.info(car.toString());
	   }

	   if(update == true) {
		   log.info("이부분은 수정입니다");
		   carService.updateCar(car,carFile);
		   return null;
	   }
	   if (carService.carWrite(car,carFile)==1) {
		   return "이미 등록된 차량입니다";
	   };
	   
	   
        return "ok";
    }
   
   @RequestMapping("/delete")
   @ResponseBody
   public String delete(Car car) {
	   log.info(car.toString());
	   carService.deleteCar(car);
	   return null;
   }
   
   @RequestMapping("/stop")
   @ResponseBody
   public String stop(Car car) {
	   log.info(car.toString());
	   carService.stopCar(car);
	   return null;
   }
   
   @RequestMapping("/resume")
   @ResponseBody
   public String resume(Car car) {
	   log.info(car.toString());
	   carService.resumeCar(car);
	   return null;
   }
   
   @RequestMapping("/approve")
   @ResponseBody
   public String approve(Car car) {
	   log.info(car.toString());
	   carService.approveCar(car);
	   return null;
   }
   
	@GetMapping("/mysell")
	public String mysell(HttpSession session,Model model,Paging param) {
		User user = new User();
		user.setUserId((String)session.getAttribute("loginId"));
		log.info(param.toString());
		log.info("이거 클릭하는고얌");
		int category = param.getCategory();
		if(category == 0) {
			category = 1;
		}
		if(category == 1) { // 카테고리가 수익금 내역일 때
			List<Map<String,Object>> target = new ArrayList<Map<String,Object>>();
			Paging proPaging = carService.getPaging(param, user);
			proPaging.setCategory(1);
			model.addAttribute("paging",proPaging);
			target = carService.getProceedsInfo(user,proPaging);
			model.addAttribute("list",target);
		}else if(category == 2) {
			List<Map<String,Object>> target = new ArrayList<Map<String,Object>>();
			Paging withPaging = carService.getPaging(param, user);
			withPaging.setCategory(2);
			target = carService.getWithdrawoInfo(user,withPaging);
			model.addAttribute("paging",withPaging);
			model.addAttribute("list",target);
		}else if(category == 3) {
			List<Map<String,Object>> target = new ArrayList<Map<String,Object>>();
			Paging chargePaging = carService.getPaging(param, user);
			chargePaging.setCategory(3);
			target = carService.getChargeInfo(user,chargePaging);
			model.addAttribute("paging",chargePaging);
			model.addAttribute("list",target);
		}		
		//위에는 테스트용!
		Map<String,Object> indexInfo = new HashMap<String, Object>();
		indexInfo = carService.getIndexInfo(user);
		log.info("이것들은 인덱스 가격들");
		log.info(indexInfo.toString());
		model.addAttribute("indexInfo",indexInfo);
		
		
		return "/car/mysell";
	}
	
	@GetMapping("/commit")
	@ResponseBody
	public String commit(@RequestParam("rentNos") List<String> rentNos) {
	    log.info(rentNos.toString());
	    carService.commit(rentNos);
	    return "success";
	}
	
	@RequestMapping("/regiAccount")
	@ResponseBody
	public String regiAccount(Account account,HttpSession session) {
		account.setUserId((String)session.getAttribute("loginId"));
		carService.changeAccount(account);
		log.info(account.toString());
		return null;
	}
}



