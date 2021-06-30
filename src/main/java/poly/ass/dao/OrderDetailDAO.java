package poly.ass.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.ass.entity.Order;
import poly.ass.entity.OrderDetail;
import poly.ass.entity.Report;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

	@Query("SELECT od \r\n"
			+ "FROM OrderDetail od \r\n"
			+ "WHERE od.order.id = ?1 \r\n")
	List<OrderDetail> findHistoryOrderDetails(Integer id);
	
	@Query("SELECT new Report(d.product.category, sum(d.price * d.quantity), sum(d.quantity)) "
			+ "FROM OrderDetail d GROUP BY d.product.category")
	List<Report> revenueByCategory();
}
