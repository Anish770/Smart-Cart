package in.ecom.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import in.ecom.main.entity.CartItems;

public interface CartItemsRepository extends JpaRepository<CartItems, Integer> {
	 void deleteById(Integer id) ;
////	@Modifying
////	@Query("DELETE FROM cart_cart_items cci WHERE cci.cartItem.id = cartItemId")
////	void deleteAssociatedCartItemsByCartItemId(@Param("cartItemId") int cartItemId);
////
////	@Modifying
////	@Query("DELETE FROM CartItems ci WHERE ci.id = :cartItemId")
////	void deleteById(@Param("cartItemId") int cartItemId);
//	 @Modifying
//	    @Query("DELETE FROM cart_cart_items cci WHERE cci.cartItem.id = :cartItemId")
//	    void deleteAssociatedCartItemsByCartItemId(@Param("cartItemId") int cartItemId);
}
