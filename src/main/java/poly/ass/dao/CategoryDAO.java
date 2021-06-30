package poly.ass.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.ass.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

}
