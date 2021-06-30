package poly.ass.controller;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.AccountDAO;
import poly.ass.entity.Account;
import poly.ass.entity.MailModel;
import poly.ass.service.MailerServiceImpl;
import poly.ass.service.SessionService;

@Controller
public class LoginController {
	
	@Autowired
	SessionService session;
	
	@Autowired
	AccountDAO dao;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired 
	MailerServiceImpl mailer;

	@GetMapping("/login")
	public String getFormLogin(
			Model model
			) {
		model.addAttribute("TitlePage", "Đăng Nhập");
		model.addAttribute("views", "/views/SignIn.jsp");
		
		session.remove("User");
		
		
		
		return "login";
	}
		
	@PostMapping("/login")
	public String login(
			HttpSession sess,
			@ModelAttribute("acc") Account account,
			@RequestParam("username") String un,
			@RequestParam("password") String pw, 
			BindingResult result
			) {
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			sess.setAttribute("errors", errors);

			return "redirect:/login";
		}else {
			account = dao.findByUsernameAndPassword(un, pw);

			if(account != null) {
				if(account.isActivated()) {
					session.set("User", account);
					if(account.isRole()) {

						sess.setAttribute("errorMessage", "");
						return "redirect:/admin";
					}else {

						sess.setAttribute("errorMessage", "");
						return "redirect:/";
					}
				}else {
					sess.setAttribute("errorMessage", "Bạn không được đăng nhập với tài khoản này!");

					return "redirect:/login";
				}
					
			}else {				
						
				if(un.length()==0 || pw.length()==0) {
					sess.setAttribute("errorMessage", "Bạn vui lòng nhập tài khoản và mật khẩu!");						
				}
				else {
					sess.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu nhập không đúng!");	
				}
				return "redirect:/login";
			}
		}
	}

	@GetMapping("/SignUp")
	public String getFormSignUp(
			Model model,
			@ModelAttribute("user") Account user,
			HttpSession sess
			) {
		model.addAttribute("TitlePage", "Đăng Ký");
		model.addAttribute("views", "/views/SignUp.jsp");
		sess.setAttribute("errorMessageSignUp", "");
		
		
		return "login";
	}
	
	@PostMapping("/SignUp")
	public String signUp(Model model,
			HttpSession sess,
			@ModelAttribute("user") Account user, 
			@RequestParam("username") String un, 
			@RequestParam("fullname") String fn, 
			@RequestParam("email") String email,
			@RequestParam("password") String pwd,  
			@RequestParam("cfpwd") String cfpwd, 
			BindingResult result) {

		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/SignUp";
		}else {		

				Account newAcc = dao.findByUsername(un);
//				System.out.println(user);
				if(newAcc == null) {					
					if (un.length() == 0) {
						sess.setAttribute("errorMessageSignUp", "Không được để trống Username");
					} else if (fn.length() == 0) {
						sess.setAttribute("errorMessageSignUp", "Không được để trống Fullname");
					} else if (email.length() == 0) {
						sess.setAttribute("errorMessageSignUp", "Không được để trống Email");
					} else if (pwd.length() == 0) {
						sess.setAttribute("errorMessageSignUp", "Không được để trống Password");
					} else if (cfpwd.length() == 0) {
						sess.setAttribute("errorMessageSignUp", "Không được để trống Confirm Password");
					} else if (!pwd.equalsIgnoreCase(cfpwd)) {
						sess.setAttribute("errorMessageSignUp", "Confirm Password không giống với password");
					} else {
						if(!dao.existsById(un)) {
							sess.setAttribute("errorMessageSignUp", "");
							sess.setAttribute("errorMessage", "");
							dao.save(user);
							return "redirect:/login";
						}
						throw new RuntimeException("Ma tai khoan da ton tai!");
					}
					System.out.println("User == Null");
					return "redirect:/SignUp";		
				}else {
					System.out.println("User != null");
					sess.setAttribute("errorMessageSignUp", "Username này đã tồn tại, vui lòng chọn username khác!");

					return "redirect:/SignUp";		
				}
		}
	}
	
	@PostMapping("/ForgotPassword")
	public String forgotPassword(
			HttpSession sess,
			@ModelAttribute("fpAccount") Account account,
			@RequestParam("usernameF") String un,
			@RequestParam("emailF") String em, 
			BindingResult result
			) {
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			sess.setAttribute("errors", errors);

			return "redirect:/login";
		}else {
			try {
				Account acc = dao.findByUsername(un);
				
				if(acc != null) {
					mailer.send(
							em, 
							"Mail ForgotPassword từ ASS_SOF3021", 
							"<h3>"
							+"Username: " + un +"<br>"
							+"Password: " + acc.getPassword()
							+ "</h3>");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			return "redirect:/login";
		}
	}
	
	
}
