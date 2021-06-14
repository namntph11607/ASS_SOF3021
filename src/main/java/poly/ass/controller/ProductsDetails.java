package poly.ass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.CategoryDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.Category;
import poly.ass.entity.Product;

@Controller
@RequestMapping("/admin")
public class ProductsDetails {

	@Autowired
	ProductDAO daoProd;
	
	@Autowired
	CategoryDAO daoCate;
	
	@ModelAttribute("availables")
	public Map<Integer, String> getAvailable(){
		Map<Integer, String> map = new HashMap<>();
		map.put(1, " Available");
		map.put(0, " Not Available");
		return map;
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		List<Category> list = daoCate.findAll();	
		
		return list;
	}

	@RequestMapping("/product")
	public String product(
			Model model,
			@RequestParam("p") Optional<Integer> p,
			@ModelAttribute("prod") Product product
			) {
		model.addAttribute("TitlePage", "Products Page");
		model.addAttribute("views", "/views/admin/ProductsDetails.jsp");
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = daoProd.findAll(pageable);
		model.addAttribute("page", page);
		
		return "/admin/index";
	}
	
	@RequestMapping("/product/edit/{id}")
	public String edit(
			Model model, 
			@PathVariable("id") Integer id, 
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "Products Page");
		model.addAttribute("views", "/views/admin/ProductsDetails.jsp");
		
		Product product = daoProd.findByProdID(id);
		System.out.println(product);
//		model.addAttribute("prod", product);

		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = daoProd.findAll(pageable);
		model.addAttribute("page", page);

		return "/admin/index";
	}
	
}
