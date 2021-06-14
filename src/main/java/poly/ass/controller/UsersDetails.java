package poly.ass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.AccountDAO;
import poly.ass.entity.Account;
import poly.ass.entity.Category;

@Controller
@RequestMapping("/admin")
public class UsersDetails {

	@Autowired
	AccountDAO dao;
	
	@ModelAttribute("roles")
	public Map<Boolean, String> getRole(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, " Admin");
		map.put(false, " User");
		return map;
	}
	
	@ModelAttribute("activated")
	public Map<Boolean, String> getActivated(){
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, " Activated");
		map.put(false, " Not Activated");
		return map;
	}

	@GetMapping("/users")
	public String category(
			Model model, 
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("user") Account account
			) {
		model.addAttribute("TitlePage", "Users Page");
		model.addAttribute("views", "/views/admin/UsersDetails.jsp");

		
//		Category category = new Category();
//		model.addAttribute("cate", category);
//		List<Category> items = dao.findAll();
//		model.addAttribute("items", items);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Account> page = dao.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}

	@RequestMapping("/users/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id, 
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("user") Account account) {
		model.addAttribute("TitlePage", "Users Page");
		model.addAttribute("views", "/views/admin/UsersDetails.jsp");

		account = dao.findById(id).get();
		model.addAttribute("user", account);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Account> page = dao.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}

	@RequestMapping(value = "/users/save", method = RequestMethod.POST)
	public String update(
			Model model,
			@Validated @ModelAttribute("user") Account item, 
			BindingResult result) {

		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/admin/users";
		}else {
			if(item.getUsername() != null) {
				dao.save(item);

				return "redirect:/admin/users/edit/" + item.getUsername();	
			}else {
				dao.save(item);
				
				return "redirect:/admin/users";
			}					
		}
	}
	
	@RequestMapping(value = "/users/clear", method = RequestMethod.POST)
	public String clear(Model model) {
		Account account = new Account();
		model.addAttribute("user", account);
		
		return "redirect:/admin/users";
	}

	@RequestMapping("/users/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/admin/users";
	}
}
