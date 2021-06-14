package poly.ass.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.OrderDAO;
import poly.ass.entity.Order;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	OrderDAO daoOrder;

	@GetMapping("")
	public String index(Model model) {
		model.addAttribute("TitlePage", "Dashboard Page");
		model.addAttribute("views", "/views/admin/dashboard.jsp");
		
		return "/admin/index";
	}
		
	@GetMapping("/bill")
	public String billpaid(
			Model model,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("TitlePage", "Bill Paid Page");
		model.addAttribute("views", "/views/admin/Bill.jsp");
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Order> page = daoOrder.findAll(pageable);
		model.addAttribute("page", page);
		
		return "/admin/index";
	}
	
}
