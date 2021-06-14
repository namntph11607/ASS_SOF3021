package poly.ass.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.AccountDAO;
import poly.ass.entity.Account;
import poly.ass.service.SessionService;

@Controller
public class LoginController {
	
	@Autowired
	SessionService session;
	
	@Autowired
	AccountDAO dao;

	@GetMapping("/login")
	public String getFormLogin() {
		
		session.remove("User");
		
		return "login";
	}
	
	@PostMapping("/login")
	public String login(
			HttpSession sess,
			@Valid @ModelAttribute("acc") Account account,
			@RequestParam("username") String un,
			@RequestParam("password") String pw
			) {
		

		System.out.println("Username: " + un);
		System.out.println("Paswword: " + pw);
		account = dao.findByUsernameAndPassword(un, pw);
//		account = dao.findByUsername(un);

		
		if(account != null) {
			if(account.getPassword().equalsIgnoreCase(pw)) {
				session.set("User", account);
				if(account.isRole()) {

					return "redirect:/admin";
				}else {

					return "redirect:/";
				}
			}else {
				sess.setAttribute("errorMessage", "Bạn đã nhập sai mật khẩu!");	
			}
				

			System.out.println(account);
		}else {
			sess.setAttribute("errorMessage", "Vui lòng nhâp tài khoản và mật khẩu!");			
			
			return "redirect:/login";
		}

		return "redirect:/login";
	}
}
