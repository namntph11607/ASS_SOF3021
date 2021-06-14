package poly.ass.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.ass.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {

	@Query("SELECT acc FROM Account acc WHERE Username = ?1 AND Password = ?2")
	Account findByUsernameAndPassword(String username, String password);
	
	Account findByUsername(String username);
}
