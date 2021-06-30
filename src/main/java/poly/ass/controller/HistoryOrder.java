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
import org.springframework.web.bind.annotation.RequestParam;

import poly.ass.dao.AccountDAO;
import poly.ass.dao.CategoryDAO;
import poly.ass.dao.OrderDAO;
import poly.ass.dao.OrderDetailDAO;
import poly.ass.entity.Account;
import poly.ass.entity.Category;
import poly.ass.entity.Order;
import poly.ass.entity.OrderDetail;
import poly.ass.service.ShoppingCartService;

@Controller
public class HistoryOrder {
	
	@Autowired
	AccountDAO daoAccount;
	
	@Autowired
	CategoryDAO daoCategory;
	
	@Autowired
	OrderDAO daoOrder;
	
	@Autowired
	OrderDetailDAO daoOrderDetail;
	
	@Autowired
	ShoppingCartService cart;
	

	@GetMapping("/myAcc/historyOrder/{id}")
	public String viewhistoryOrder(Model model, 
			@PathVariable("id") String id,
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "History Order");
		model.addAttribute("view", "/views/user/historyOrder.jsp");
		model.addAttribute("Count", cart.getCount());

		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);

		Account account = daoAccount.findById(id).get();
//			System.out.println(account);
//		model.addAttribute("user", account);
		
		Sort sortStatus = Sort.by(Direction.ASC,"Status");
		Pageable pageable = PageRequest.of(p.orElse(0), 10,sortStatus);
		Page<Order> page = daoOrder.findByAccount(account, pageable);
		model.addAttribute("page", page);
		
		return "index";
	}
	
	@GetMapping("/myAcc/historyOrderDetails/{id}")
	public String viewhistoryOrderDetails(Model model, 
			@PathVariable("id") Integer id,
			@RequestParam("p") Optional<Integer> p
			) {
		model.addAttribute("TitlePage", "History OrderDetails");
		model.addAttribute("view", "/views/user/historyOrderDetails.jsp");
		model.addAttribute("Count", cart.getCount());

		List<Category> categories = daoCategory.findAll();
		model.addAttribute("categories", categories);

		List<OrderDetail> listOD = daoOrderDetail.findHistoryOrderDetails(id);
		model.addAttribute("listOD", listOD);
		
		int tong = 0;
		for(OrderDetail od : listOD) {
			tong += (od.getQuantity() * od.getPrice());
		}
		model.addAttribute("TongTien", tong);
		model.addAttribute("Status", listOD.get(0).getOrder().getStatus());
		model.addAttribute("username", listOD.get(0).getOrder().getAccount().getUsername());
		
		return "index";
	}
	
}
