package com.spring.akn.repositories.impl;

import java.util.ArrayList;
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
			headers.set("Authorization", "Basic YXBpOmFrbm5ld3M=");
			RestTemplate restTemplate = new RestTemplate();
			restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
			restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
			FrmLogin frmLogin = new FrmLogin();
			frmLogin.setEmail(email);
			HttpEntity<Object> request = new HttpEntity<Object>(frmLogin, headers);
			ResponseEntity<Map> response = restTemplate.exchange("http://localhost:8080/AKNnews/api/user/weblogin",
					HttpMethod.POST, request, Map.class);
			Map<String, Object> map = (HashMap<String, Object>) response.getBody();

			// System.out.println(userMap.get()));
			if (map.get("DATA") != null) {
				Map<String, Object> userMap = (HashMap<String, Object>) map.get("DATA");

				// System.out.println(roleMap);

				User u = new User();
				u.setId((int) userMap.get("id"));
				u.setUsername((String) userMap.get("username"));
				u.setEmail((String) userMap.get("email"));
				u.setPassword((String) userMap.get("password"));
				u.setImage((String) userMap.get("image"));
				u.setEnabled((boolean) userMap.get("enabled"));
                //get role (arraylist)
				ArrayList<Map<String, Object>> rolesMap = (ArrayList<Map<String, Object>>) userMap.get("roles");
				List<Role> roles = new ArrayList<Role>();
				for (Map<String, Object> roleMap : rolesMap) {
					Role role = new Role();
					role.setId((Integer) roleMap.get("id"));
					role.setName((String) roleMap.get("name"));
					roles.add(role);
				}
				u.setRoles(roles);
				// roles.add(roleMap);
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
