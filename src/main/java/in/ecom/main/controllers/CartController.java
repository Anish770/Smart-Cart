package in.ecom.main.controllers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.ecom.main.entity.Cart;
import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.Seller;
import in.ecom.main.entity.UserDetails;
import in.ecom.main.repository.CartItemsRepository;
import in.ecom.main.repository.SellerRepository;
import in.ecom.main.repository.Seller_ProductRepository;
import in.ecom.main.repository.UserRepository;
import in.ecom.main.repository.cartRepository;
import in.ecom.main.services.CartItemsService;
import in.ecom.main.services.SellerService;
import in.ecom.main.services.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired cartRepository cartrepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	Seller_ProductRepository seller_ProductRepository;
	@Autowired
	CartItemsRepository cartItemsRepository;
	@Autowired
	CartItemsService cartItemsService;
	@PostMapping("/createCart")
	public Cart cart()
	{
		Cart cart=new Cart();
		cartrepository.save(cart);
		return cart;
	}
//	@PostMapping("/addToCart")
//	public UserDetails addToCart(
//			@RequestParam("userId")int userId,
//			@RequestParam("productId")int productId,
//			@RequestParam("quantity") int quantity,
//			Model model) {
//		UserDetails user=userRepository.findById(userId).get();
////		model.addAttribute("model_user", user.getName());
//		CartItems cartItems= new CartItems();
//		Seller seller=seller_ProductRepository.findById(productId).get();
//		System.out.println("Product name is"+ seller.getProductname());
////		model.addAttribute("model_product_name", seller.getProductname());
////		model.addAttribute("model_product_image", seller.getProductimage());
//		List<Seller> product_list=new ArrayList<>();
//		product_list.add(seller);
//		cartItems.setSeller(product_list);
//		cartItems.setQuantity(quantity);
//		cartItemsRepository.save(cartItems);
//		Cart cart=user.getCart();
//		if(cart==null) {
//			cart =new Cart();
//		}
//		List<CartItems> cartItem=cart.getCartItems();
//		cartItem.add(cartItems);
//		cart.setCartItems(cartItem);
//		user.setCart(cart);
//		cartrepository.save(cart);
//		userRepository.save(user);
//		model.addAttribute("model_details", cart);
//		return user;
//	}
	
	@PostMapping("/add_to_cart")
	@ResponseBody
	public UserDetails addToCart(@RequestBody Map<String, Integer> req, HttpSession session) {
		int productId = req.get("productId");
		Seller seller = seller_ProductRepository.findById(productId).get();
		UserDetails user =(UserDetails) session.getAttribute("session_name");
		Cart cart = user.getCart();
		if (cart == null) {
			cart = new Cart();
		}
//		model.addAttribute("model_user", user.getName());
		CartItems cartItems= new CartItems();
		List<Seller> product_list=new ArrayList<>();
		product_list.add(seller);
		cartItems.setSeller(product_list);
		cartItems.setQuantity(1);
		cartItems.setTotalPrice(Integer.parseInt(seller.getDiscountprice()));
		cartItemsRepository.save(cartItems);
		
		List<CartItems> cartItem=cart.getCartItems();
		cartItem.add(cartItems);
		cart.setCartItems(cartItem);
		user.setCart(cart);
		cartrepository.save(cart);
		userRepository.save(user);
		return user;
	}
	
	@GetMapping("/cart")
	public String cart (HttpSession session, Model model) {
		UserDetails user = (UserDetails) session.getAttribute("session_name");
		Cart cart = user.getCart();
		List<CartItems> cartItems = cart.getCartItems();
		model.addAttribute("cartItems", cartItems);
		return "cart";
	}
//	@GetMapping("/deleteCartItems")
//	public String deleteCartItems(@RequestParam("cartId")int id, RedirectAttributes redirectAttributes)
//	{
//		//System.out.println("Email : "+email);
//		
//		boolean status = cartItemsService.deleteCartItem(id);
//		if(status)
//		{
//			redirectAttributes.addAttribute("redirectAttr_success", "Employee deleted successfully");
//		}
//		else
//		{
//			redirectAttributes.addAttribute("redirectAttr_error", "Employee not deleted due to some error");
//		}
//		
//		return "redirect:/cart";
//	}
	@PostMapping("/deleteCartItems")
	public String deleteCartItems(
			@RequestParam("cartItemId")String cartItemId,
			HttpSession session
			) {
		UserDetails user=(UserDetails) session.getAttribute("session_name");
		Cart cart=user.getCart();
		List<CartItems> cartItems=cart.getCartItems();
		System.out.println(cartItems);
//		System.out.println(cartItemId);
		if(cartItems.isEmpty())
		{
			return "error";
		}
////		for(int i=0;i<cartItem.size();i++) {
////			if(cartItem.get(i).getId()==cartItemId) {
////				cartItem.remove(cartItemId);
////				break;
////			}
////		}
		Iterator<CartItems> cartItem = cartItems.iterator();
	    while (cartItem.hasNext()) {
	        CartItems cart_Items = cartItem.next();
//	        System.out.println(cart_Items.getId());
	        if (!cartItemId.isEmpty() && cart_Items.getId() == Integer.parseInt(cartItemId)) {
	        	System.out.println("Hello World");
	            cartItem.remove();
	            break; // Exit loop once item is removed
	        }
	    }
		cart.setCartItems(cartItems);
		cartrepository.save(cart);
		return "redirect:/cart";
	}
	@Autowired SellerService sellerservice;
	@GetMapping("/back_to_shop")
	public String back_to_shop(HttpSession session,Model model)
	{
		UserDetails user = (UserDetails)session.getAttribute("session_name");
		if(user==null) {
			return "login";
		}
		List<Seller> card_products=sellerservice.getAllProductsCardService();
		model.addAttribute("model_card_products", card_products);
		return "user-index";
	}
	@Autowired
	UserService userService;
	
	@PostMapping("/updateQuantity")
	public Map<String,Object>updateQuantity(@RequestBody Map<String, Object> data,HttpSession session)
	{
		int cartItemId=Integer.parseInt(data.get("cartItemId").toString());
		System.out.println("this is the cart id "+cartItemId);//done
		CartItems cartItems=cartItemsRepository.findById(cartItemId).get();
		int quantity=cartItems.getQuantity();
		System.out.println("this is the quantity"+quantity);//don
		String quantityStatus=data.get("status").toString();
		Map<String,Object>response=userService.updateQuantity(quantity, cartItemId, quantityStatus);
		UserDetails user=(UserDetails)session.getAttribute("session_name");
		Cart cart=user.getCart();
		List<CartItems> cartItem=cart.getCartItems();
		for(int i=0;i<cartItem.size();i++)
		{
			if(cartItem.get(i).getId()==cartItemId)
			{
				cartItem.get(i).setQuantity(Integer.parseInt(response.get("quantity").toString()));
				cartItem.get(i).setTotalPrice((int)response.get("amount"));
				cartItemsRepository.save(cartItem.get(i));
			}
		}
		cart.setCartItems(cartItem);
		cartrepository.save(cart);
		return response;
	}
}
