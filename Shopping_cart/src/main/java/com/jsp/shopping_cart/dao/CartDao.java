package com.jsp.shopping_cart.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shopping_cart.dto.Cart;
import com.jsp.shopping_cart.dto.Customer;
import com.jsp.shopping_cart.dto.Item;
import com.jsp.shopping_cart.dto.Cart;
import com.jsp.shopping_cart.dto.Cart;

@Repository
public class CartDao {

	@Autowired
	EntityManagerFactory emf;

	
	public void saveCart(Cart c) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.persist(c);
		et.commit();
	}
	public void updateCart(Cart c) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.merge(c);
		et.commit();
	}
	public void deleteCartById(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		Cart c=em.find(Cart.class,id);
		et.begin();
		em.remove(c);
		et.commit();
	}
	public Cart findCartById(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Cart c=em.find(Cart.class,id);
		if(c != null)return c;
		else return null; 
		
	}
	public void removeItemFromCart(int cart_id,int item_id) {

		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		Query query=em.createQuery("delete from cart_item where items_id=?1");
		query.setParameter(1, item_id);
		
		/*
		 * Cart c=em.find(Cart.class,cart_id); List<Item> items=c.getItems(); 
		 * List<Item> itemsupdate=new ArrayList<>(); double totalprice=0; for(Item
		 * i:items) { if(item_id != i.getId()) { itemsupdate.add(i);
		 * totalprice+=i.getPrice(); } } c.setItems(itemsupdate);
		 * c.setTotalprice(totalprice); //updateCart(c); //dao.updateCart(c);
		 */		
		et.begin();
		em.remove(query);
		et.commit();

	}
	public Cart removeAllItemsFromCart(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		Cart c=em.find(Cart.class,id);
		c.setItems(null);
		c.setTotalprice(0);
		
		et.begin();
		em.merge(c);
		et.commit();
		
		return c;
	}
	
}
