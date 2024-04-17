package com.jsp.shopping_cart.dao;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shopping_cart.dto.Product;



@Repository
public class ProductDao 
{

	@Autowired
	EntityManagerFactory emf;
	
	public void saveProduct(Product p )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.persist(p);
		et.commit();
	}
	
	public void updateProduct(Product p )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(p);
		et.commit();
	}
	
	public void deleteProductById(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Product p = em.find(Product.class, id);
		
		et.begin();
		em.remove(p);
		et.commit();
		
	}
	public Product findProductbyId(int id )
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Product p = em .find(Product.class, id);
		
		if (p!= null)
		{
			return p;
			
		}
		else {
			return null;
		}
	}
	
	public List<Product> findAllProduct()
	{
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Query q = em.createQuery("select s from Product s ");
		
		 return q.getResultList();
			
	}
	
	public List<Product> fetchProductByBrand(String brand){
		EntityManager em=emf.createEntityManager();
		Query query=em.createQuery("select p from Product p where p.brand=?1");
		query.setParameter(1,brand);
		return query.getResultList();

	}
	
	public List<Product> fetchProductByCategory(String category){
		EntityManager em=emf.createEntityManager();
		Query query=em.createQuery("select p from Product p where p.category=?1");
		query.setParameter(1,category);
		return query.getResultList();

	}
	
	public List<Product> fetchProductByRange(double lrange,double urange){
		EntityManager em=emf.createEntityManager();
		Query query=em.createQuery("select p from Product p where p.price between ?1 and ?2");
		query.setParameter(1,lrange);
		query.setParameter(2, urange);
		return query.getResultList();

	}
	
}
