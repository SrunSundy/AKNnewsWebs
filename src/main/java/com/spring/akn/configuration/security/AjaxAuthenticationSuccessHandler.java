package com.spring.akn.configuration.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.spring.akn.entyties.User;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
			
			//for get user principle for get user id
		    User user = (User) auth.getPrincipal();  
            //create and store session to browser
	        HttpSession session = request.getSession(true);    
	        session.setAttribute("SessionUser", user);  
	        
			//respone back to client 
			response.getWriter().print(determineTargetUrl(auth));
	        response.getWriter().flush();
	        
	}
	
	/*
	 * This method extracts the roles of currently logged-in user and returns
	 * appropriate URL according to his/her role.
	 */
	private String determineTargetUrl(Authentication authentication) {

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority authority : authorities) {
			roles.add(authority.getAuthority());
			System.out.println("Extract Role: " + authority.getAuthority());
		}
		
		System.out.println("ROLES  "+ roles);
		
		if (roles.contains("ROLE_Admin")) {
			return "admin";
		}else if (roles.contains("ROLE_Employee")) {
			return "";
		}else{
			return "accessDenied";
		}
	}
}
