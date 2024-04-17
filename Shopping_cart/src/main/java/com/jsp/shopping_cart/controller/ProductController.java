package com.jsp.shopping_cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shopping_cart.dao.MerchantDao;
import com.jsp.shopping_cart.dao.ProductDao;
import com.jsp.shopping_cart.dto.Merchant;
import com.jsp.shopping_cart.dto.Product;

@Controller
public class ProductController 
{
	@Autowired
	ProductDao pd ;
	
	@Autowired
	MerchantDao md;
	
	@RequestMapping("/addproduct")
	public ModelAndView addProduct()
	{
		Product p = new Product();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productobj", p);
		mav.setViewName("productform");
		return mav;
	}
	
	@RequestMapping("/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute("productobj")Product p ,HttpSession session)
	{
		  
//		this method basically to save  the product form different merchants so
//		basically first we get the information from the session,and than storing in a merchant variable  
		
		Merchant merchant = (Merchant) session.getAttribute("merchantinfo");  
		List<Product> product = merchant.getProducts();  //this is basically whenever the merchants wants to save the 
														//products it should save in the existing product list of that 
														//particular merchant ,so first we get all the product for the 
														//particular merchant and than adding the new product to it .
		
		if (product.size()>0) 
		{
			product.add(p);
			merchant.setProducts(product);   //in this block if the merchant have some previous product the new one will be added 
											//existing block .
		}
		else {
				List<Product> pl = new ArrayList<Product>();
			pl.add(p);
			merchant.setProducts(pl);  //in this block if merchant does not have any existing product,first it will create a 
										// a list than it will added to it .
			
		}
		pd.saveProduct(p);    
		md.updateMerchant(merchant);   //when the product is added than first we have to update the merchant and than only save
									// the product .because there is mapping between merchant and product .for that we have autowired 
									// merchant dao to use  update merchant method.
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "product Save Sucessfully");
		mav.setViewName("merchantoption");
		return mav ;
	}
	@RequestMapping("/deleteproduct")
	public ModelAndView deleteproductbyId(@RequestParam("id") int id ,HttpSession session)
	{
		Merchant m = (Merchant) session.getAttribute("merchantinfo");
		Merchant mc = md.deleteproductfromMerchant(m.getId(), id);
		md.updateMerchant(mc);
		pd.deleteProductById(id);
		
		session.setAttribute("merchantinfo", m);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("viewallproduct");
		return mav;
	}
	
	@RequestMapping("/displayallproduct")
	public ModelAndView displayProduct()
	{
		List<Product> p = pd.findAllProduct();
		ModelAndView mav = new ModelAndView();
		mav.addObject("products", p);
		mav.setViewName("customerviewallproduct");
		
		return mav;
	}
	@RequestMapping("/displayproductsbybrand")
	public ModelAndView readBrand() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readbrandfromcustomer");
		return mav;
	}
	
	@RequestMapping("/displaybybrand")
	public ModelAndView displayByBrand(ServletRequest req) {
		String brand=req.getParameter("brand");
		
		List<Product> products=pd.fetchProductByBrand(brand);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("products",products);
		mav.setViewName("customerviewallproduct");
		return mav;
	}
	
	@RequestMapping("/displayproductsbycategory")
	public ModelAndView readCategory() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readcategoryfromcustomer");
		return mav;
	}
	
	@RequestMapping("/readcategory")
	public ModelAndView displayByCategory(ServletRequest req) {
		String category=req.getParameter("category");
		
		List<Product> products=pd.fetchProductByCategory(category);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("products",products);
		mav.setViewName("customerviewallproduct");
		return mav;
	}
	
	@RequestMapping("/displaybetweenrange")
	public ModelAndView readRange() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("readrangefromcustomer");
		return mav;
	}
	
	@RequestMapping("/readrange")
	public ModelAndView displayByRange(ServletRequest req) {
		double lrange=Integer.parseInt(req.getParameter("lrange"));
		double urange=Integer.parseInt(req.getParameter("urange"));

		
		List<Product> products=pd.fetchProductByRange(lrange,urange);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("products",products);
		mav.setViewName("customerviewallproduct");
		return mav;
	}
 }
