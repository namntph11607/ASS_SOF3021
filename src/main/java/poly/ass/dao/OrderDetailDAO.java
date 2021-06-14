package poly.ass.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.ass.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

	
}
