package product.spring.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import product.spring.entities.Taikhoan;

@Component
public class Interceptor implements HandlerInterceptor{
	
	Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		log.info("LoggerInterceptor.preHandle()");
		HttpSession session = request.getSession();
        Taikhoan tk = (Taikhoan) session.getAttribute("tk");
        if(tk==null){
        	response.sendRedirect(request.getContextPath() + "/login");
        	return true;
        }
        else return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("LoggerInterceptor.postHandle()");
//		PrintWriter out = response.getWriter();
//		out.println("<script type=\'text/javascript\'>");
//		out.println("alert('abc');");
//		out.println("</script>");
		
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception x) throws Exception {
		System.out.println("LoggerInterceptor.afterCompletion()");
		log.info("LoggerInterceptor.afterCompletion()");
		HttpSession session = request.getSession(true);
		log.info(".........................................." + session.getAttribute("success"));
		
	}
}
