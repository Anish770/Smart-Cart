package in.ecom.main.services;

//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import in.ecom.main.entity.Cart;
//import in.ecom.main.entity.CartItems;
//import in.ecom.main.entity.UserDetails;
//import in.ecom.main.repository.cartRepository;
//
//@Service
//
//public class CartServiceImpl implements CartService{
//@Autowired 
//cartRepository cartrepository;
//
//@Override
//public boolean delete_cart_items(int cartItemId) {
//	// TODO Auto-generated method stub
//	boolean status=false;
//	UserDetails user =(UserDetails) session.getAttribute("session_name");
//	Cart cart = user.getCart();
//	if (cart == null) {
//		cart = new Cart();
//	}
//	List<CartItems>cartItems=cart.getCartItems();
//	return false;
//}
//
//}
