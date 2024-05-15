package in.ecom.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
//import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.ecom.main.entity.Cart;
import in.ecom.main.entity.UserDetails;
import java.util.List;



public interface cartRepository extends JpaRepository<Cart, Integer> {
	
  void deleteById(Integer id) ;
}
