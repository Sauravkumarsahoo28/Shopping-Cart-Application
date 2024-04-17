package com.jsp.shopping_cart.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shopping_cart.dto.Merchant;
import com.jsp.shopping_cart.dto.Product;


@Repository
public class MerchantDao 
{
	@Autowired
	EntityManagerFactory emf ;
	
	@Autowired
	ProductDao pd;
	
	public void saveMerchant(Merchant m )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.persist(m);
		et.commit();
	}
	
	
	public Merchant login(String email ,String password)
	{
		EntityManager  em = emf.createEntityManager();
		Query q =  em.createQuery("select m from Merchant m where m.email=?1 and m.password=?2 ");
		q.setParameter(1, email);        //whenever we use JPQl query to set the data we take the help of setParameter method 
		q.setParameter(2, password);
		
		try {
																	//we used try catch here because ,if the login credential 
																	//are wrong it will give null,i.e if the exception is found 
																	//in try block it will handle in catch block and return null
			Merchant merchant =(Merchant)q.getSingleResult();
			return merchant;
			
		} 
		
		catch (Exception e)
		{
			return null;	
		}
		
	}
	
	public void updateMerchant(Merchant m )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em .getTransaction();
		
		et.begin();
		em.merge(m);
		et.commit();
	}
	
	public void deleteMerchantbyId(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Merchant m = em.find(Merchant.class, id);
		et.begin();
		em.remove(m);
		et.commit();
	}
	
	public Merchant findMerchantById(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Merchant m = em.find(Merchant.class, id);
		
		if (m!=null) 
		{
			return m;
		}
		else {
			return null;
		}
	}
	
	public Merchant deleteproductfromMerchant(int merchant_id,int product_id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Merchant merchant = em.find(Merchant.class, merchant_id);
		
		List<Product> products= merchant.getProducts();
		
		
		List<Product> plist= new ArrayList<Product>();
		
		for(Product p :plist)
		{
			if (p.getId()!=product_id)
			{
				plist.add(p);
			}
		}
		
		
//		Product p =pd.findProductbyId(product_id);
//		products.remove(p);
		
		merchant.setProducts(plist);
		
		return merchant;
		
	}
	
}
