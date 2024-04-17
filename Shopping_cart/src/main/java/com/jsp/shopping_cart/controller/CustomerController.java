package com.jsp.shopping_cart.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shopping_cart.dao.CustomerDao;
import com.jsp.shopping_cart.dto.Customer;

@Controller
public class CustomerController
{
	@Autowired
	CustomerDao cd ;
	
	@RequestMapping("/customerregister")
	public ModelAndView addcustomer()
	{
		Customer c = new Customer();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("customerobj", c);
		mav.setViewName("customerform");
		return mav;
	}
	@RequestMapping("/savecustomer")
	public ModelAndView savecustomer(@ModelAttribute("customerobj") Customer c )
	{
		cd.saveCustomer(c);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", "Data Saved Sucessfully");
		mav.setViewName("Customermenu");
		return mav;
	}
	
	@RequestMapping("/customerloginvalidation")
	public ModelAndView loginCustomer(ServletRequest req ,HttpSession session )
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Customer c =cd.login(email, password);
		
		ModelAndView mav = new ModelAndView();
		
		if (c!= null)
		{
			mav.addObject("msg", "Sucessfully Login");
			mav.setViewName("customerinfo");
			session.setAttribute("customerinfo", c);
			return mav;
		}
		
		else {
			mav.addObject("msg", "wrong credentials");
			mav.setViewName("Customermenu");
			return mav;
		}
	}
	
	
}
