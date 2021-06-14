package poly.ass.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.ass.dao.CategoryDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.Category;
import poly.ass.entity.Product;
import poly.ass.service.ShoppingCartService;

@Controller
public class HomeController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ProductDAO daoProduct;
	
	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	ShoppingCartService cart;

	@RequestMapping("/")
	public String home() {
		request.setAttribute("TitlePage", "Home Page");
		request.setAttribute("view", "/views/guests/HotProduct&Slide.jsp");
		
		List<Category> categories = daoCategory.findAll();
		request.setAttribute("categories", categories);
		
		List<Product> hotProducts = daoProduct.getHotProducts();
		request.setAttribute("hotProducts", hotProducts);
		
		Sort sortCD = Sort.by(Direction.DESC,"createDate");
		List<Product> newProducts = daoProduct.findAll(sortCD);
		request.setAttribute("newProducts", newProducts);
		
		Sort sortP = Sort.by(Direction.ASC,"Price");
		List<Product> saleProducts = daoProduct.findAll(sortP);
		request.setAttribute("saleProducts", saleProducts);
		
		request.setAttribute("Count", cart.getCount());
		
		return "index";
	}
	
	@RequestMapping("/shop/{id}")
	public String showMore(@PathVariable("id") Category category) {
		request.setAttribute("TitlePage", "Shoping");
		request.setAttribute("view", "/views/guests/AllProducts.jsp");
		request.setAttribute("category", category.getName());
		
		List<Category> categories = daoCategory.findAll();
		request.setAttribute("categories", categories);
		
		List<Product> products = daoProduct.findByCategory(category);
		request.setAttribute("products", products);
		
		request.setAttribute("Count", cart.getCount());
		
		return "index";
	}
	
	@RequestMapping("/shop")
	public String showAll() {
		request.setAttribute("TitlePage", "Shoping");
		request.setAttribute("view", "/views/guests/AllProducts.jsp");
		
		List<Category> categories = daoCategory.findAll();
		request.setAttribute("categories", categories);
		
		List<Product> products = daoProduct.findAll();
		request.setAttribute("products", products);

		return "index";
	}
}
