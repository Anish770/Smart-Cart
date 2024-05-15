package in.ecom.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
//import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.ecom.main.entity.UserDetails;
@Transactional 
//@Repository
@EnableJpaRepositories(basePackages = "in.ecom.main.repository")
public interface UserRepository extends JpaRepository<UserDetails, Integer> {
	UserDetails findByEmail(String email);
	
}
