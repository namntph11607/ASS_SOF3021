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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.CategoryDAO;
import poly.ass.dao.OrderDAO;
import poly.ass.dao.OrderDetailDAO;
import poly.ass.dao.ProductDAO;
import poly.ass.entity.Account;
import poly.ass.entity.CartItem;
import poly.ass.entity.Category;
import poly.ass.entity.Order;
import poly.ass.entity.OrderDetail;
import poly.ass.entity.Product;
import poly.ass.service.SessionService;
import poly.ass.service.ShoppingCartService;

@Controller
public class CheckOutController {
	@Autowired
	OrderDAO daoOrder;
	
	@Autowired
	OrderDetailDAO daoOrderDetail;
	
	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	ProductDAO daoProduct;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	SessionService session;
	
	@RequestMapping("/cart/checkout")
	public String checkout(
			Model model
			) {
		model.addAttribute("TitlePage", "CheckOut Details");
		model.addAttribute("view", "/views/user/checkoutDetails.jsp");
		
		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);
		
		model.addAttribute("cartItems", cart.getItems());
		model.addAttribute("Count", cart.getCount());
		model.addAttribute("Amount", cart.getAmount());
		
		Order order = new Order();
		model.addAttribute("order", order);
		
		return "index";
	}
	
	@PostMapping("/cart/checkout")
	public String postCheckOut(
			Model model,
			@Validated @ModelAttribute("order") Order order, 
			@RequestParam("fullname") String fullname,
			BindingResult result
			) {
		model.addAttribute("TitlePage", "CheckOut Details");
		model.addAttribute("view", "/views/user/checkoutDetails.jsp");
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/cart/checkout";
		}else {
				//tao order moi
//				daoOrder.save(new Order());
				System.out.println("Save order: " + order);
				System.out.println("New order fullname: " + fullname);
				
				
				//luu du lieu order detail

				for (CartItem item : cart.getItems()) {
					System.out.println("Save orderDtails: " + item);
					Order o = daoOrder.getById(7);
					Product product = daoProduct.findByName(item.getProductName());

					daoOrderDetail.save(new OrderDetail(item.getPrice(), item.getQuantity(), product, o));
				}

				//xoa tat ca san pham trong gio hang
				cart.getItems().clear();
				return "redirect:/";
							
		}
		
//		return "redirect:/cart/checkout";
	}
}
