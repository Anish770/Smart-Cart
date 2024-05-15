package in.ecom.main.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.razorpay.Invoice;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.*;

import in.ecom.main.entity.Cart;
import in.ecom.main.entity.CartItems;
import in.ecom.main.entity.UserDetails;
import jakarta.servlet.http.HttpSession;

@RestController
public class TempController {
	@PostMapping("/ok")
	public String generatenewinvoice(@RequestBody Map<String, Object>data
			                         ,HttpSession session) throws RazorpayException
	{
		
//		UserDetails user=(UserDetails)session.getAttribute("session_name");
//		Cart cart=user.getCart();
//		List<CartItems> cartitems=cart.getCartItems();
//		int total_amount=0 ;
//		for (int i=0;i<cartitems.size();i++)
//		{
//			total_amount+=cartitems.get(i).getTotalPrice();
//			
//		}
//		System.out.println(total_amount);
//		RazorpayClient razorpay = new RazorpayClient("rzp_test_h8PvaIuTCG0NqV", "tuv0DVOXIbOg5si2sOixPGAp");
//
//		JSONObject invoiceRequest = new JSONObject();
//		invoiceRequest.put("type", "invoice");
//		invoiceRequest.put("description", "Invoice for the month of January 2020");
//		invoiceRequest.put("partial_payment",true);
//		JSONObject customer = new JSONObject();
//		customer.put("name",user.getName());
//		customer.put("contact",user.getPhoneno());
//		customer.put("email",user.getEmail());
////		JSONObject billingAddress = new JSONObject();
////		billingAddress.put("line1","Ground & 1st Floor, SJR Cyber Laskar");
////		billingAddress.put("line2","Hosur Road");
////		billingAddress.put("zipcode","560068");
////		billingAddress.put("city","Bengaluru");
////		billingAddress.put("state","Karnataka");
////		billingAddress.put("country","in");
////		customer.put("billing_address",billingAddress);
////		JSONObject shippingAddress = new JSONObject();
////		shippingAddress.put("line1","Ground & 1st Floor, SJR Cyber Laskar");
////		shippingAddress.put("line2","Hosur Road");
////		shippingAddress.put("zipcode","560068");
////		shippingAddress.put("city","Bengaluru");
////		shippingAddress.put("state","Karnataka");
////		shippingAddress.put("country","in");
////		customer.put("shipping_address",shippingAddress);
//		invoiceRequest.put("customer",customer);
//		List<Object> lines = new ArrayList<>();
//		JSONObject lineItems = new JSONObject();
//		lineItems.put("name","Master Cloud Computing in 30 Days");
//		lineItems.put("description","Book by Ravena Ravenclaw");
//		lineItems.put("amount",total_amount);
//		lineItems.put("currency","INR");
////		lineItems.put("quantity",quantity);
//		lines.add(lineItems);
//		invoiceRequest.put("line_items",lines);
////		invoiceRequest.put("email_notify", 1);
////		invoiceRequest.put("sms_notify", 1);
//		invoiceRequest.put("currency","INR");
//		invoiceRequest.put("expire_by", 2180479824L);
//
//		Invoice invoice = razorpay.invoices.create(invoiceRequest);
		return "ok";
	}
	@PostMapping("/create_order")
	@ResponseBody
	public String createOrder(@RequestBody Map<String,Object> data ) throws RazorpayException//above 5 lakhs
	{
		System.out.println(data);
		int amount =Integer.parseInt(data.get("amount").toString());
		RazorpayClient razorpay_client = new RazorpayClient("rzp_test_h8PvaIuTCG0NqV", "tuv0DVOXIbOg5si2sOixPGAp");
		JSONObject ob=new JSONObject();
		ob.put("amount", amount*100L);//converting rs into paise
		ob.put("currency","INR");
		ob.put("receipt", "txn_23243");
		//creating order
		Order order=razorpay_client.orders.create(ob);
		System.out.println(order);
		return order.toString();
	}
}
