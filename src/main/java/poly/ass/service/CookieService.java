package poly.ass.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	

	/**
	 * Đọc cookie từ request
	 * 
	 * @param name tên cookie cần đọc
	 * @return đối tượng cookie đọc được hoặc null nếu không tồn tại
	 */
	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) 
			for(Cookie cookie : cookies) { 	
				if(cookie.getName().equalsIgnoreCase(name)) {
					System.out.println("Name = " + cookie.getName());
					return cookie;
				}
			}
		return null;
	}

	/**
	 * Đọc giá trị của cookie từ request
	 * 
	 * @param name tên cookie cần đọc
	 * @return chuỗi giá trị đọc được hoặc rỗng nếu không tồn tại
	 */
	public String getValue(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie ck : cookies) {
				if(ck.getName().equalsIgnoreCase(name)) {
					String value = ck.getValue();
					System.out.println("Value = " + value);
					return value;
				}
			}
		}
		
		return "";
	}

	/**
	 * Tạo và gửi cookie về client
	 * 
	 * @param name  tên cookie
	 * @param value giá trị cookie
	 * @param hours thời hạn (giờ)
	 * @return đối tượng cookie đã tạo
	 */
	public Cookie add(String name, String value, int hours) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours*60*60);
		cookie.setPath("/");
		System.out.println(cookie.getName());
		response.addCookie(cookie);
		return cookie;
	}

	/**
	 * Xóa cookie khỏi client
	 * 
	 * @param name tên cookie cần xóa
	 */
	public void remove(String name) {
//		Cookie[] cookies = request.getCookies();
//        for(Cookie cookie : cookies){
//            if(cookie.getName().equals("user")){
//                //Cookie cookie = new Cookie("user", cookies[i].getValue());
//                //cookie.setMaxAge(0);
//                //response.addCookie(cookie);
//            	cookie.setMaxAge(0);
//                response.addCookie(cookie);
//        		System.out.println(cookie);
//                break;
//            }
//        } 
		add(name, "", 0);
	}
}
