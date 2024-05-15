package in.ecom.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.ecom.main.entity.SellerDetails;
import in.ecom.main.entity.UserDetails;
import in.ecom.main.repository.SellerRepository;
import in.ecom.main.repository.Seller_ProductRepository;
import in.ecom.main.repository.UserRepository;
import in.ecom.main.entity.Seller;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	SellerRepository sellerrepository;
	
	@Autowired
	Seller_ProductRepository seller_productRepository;
	@Override
	public SellerDetails login(String email) {
		// TODO Auto-generated method stub
		SellerDetails user=sellerrepository.findByEmail(email);
		return user;
	}
	@Override
	public boolean addSellerService(SellerDetails seller) {
		// TODO Auto-generated method stub
		boolean status=false;
		try {
			sellerrepository.save(seller);
			status=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	@Override
	public boolean addSellerProductService(Seller seller) {
		boolean status =false;
		try {
			seller_productRepository.save(seller);
			status=true;
		} catch (Exception e) {
			e.printStackTrace();
			status=false;
		}
		return status;
	}

	@Override
	public List<Seller> getAllProductsListService() {
		return seller_productRepository.findAll();
	}

	@Override
	public Seller getProductDetailsService(String productname) {
		return seller_productRepository.findByProductname(productname);
	}

	@Override
	public List<Seller> getAllProductsCardService() {
		
		return seller_productRepository.findAll();
	}
	
}
