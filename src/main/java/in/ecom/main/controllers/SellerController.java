package in.ecom.main.controllers;



import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.ecom.main.entity.Seller;
import in.ecom.main.services.SellerService;
import in.ecom.main.urls.OthersUrls;


@Controller
public class SellerController {
	
	@Autowired
	SellerService sellerService;
//	@GetMapping("/")
//	public String OpenProductPage(Model model) {	
//		model.addAttribute("seller", new Seller());
//		return "add-product";
//	}
//	@GetMapping("/userindex")
//	public String OpenSellerIndexPage(Model model) {
//		List<Seller> card_products=sellerService.getAllProductsCardService();
//		model.addAttribute("model_card_products", card_products);
//		return "user-index";
//	}

	@GetMapping("/addproduct")
	public String OpenAddProductPage(
			Model model,
			@RequestParam(name="redirect_attr_success",required=false)String success,
			@RequestParam(name="redirect_attr_error",required=false)String error
			)
	{
		model.addAttribute("seller", new Seller());
		model.addAttribute("model_sucess", success);
		model.addAttribute("model_error", error);
		
	     return "add-product";
	}
	
	
	@PostMapping("/addProductForm")
	public String addProductDetails(
			@ModelAttribute("seller") Seller seller,
			@RequestParam("file") MultipartFile productimage,
			RedirectAttributes redirectAttributes,
			Model model
			) {
		boolean status1= saveImage(productimage);
		if(!status1) {
			System.out.println("Product image not uploaded");
		}
		seller.setProductimage(productimage.getOriginalFilename());//for saving the name of the file in the database 
		boolean status= sellerService.addSellerProductService(seller);
		if(status) {
			model.addAttribute("model_success", "Product added sucessfully");
			//redirectAttributes.addAttribute("redirect_attr_success","Product added sucessfully");	
		}
		else {
			model.addAttribute("model_error", "Product not added due to some error");
			//redirectAttributes.addAttribute("redirect_attr_error","Product not added due to some error");
		}
	return "add-product";
	   
	}

	private boolean saveImage(MultipartFile file) {
       boolean status = false;
		
		try
		{
			String fileName = file.getOriginalFilename();
			Path filePath = Paths.get(OthersUrls.IMAGE_UPLOAD_FOLDER, fileName);
			Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
			
			status = true;
		}
		catch(Exception e)
		{
			status = false;
			e.printStackTrace();
		}
		
		return status;
	}
	int PAGE_SIZE=5;
	@GetMapping("/productlist")
	public String openProductListPage(
			@RequestParam(name="redirectAttr_sucess",required=false)String success,
			@RequestParam(name="redirectAttr_error",required=false)String error,
			@RequestParam(defaultValue = "1")int page,
			Model model) {
		List<Seller> list_products=sellerService.getAllProductsListService();
		int TOTAL_PRODUCTS = list_products.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);
		
		
		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_END_INDEX = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);
		
		List<Seller> new_list_products = list_products.subList(LIST_START_INDEX, LIST_END_INDEX);
		
		model.addAttribute("model_list_products", new_list_products);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);
		
		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);
		
		return "products-list";
	}
	
	@GetMapping("/productDetails")
	public String openProductDetailsPage(@RequestParam(value="productName", required=false)String productname,Model model) {
		Seller seller=sellerService.getProductDetailsService(productname);
		model.addAttribute("model_product",seller);
		
		return "product-details";	
	}
		
}
