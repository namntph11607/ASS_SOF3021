package poly.ass.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.CategoryDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.CartItem;
import poly.ass.entity.Category;
import poly.ass.entity.Product;
import poly.ass.service.CookieService;
import poly.ass.service.SessionService;
import poly.ass.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	ProductDAO daoProduct;
	
	@Autowired
	CookieService cookie;
	
	@Autowired
	SessionService session;
	
	@Autowired
	ShoppingCartService cart;
	
	@RequestMapping("/cart/view")
	public String cartView() {
		request.setAttribute("TitlePage", "Cart");
		request.setAttribute("view", "/views/guests/cart.jsp");

		List<Category> categories = daoCategory.findAll();
		request.setAttribute("categories", categories);
		
		request.setAttribute("cartItems", cart.getItems());
		request.setAttribute("Count", cart.getCount());
		request.setAttribute("Amount", cart.getAmount());
		
		return "index";
	}
	
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		Product product = daoProduct.getById(id);
		if(product != null) {
			CartItem item = new CartItem();
			item.setProductId(product.getId());
			item.setProductName(product.getName());
			item.setPrice(product.getPrice());
			item.setQuantity(1);
			
			cart.add(item);
		}
	
//		System.out.println("Add ITEM: " + id);
		return "redirect:/cart/view"; // hiển thị giỏ hàng
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		
//		System.out.println("Remove ITEM: " + id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("quantity") Integer quantity) {
		cart.update(id, quantity);
//		System.out.println("Update ITEM: " + id + "; Qty = " + quantity);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();

//		System.out.println("CLEAR CART");
		return "redirect:/cart/view";
	}
	
}
