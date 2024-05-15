package in.ecom.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import in.ecom.main.entity.Cart;
import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.Seller;
import in.ecom.main.repository.CartItemsRepository;
@Service
public class CartItemsServiceImpl implements CartItemsService{
	@Autowired
	CartItemsRepository cartItemsRepository;
	@Autowired
	
	@Override
	public List<CartItems> getAllCartItems() {
		
		return cartItemsRepository.findAll();
	}

	@Override
	public void addToCart(Seller seller) {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void deleteAssociatedCartItems(int cartItemId) {
//		cartItemsRepository.deleteAssociatedCartItemsByCartItemId(cartItemId);
//		
//	}
//	 @Override
//	    public boolean deleteCartItem(int cartItemId) {
//	        try {
//	            cartItemsRepository.deleteById(cartItemId);
//	            return true; // Return true if deletion is successful
//	        } catch (Exception e) {
//	            e.printStackTrace(); // Print stack trace for any exceptions
//	            return false; // Return false if an error occurs during deletion
//	        }
//	    }
	@Override
	public boolean deleteCartItem(int id) {
		// TODO Auto-generated method stub
		boolean status=false;
		try {
			cartItemsRepository.deleteById(id);
			status=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	

}
