package in.ecom.main.controllers;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.Seller;
import in.ecom.main.entity.SellerDetails;
import in.ecom.main.entity.UserDetails;
import in.ecom.main.services.CartItemsService;
import in.ecom.main.services.SellerService;
import in.ecom.main.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController 
{
	@Autowired
	SellerService sellerservice;
	@Autowired
	CartItemsService cartItemsService;
//	@GetMapping("/userindex")
//	public String OpenSellerIndexPage(Model model) {
//		List<Seller> card_products=sellerservice.getAllProductsCardService();
//		model.addAttribute("model_card_products", card_products);
//		return "user-index";
//	}

	@GetMapping("/")
	public String openIndexPage(Model model)
	{
		List<Seller> card_products=sellerservice.getAllProductsCardService();
		model.addAttribute("model_card_products", card_products);
		return "index";
	}
	
	@GetMapping("/home")
	public String openHomePage(Model model)
	{
		List<Seller> card_products=sellerservice.getAllProductsCardService();
		model.addAttribute("model_card_products", card_products);
		return "index";
	}
	
	@GetMapping("/addToCartPage")
	public String opencartPage(Model model)
	{
		List<CartItems> cart_items=cartItemsService.getAllCartItems();
		model.addAttribute("model_cart", cart_items);
		return "cart";
	}
	
	@GetMapping("/userhome")
	public String openUserHomePage(Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("session_name");
		if(user==null) {
			return "login";
		}
		List<Seller> card_products=sellerservice.getAllProductsCardService();
		model.addAttribute("model_card_products", card_products);
		return "user-index";
	}
	
	@GetMapping("/login")
	public String openLoginPage()
	{
		return "login";
	}
	@GetMapping("/signup")
	public String openSignUpPage(Model model)
	{
		model.addAttribute("modelUserAttribute", new UserDetails());
		return "sign-up";
	}
	@GetMapping("/seller")
	public String openSellerLoginPage()
	{
		return "seller-login";
	}
	@GetMapping("/sellerlist")
	public String openSellerListPage()
	{
		return "seller-list";
	}
	
	@GetMapping("/profileAdmin")
	public String openAdminProfilePage()
	{
		return "profile-admin";
	}
	@Autowired
	UserService userservice;
	@PostMapping("/loginForm")
	public String loginForm(
								@RequestParam("email1") String myemail,
								@RequestParam("pass1") String mypass,
								Model model ,HttpSession session
							)
	{
		String page = "login";
		if(myemail.equals("admin@gmail.com") && mypass.equals("admin123"))
		{
			page = "profile-admin";
		}
		else
		{
			UserDetails user=userservice.login(myemail);
			if(user!=null&&user.getPassword().equals(mypass)) 
			{
				List<Seller> card_products=sellerservice.getAllProductsCardService();
				model.addAttribute("model_card_products", card_products);
				session.setAttribute("session_name",user);
				page="user-index";
			}
			else
			{
				model.addAttribute("model_error", "email and password didn't matched");
			}
		}
		return page;
	}
	@PostMapping("/signUpForm")
	public String signUpForm(@Valid@ModelAttribute("modelUserAttribute")UserDetails user,BindingResult br,Model model) {
		String page="sign-up";
		if(!br.hasErrors())
		{
//			UserDetails user_entry=userservice.login(user.getEmail());
				boolean status =userservice.addUserService(user,user.getEmail());
				if(status)
				{
					model.addAttribute("model_success","Success you can now go to login page now");
				}
				else
				{
					model.addAttribute("model_error","Something went wrong while signing up or email is already registered");
				}
				user.setName("");
				user.setEmail("");
				user.setPassword("");
				user.setPhoneno("");
		}
		return page;
	}
	
	@PostMapping("/sellerloginForm")
	public String sellerloginForm(
								@RequestParam("email1") String myemail,
								@RequestParam("pass1") String mypass,
								Model model ,HttpSession session
							)
	{
		String page = "login";
		if(myemail.equals("admin@gmail.com") && mypass.equals("admin123"))
		{
			page = "profile-admin";
		}
		else
		{
			SellerDetails seller=sellerservice.login(myemail);
			if(seller!=null&&seller.getPassword().equals(mypass)) 
			{
				session.setAttribute("session_name",seller);
				page="profile-seller";
			}
			else
			{
				model.addAttribute("model_error", "email and password didn't matched");
			}
		}
		return page;
	}
	@GetMapping("/logout")
	public String openLogoutPage(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
}
