package in.ecom.main.services;

import java.util.List;

import in.ecom.main.entity.Cart;
import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.Seller;

public interface CartItemsService {

	public List<CartItems> getAllCartItems();
	void addToCart(Seller seller);
	public boolean deleteCartItem(int id);
//	public void deleteAssociatedCartItems(int cartItemId);
//	public boolean deleteCartItem(int cartItemId);
}
