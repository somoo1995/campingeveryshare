package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/info")
@Controller
public class InfoController {

	@GetMapping("/userinfo")
	public void userInfo() {}
	
	@GetMapping("/usage")
	public void usage() {}
	
	
}
