package poly.ass.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import poly.ass.entity.Account;


@Component
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler
	) throws IOException {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute("User");
		
		if (user.isRole() == false) {
			response.sendRedirect( request.getContextPath() + "/" );
			return false;
		}

		return true;
	}
}