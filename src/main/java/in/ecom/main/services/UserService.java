package in.ecom.main.services;

import java.util.Map;

//import org.springframework.stereotype.Service;

import in.ecom.main.entity.UserDetails;
//@Service
public interface UserService {
	public UserDetails login(String email);
	public boolean addUserService(UserDetails user,String email);
	public Map<String,Object> updateQuantity(int quantity,int cartItemId,String updateStatus);
}
