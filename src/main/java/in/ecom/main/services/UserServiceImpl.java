package in.ecom.main.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.Seller;
import in.ecom.main.entity.UserDetails;
import in.ecom.main.repository.CartItemsRepository;
import in.ecom.main.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userrepository;
	@Override
	public UserDetails login(String email) {
		// TODO Auto-generated method stub
		UserDetails user=userrepository.findByEmail(email);
		return user;
	}
	@Override
	public boolean addUserService(UserDetails user,String email) {
		// TODO Auto-generated method stub
		boolean status=false;
		try {
			    UserDetails existing_user=userrepository.findByEmail(email);
			    if(existing_user==null)
			    {
			    	userrepository.save(user);
			    	status=true;							    	
			    }
			    else
			    {
			    	status=false;
			    }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	@Autowired
	CartItemsRepository cartItemsRepository;
	@Override
	public Map<String, Object> updateQuantity(int quantity,int cartItemId, String updateStatus) {
		// TODO Auto-generated method stub
		Map<String,Object>response=new HashMap<String, Object>();
		CartItems cartItems=cartItemsRepository.findById(cartItemId).get();
		
		if(updateStatus.equals("decrement"))
		{
			if(quantity>1) {
				--quantity;
			}
		}
			
		else
			{
				int maxQuanity=1000000/Integer.parseInt(cartItems.getSeller().get(0).getDiscountprice());
				 System.out.println(maxQuanity);
				 if(quantity<maxQuanity && quantity<10)
				 {
					 ++quantity;
				 }
			}
		response.put("quantity", quantity);
		response.put("amount",((quantity)*Integer.parseInt(cartItems.getSeller().get(0).getDiscountprice())));
		return response;
	}
	
}
