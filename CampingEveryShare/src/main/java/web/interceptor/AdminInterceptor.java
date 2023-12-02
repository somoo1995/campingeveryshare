package web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("admin interceptor");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("isAdmin") == null ) {
			logger.info(" >> 접속 불가 : 관리자 권한이 필요합니다");
			response.sendRedirect("/user/failnotice");
			return false;
		}
		
		logger.info(" >> 접속 허용 : 관리자");
		return true; 
		
	}
	
}