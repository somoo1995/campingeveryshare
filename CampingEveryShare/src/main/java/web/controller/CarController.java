package web.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import web.dto.Car;
import web.service.face.CarService;

@Controller
@RequestMapping("/car")
@Slf4j
public class CarController {
	@Autowired CarService carService;
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/history")
	public String history() {
		return "/car/history";
	}
	
	@GetMapping("/mycar")
	public String mycar() {
		return "/car/mycar";
	}

	
	@GetMapping("/mysell")
	public String mysell() {
		return "/car/mysell";
	}
	
	@GetMapping("/regi")
	public void regi() {
		
	}
	
   @PostMapping("/save")
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
            @RequestParam("carFile") List<MultipartFile> carFile,
            HttpSession session
            // 다른 필드가 있으면 여기에 추가
    ) {
	   String userId = (String) session.getAttribute("loginId");
	   Car car = new Car();
	   userId = "user1";
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
	   log.info(carFile.toString());
	   log.info(car.toString());
	   
	   carService.carWrite(car,carFile);
	   
	   
        return "ok";
    }
}



