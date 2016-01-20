package com.spring.akn.configuration.security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
    
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(userDetailsService);
		//.passwordEncoder(passwordEncoder());

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/", "/home").permitAll();
		
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		http.authorizeRequests().antMatchers("/user/**").hasRole("USER");
		
		http.formLogin().permitAll().loginPage("/login").usernameParameter("username").passwordParameter("password");
		
		/*  .successHandler(ajaxAuthenticationSuccessHandler)
		  .failureHandler(ajaxAuthenticationFailureHandler);*/
		 
		http.sessionManagement().sessionAuthenticationErrorUrl("/login").maximumSessions(1).expiredUrl("/login");
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout").invalidateHttpSession(true)
				.deleteCookies("JESSIONID").permitAll();
		http.csrf().disable();
		http.exceptionHandling().accessDeniedPage("/accessDenied");
	}
}
