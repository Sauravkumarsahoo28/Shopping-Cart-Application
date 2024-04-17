package com.jsp.shopping_cart.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shopping_cart.dao.MerchantDao;
import com.jsp.shopping_cart.dto.Merchant;

@Controller
public class MerchantController 
{
	@Autowired
	MerchantDao md ;
	
	
	@RequestMapping("/register")           //request come from menu.jsp file 
	public ModelAndView addMerchant()
	{
		Merchant m = new Merchant();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("merchantobj1", m);   //here we send the created object to merchantform.jsp 
		mav.setViewName("merchantform");
		
		return mav;
	}
	
	@RequestMapping("/savemerchant")
	public ModelAndView saveMerchant(@ModelAttribute("merchantobj1") Merchant m ) 
	//by the use of @modelAttribute the user entered data will come to this method 																	
	{
		md.saveMerchant(m);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "Data Saved Sucessfully");
		mav.setViewName("menu");
		return mav;
	}
	
	
	@RequestMapping("/loginvalidation")
	public ModelAndView loginvalidation(ServletRequest req ,HttpSession session)   //in this we take the use of Servlet to fetching the data 
															//from the browser
	{															
		String email = req.getParameter("email");			//getParameter method is used to fetch the data from browser
		String password = req.getParameter("password");
		
		Merchant m = md.login(email, password);				//here we send the request to them dao class login method along 
		ModelAndView mav = new ModelAndView();				//with the user entered email and password.
		
		if (m!=null)
		{
			mav.addObject("msg", "sucessfully login");
			mav.setViewName("merchantoption");
			session.setAttribute("merchantinfo", m);  //here if user entered correct credentials we are storing 
			return mav;								 //the merchant information in session . by the use of setAttribute ,
													//because when ever merchant want to access merchant options without
											//login in the application tell him to first login 
			
		}
		else
		{
			mav.addObject("msg", "invalid Credentials");
			mav.setViewName("merchantoption");
			return mav;
		}
	}
	
	
}
