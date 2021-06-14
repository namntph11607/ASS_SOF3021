package poly.ass.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import poly.ass.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer> {

}
