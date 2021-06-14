package poly.ass.controller;

import java.util.List;
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

import poly.ass.dao.CategoryDAO;
import poly.ass.entity.Category;

@Controller
@RequestMapping("/admin")
public class CategoryDetails {

	@Autowired
	CategoryDAO dao;

	@GetMapping("/category")
	public String category(Model model, 
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("cate") Category category) {
		model.addAttribute("TitlePage", "Categories Page");
		model.addAttribute("views", "/views/admin/Categories.jsp");

		
//		Category category = new Category();
//		model.addAttribute("cate", category);
//		List<Category> items = dao.findAll();
//		model.addAttribute("items", items);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Category> page = dao.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}

	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, 
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("cate") Category category) {
		model.addAttribute("TitlePage", "Categories Page");
		model.addAttribute("views", "/views/admin/Categories.jsp");

		category = dao.findById(id).get();
		model.addAttribute("cate", category);
//		List<Category> items = dao.findAll();
//		model.addAttribute("items", items);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Category> page = dao.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}

	@RequestMapping(value = "/category/save", method = RequestMethod.POST)
	public String save(
			Model model,
			@Validated @ModelAttribute("cate") Category item, 
			BindingResult result) {

		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/admin/category";
		}else {
			if(item.getId() != null) {
				dao.save(item);
				
				return "redirect:/admin/category/edit/" + item.getId();
			}else {
				dao.save(item);
				
				return "redirect:/admin/category";
			}
						
		}

	}
	
	@RequestMapping(value = "/category/clear", method = RequestMethod.POST)
	public String clear(Model model) {
		Category category = new Category();
		model.addAttribute("cate", category);
		
		return "redirect:/admin/category";
	}

	@RequestMapping("/category/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/admin/category";
	}
}
