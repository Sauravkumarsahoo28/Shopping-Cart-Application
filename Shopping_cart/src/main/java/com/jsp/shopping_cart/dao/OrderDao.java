package com.jsp.shopping_cart.dao;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shopping_cart.dto.Orders;

@Repository
public class OrderDao {

	@Autowired
	EntityManagerFactory emf;
	
	public void saveOrders(Orders orders) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(orders);
		et.commit();
	}
	public void updateOrder(Orders o) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(o);
		et.commit();
	}
}
