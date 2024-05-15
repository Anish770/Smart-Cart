package in.ecom.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.ecom.main.entity.Seller;

public interface Seller_ProductRepository extends JpaRepository<Seller, Integer>{
	
	Seller findByProductname(String productname);
	
	@Query("SELECT productname FROM Seller")
	List<String> findProductName();

}