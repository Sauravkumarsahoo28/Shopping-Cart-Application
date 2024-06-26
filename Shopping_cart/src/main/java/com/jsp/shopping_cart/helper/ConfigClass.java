package com.jsp.shopping_cart.helper;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@ComponentScan(basePackages = "com")
@Configuration       
public class ConfigClass 
{
	@Bean
	public InternalResourceViewResolver resolver()
	{
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/");
		resolver.setSuffix(".jsp");
		
		
		return resolver;
	}
	
	@Bean
	public EntityManagerFactory getEmf()
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
		return emf;
	}

}
