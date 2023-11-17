package web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Controller
public class NotifyController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	public Map<String, SseEmitter> emitters = new HashMap<>();
	
    @GetMapping("/get")
    public String getindex() {
        return "notify/getNotification";
    }
    
    @GetMapping("/send")
    public String sendindex() {
        return "notify/sendNotification";
    }

    @RequestMapping(value = "/getnotification", consumes = MediaType.ALL_VALUE)
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
    public void sendNotification( String userId, String message, HttpServletResponse resp ) {
    	logger.info("userId : {}", userId);
    	logger.info("message : {}", message);

    	SseEmitter sseEmitter = emitters.get(userId);
    	logger.info("sseEmitter : {}", sseEmitter);
		    	
    	try {
    		
			String msg = URLEncoder.encode(message, "UTF-8");
			msg = msg.replaceAll("\\+", "%20");
			
			logger.info("msg : {}", msg);
			
			if(sseEmitter != null) {
				try {
					sseEmitter.send(sseEmitter.event().data(msg));
				} catch (IOException e) {
					emitters.remove(sseEmitter);
				}
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
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
