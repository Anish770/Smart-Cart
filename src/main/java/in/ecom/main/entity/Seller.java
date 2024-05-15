package in.ecom.main.entity;

import org.springframework.web.multipart.MultipartFile;

import in.ecom.main.urls.OthersUrls;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product")
public class Seller {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name= "productname")
	private String productname;
	
	@Column(name= "details")
	private String details;
	
	@Column(name= "originalprice")
	private String originalprice;
	
	@Column(name= "discountprice")
	private String discountprice;
	
	@Column(name= "product_img_url")
	private String productimage;
	
	@Column(name= "other_details")
	private String otherdetails;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getOriginalprice() {
		return originalprice;
	}

	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}

	public String getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(String discountprice) {
		this.discountprice = discountprice;
	}

	
	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getOtherdetails() {
		return otherdetails;
	}

	public void setOtherdetails(String otherdetails) {
		this.otherdetails = otherdetails;
	}
	
	
	
	
}
