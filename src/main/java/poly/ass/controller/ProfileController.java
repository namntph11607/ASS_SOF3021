package poly.ass.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.ass.dao.AccountDAO;
import poly.ass.dao.CategoryDAO;
import poly.ass.entity.Account;
import poly.ass.entity.Category;
import poly.ass.service.ShoppingCartService;

@Controller
public class ProfileController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ShoppingCartService cart;
	
	@Autowired
	AccountDAO dao;

	@Autowired
	CategoryDAO daoCategory;
	
	@RequestMapping("/myAcc/myProfile/{id}")
	public String  viewProfile(
			Model model,
			@PathVariable("id") String id
			) {
		request.setAttribute("TitlePage", "My Profile");
		request.setAttribute("view", "/views/user/profile.jsp");
		request.setAttribute("Count", cart.getCount());
		
		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);
		

		Account account = dao.findById(id).get();
//		System.out.println(account);
		model.addAttribute("user", account);
		
		return "index";
	}
	
	@PostMapping("/myAcc/myProfile/edit")
	public String update(
			Model model,
			@Validated @ModelAttribute("user") Account account, 
			BindingResult result
			) {
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/myProfile";
		} else {
			System.out.println(account);
			dao.save(account);

			return "redirect:/myAcc/myProfile/" + account.getUsername();

		}
		
	}
}
