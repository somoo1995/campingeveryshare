package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/car")
public class CarController {
	
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


}
