package poly.ass.controller;

import java.io.File;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
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
import poly.ass.entity.MailModel;
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
	
	@Autowired
	JavaMailSender sender;
	
	@GetMapping("/cart/checkout")
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
				daoOrder.save(order);
				
				//luu du lieu order detail

				for (CartItem item : cart.getItems()) {
//					System.out.println("Save orderDtails: " + item);
					Order o = daoOrder.getById(order.getId());
					Product product = daoProduct.findByName(item.getProductName());

					daoOrderDetail.save(new OrderDetail(item.getPrice(), item.getQuantity(), product, o));
				}

				//xoa tat ca san pham trong gio hang
				cart.getItems().clear();
				return "redirect:/";
							
		}
		
//		return "redirect:/cart/checkout";
	}
	
//	public void sendEmail() throws MessagingException {
//		MimeMessage message = sender.createMimeMessage();
//		MailModel mail = new MailModel();
//		//viet thu
//		sender.send(message); // bo vao buu dien
//		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//		helper.setFrom(mail.getFrom());
//		helper.setTo(mail.getTo());
//		helper.setSubject(mail.getSubject());
//		helper.setText(mail.getBody(), true);
//		helper.setReplyTo(mail.getFrom());
//		for(String email : mail.getCc()) {
//			helper.addCc(email);
//		}
//		for(String email : mail.getBcc()) {
//			helper.addBcc(email);
//		}
//		for(File file : mail.getFiles()) {
//			helper.addAttachment(file.getName(), file);
//		}
//	}
}
