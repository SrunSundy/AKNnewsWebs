package com.spring.akn.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Service;

import com.spring.akn.entyties.User;
import com.spring.akn.repositories.UserRespositories;

@Service
public class CustomUserDetailService  implements UserDetailsService{

	@Autowired
	UserRespositories userDaoImpl;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
	    User user = userDaoImpl.findUserByEmail(email);
	    
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("User not found");
		}
		return user;
	
	}
	
	

}
