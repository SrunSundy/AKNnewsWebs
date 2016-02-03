package com.spring.akn.repositories.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import com.spring.akn.encryption.Encryption;
import com.spring.akn.entyties.FrmLogin;
import com.spring.akn.entyties.Role;
import com.spring.akn.entyties.User;
import com.spring.akn.repositories.UserRespositories;

@Repository
public class UserRepositorieImpl implements UserRespositories {
	@Override
	public User findUserByEmail(String email) {

		try {

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", "Basic S0FBUEkhQCMkOiFAIyRLQUFQSQ==");
			RestTemplate restTemplate = new RestTemplate();
			restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
			restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
			FrmLogin frmLogin = new FrmLogin();
			frmLogin.setEmail(email);
			HttpEntity<Object> request = new HttpEntity<Object>(frmLogin, headers);
			/*ResponseEntity<Map> response = restTemplate.exchange("http://192.168.178.6:8080/KAAPI/api/authentication/weblogin",
					HttpMethod.POST, request, Map.class);*/
			ResponseEntity<Map> response = restTemplate.exchange("http://api.khmeracademy.org/api/authentication/weblogin",
			HttpMethod.POST, request, Map.class);
			
			Map<String, Object> map = (HashMap<String, Object>) response.getBody();
	
			if (map.get("USER") != null) {
				Map<String, Object> userMap = (HashMap<String, Object>) map.get("USER");

				// System.out.println(roleMap);

				User u = new User();
				u.setUserId( new Encryption().decode((String)userMap.get("userId")));
				u.setUsername((String)userMap.get("username"));
				u.setEmail((String)userMap.get("email"));
				u.setPassword((String)userMap.get("password"));
				u.setGender((String)userMap.get("gender"));
				u.setUserImageUrl((String)userMap.get("userImageUrl"));
				u.setRegisterDate((String)userMap.get("registerDate"));
				u.setUserStatus((boolean)userMap.get("userStatus"));
           
				List<Role> roles = new ArrayList<Role>();
				Role role = new Role();
				role.setId((String) userMap.get("userTypeId"));
				role.setName("ROLE_"+(String) userMap.get("userTypeName"));
				roles.add(role);
				u.setRoles(roles);
				// roles.add(roleMap);
				
				System.out.println(u);
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
