package poly.ass.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.CategoryDAO;
import poly.ass.dao.OrderDAO;
import poly.ass.dao.OrderDetailDAO;
import poly.ass.entity.Category;
import poly.ass.entity.Order;
import poly.ass.entity.OrderDetail;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	OrderDAO daoOrder;
	
	@Autowired
	OrderDetailDAO daoOrderDetail;
	
	@Autowired
	CategoryDAO daoCategory;

	@GetMapping("")
	public String index(Model model) {
		model.addAttribute("TitlePage", "Dashboard Page");
		model.addAttribute("views", "/views/admin/dashboard.jsp");
				
		model.addAttribute("report", daoOrderDetail.revenueByCategory());
		return "/admin/index";
	}
		
	@GetMapping("/bill")
	public String billpaid(
			Model model,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("TitlePage", "Bill Paid Page");
		model.addAttribute("views", "/views/admin/Bill.jsp");
		
		Sort sortStatus = Sort.by(Direction.ASC,"Status");
		Pageable pageable = PageRequest.of(p.orElse(0), 10, sortStatus);
		Page<Order> page = daoOrder.findAll(pageable);
		model.addAttribute("page", page);
		
		return "/admin/index";
	}
	
	@PostMapping("/bill/{id}")
	public String updateStatus(
			@PathVariable("id") Integer id, 
			@RequestParam("stt") Integer status
			) {
		Order order = daoOrder.getById(id);
		order.setStatus(status);
	
		daoOrder.save(order);
		
		return "redirect:/admin/bill";
	}
	
	@GetMapping("/bill/OrderDetails/{id}")
	public String viewOrderDetails(Model model, 
			@PathVariable("id") Integer id,
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "History OrderDetails");
		model.addAttribute("views", "/views/admin/BillDetails.jsp");

		List<OrderDetail> listOD = daoOrderDetail.findHistoryOrderDetails(id);
		model.addAttribute("listOD", listOD);
		
		int tong = 0;
		for(OrderDetail od : listOD) {
			tong += (od.getQuantity() * od.getPrice());
		}
		model.addAttribute("TongTien", tong);
		model.addAttribute("Status", listOD.get(0).getOrder().getStatus());
		model.addAttribute("username", listOD.get(0).getOrder().getAccount().getUsername());
		
		return "/admin/index";
	}
}
