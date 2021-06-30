package poly.ass.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id 
//	@Column(name = "Username")
	@NotBlank
	String username;
//	@Column(name = "Passwrod")
	@NotBlank
	String password;
//	@Column(name = "Fullname")
	String fullname;
//	@Column(name = "Email")
	String email;
//	@Column(name = "Photo")
	String photo = "";
//	@Column(name = "Activated")
	boolean activated = true;
//	@Column(name = "Role")
	boolean Role = false;
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
