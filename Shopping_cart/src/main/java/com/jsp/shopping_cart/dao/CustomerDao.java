package com.jsp.shopping_cart.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shopping_cart.dto.Customer;
import com.jsp.shopping_cart.dto.Merchant;
import com.jsp.shopping_cart.dto.Customer;
@Repository
public class CustomerDao 
{
	@Autowired
	EntityManagerFactory emf ;
	
	public void saveCustomer(Customer m )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.persist(m);
		et.commit();
	}
	
	
	public Customer login(String email ,String password)
	{
		EntityManager  em = emf.createEntityManager();
		Query q =  em.createQuery("select m from Customer m where m.email=?1 and m.password=?2 ");
		q.setParameter(1, email);
		q.setParameter(2, password);
		
		
		
		try {
			Customer  c = (Customer) q.getSingleResult();
			return c;
			
		} catch (Exception e) {
			return null;
		}
	}
	
	public void updateCustomer(Customer m )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em .getTransaction();
		
		et.begin();
		em.merge(m);
		et.commit();
	}
	
	public void deleteCustomerbyId(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Customer m = em.find(Customer.class, id);
		et.begin();
		em.remove(m);
		et.commit();
	}
	
	public Customer findCustomerById(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Customer m = em.find(Customer.class, id);
		
		if (m!=null) 
		{
			return m;
		}
		else {
			return null;
		}
	}
}
