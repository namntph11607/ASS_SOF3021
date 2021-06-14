package poly.ass.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import poly.ass.entity.Category;
import poly.ass.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	@Query("SELECT entity FROM Product entity WHERE id = :id ")
    public Product findByProdID(@Param("id") Integer id);

	@Query("SELECT p \r\n"
			+ "FROM Product p JOIN OrderDetail od\r\n"
			+ "ON p.id = od.product.id\r\n"
			+ "GROUP BY p.id, p.name, p.price, p.photo, p.createDate, p.available, p.category.id\r\n"
			+ "ORDER BY sum(od.quantity) DESC")
	List<Product> getHotProducts();
	
	
	List<Product> findByCategory(Category category);
	
	Product findByName(String name);
	
}
