package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Board;
import web.dto.Report;
import web.service.face.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ReportService reportService;
	
	@GetMapping("/report")
	public void report() {}
	
	@PostMapping("/report")
	public String reportProc(Model model, Report report, Board board) {
		logger.info("report : {}" + report.toString());
		
		return  "redirect:/share/list";
	}
	
}
