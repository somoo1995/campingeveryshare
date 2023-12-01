package web.controller;


import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import web.dto.Rent;
import web.service.face.PaymentService;
import web.service.face.RentService;

@Controller
public class PaymentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired PaymentService paymentService;
	@Autowired RentService rentService;
	
	private IamportClient iamportClient;

	private String apiKey = "2441044643164541";
	private String secretKey = "AMk8jwRgIAFwHVMupLUHozRWEEqGlCaCKfr50qmm7n4QJOpvNVTRlGj1QStriq9ZuzNlGfhOsYELviNX";
	
	public PaymentController() {
		this.iamportClient = new IamportClient(apiKey, secretKey);
	}
	
	@ResponseBody
	@RequestMapping(value="/verify/{imp_uid}", method=RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {	
		
			return iamportClient.paymentByImpUid(imp_uid);
	}
	
	
	@PostMapping(value="/cancel")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> cancel( Rent rent, String merchantUid ) {
		logger.info("merchantUid : {} ", merchantUid);
		
		try {
			String token = paymentService.getToken(apiKey, secretKey);
			logger.info("token : {} ", token);
			paymentService.cancel(token, merchantUid);
			
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status","error"));
		}
		
		rentService.cancelBooking(rent);
		
		return ResponseEntity.ok(Map.of("status","success"));
		
	}
	
	
}
