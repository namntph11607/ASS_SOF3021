package poly.ass.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {

	Integer productId;
	String productName;
	double price;
	int quantity = 1;
}
