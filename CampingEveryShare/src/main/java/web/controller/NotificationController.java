package web.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.LinkedBlockingQueue;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.java.Log;
import web.dto.Notification;
import web.service.face.NotificationService;


@Controller
public class NotificationController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
    
    @Autowired
    private NotificationService notificationService;
    
    private SseEmitter emitter;
	
    @GetMapping("/notifications")
    public String index() {
        return "notify/notification";
    }

    @GetMapping(value ="/sendNotification", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String sendNotification() {
        Notification notification = new Notification();
        notification.setMessage("한글 왜 안가!");
        logger.info("message : {}", notification);
        notificationService.addNotification(notification);
        
        
        MediaType mediaType = new MediaType("text", "plain", StandardCharsets.UTF_8 );
        
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event().data(notification.getMessage(), mediaType));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return "알림이 전송되었습니다!";
    }

//    @GetMapping(value="/getNotifications", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    @GetMapping(value="/getNotifications", produces = "text/event-stream;charset=UTF-8")
    @ResponseBody
    public SseEmitter getNotifications() {
    	emitter = new SseEmitter();
        notificationService.addEmitter(emitter);
        emitter.onCompletion(() -> notificationService.removeEmitter(emitter));
        emitter.onTimeout(() -> notificationService.removeEmitter(emitter));
        
        return emitter;
    }
    
    @GetMapping("/clearEmitters")
    public String clearEmitters() {
        notificationService.clearEmitters();
        return "Emitters cleared.";
    }
	
}
