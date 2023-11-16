package web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import web.dto.Alert;
import web.service.face.AlertService;

@Controller
@RequestMapping("/alert")
public class AlertController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	public Map<String, SseEmitter> emitters = new HashMap<>();
	
	@Autowired AlertService alertService;
	
	@GetMapping("/list")
	public String alert( Model model, Alert alert, @SessionAttribute("loginId") String userId ) {
		alert.setUserId(userId);
		logger.info("alert : {}", alert);		

		List<Alert> list = alertService.getList(alert);
		
		model.addAttribute("list", list);
		
		return "alert/list";
	}
	
	@PostMapping("/read")
	public String readAlert( Alert alert, @SessionAttribute("loginId") String userId ) {
		logger.info("alert : {}", alert);
		alertService.readAlert(alert);
		
		return "jsonView";
	}
	
	@RequestMapping("/new")
	public String countNewAlert( Model model, Alert alert, @SessionAttribute("loginId") String userId ) {
		alert.setUserId(userId);
		int hasNew = alertService.hasNew(alert);
		model.addAttribute("hasNew", hasNew);
		logger.info("hasNew : {}", hasNew);
		return "jsonView";
	}
	
	
    @RequestMapping(value = "/get", consumes = MediaType.ALL_VALUE)
    @ResponseBody
    public SseEmitter getNotification( HttpSession session ) {
    	
    	String userId = (String) session.getAttribute("loginId");
    	logger.info("userId : {}", userId);
    	    	
    	SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
    	sendInitEvent(sseEmitter);
    	emitters.put(userId, sseEmitter);
    	
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter));
		sseEmitter.onTimeout(() -> emitters.remove(sseEmitter));
		sseEmitter.onError((e) -> emitters.remove(sseEmitter));
    	
		return sseEmitter;
	}
    
    @PostMapping(value = "/sendnotification")
    @ResponseBody
    public void sendNotification( Alert alert, HttpServletResponse resp ) {
    	logger.info("alert : {}", alert);
    	
    	alertService.sendAlert(alert);
    	
    	int hasNew = alertService.hasNew(alert);
    	logger.info("hasNew : {}", hasNew);
    	
    	SseEmitter sseEmitter = emitters.get(alert.getUserId());
    	logger.info("sseEmitter : {}", sseEmitter);
    	
    	if(sseEmitter != null) {
    		
    		String formattedData = new JSONObject().put("hasNew", hasNew).put("alert", alert).toString();

    		try {
				sseEmitter.send(sseEmitter.event().data(formattedData));
			} catch (IOException e) {
				emitters.remove(sseEmitter);
			}
    		
    	}
    	
        try {
            resp.sendRedirect("/send");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
    
	private void sendInitEvent( SseEmitter sseEmitter ) {
		try {
			sseEmitter.send(sseEmitter.event().name("INIT"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
