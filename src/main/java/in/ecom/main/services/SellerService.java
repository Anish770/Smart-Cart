package in.ecom.main.services;

import java.util.List;

import in.ecom.main.entity.SellerDetails;
import in.ecom.main.entity.Seller;

//import org.springframework.stereotype.Service;

//import in.ecom.main.entity.UserDetails;
//@Service
public interface SellerService {
	public SellerDetails login(String email);
	public boolean addSellerService(SellerDetails user);
	public boolean addSellerProductService(Seller seller);

	public List<Seller> getAllProductsListService();

	public Seller getProductDetailsService(String productname);

	public List<Seller> getAllProductsCardService();
}
