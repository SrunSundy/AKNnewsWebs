package com.spring.akn.repositories.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
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
 /*   @Autowired
    DataSource dataSource;
	
	@Override
	public User findUserByUserName(String username) {
		String sql = "SELECT user_id, user_name, user_email, user_password, enabled FROM tbuser WHERE user_name = ?";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("user_id"));
				user.setUsername(rs.getString("user_name"));
				user.setPassword(rs.getString("user_password"));
				user.setEmail(rs.getString("user_email"));
				user.setEnabled(rs.getBoolean("enabled"));
				user.setRoles(this.findUserRoleByUserId(user.getId()));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	public List<Role> findUserRoleByUserId(int id) {
		List<Role> roles = new ArrayList<Role>();
		String sql = "SELECT tbrole.role_id, tbrole.role_name FROM tbuser "
				+ "LEFT JOIN tbuser_role ON tbuser.user_id = tbuser_role.user_id "
				+ "LEFT JOIN tbrole ON tbrole.role_id= tbuser_role.role_id WHERE tbuser.user_id=? ";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Role role = new Role();
				role.setId(rs.getInt("role_id"));
				role.setName("ROLE_" + rs.getString("role_name"));
				roles.add(role);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return roles;
	}*/
	@Override
	public User findUserByEmail(String email) {

		try{
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "Basic YXBpOmFrbm5ld3M=");
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
		FrmLogin frmLogin=new FrmLogin();
		frmLogin.setEmail(email);
        HttpEntity<Object> request = new HttpEntity<Object>(frmLogin,headers);
		ResponseEntity<Map> response = restTemplate.exchange("http://localhost:8080/AKNnews/api/user/weblogin", HttpMethod.POST , request , Map.class) ;
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		
//		System.out.println(userMap.get()));
		if(map.get("DATA") != null){
			Map<String , Object> userMap = (HashMap<String , Object>) map.get("DATA");
			
			
			
			//System.out.println(roleMap);
			
			User u = new User();
			u.setId((int)userMap.get("id"));
			u.setUsername((String)userMap.get("username"));
			u.setEmail((String)userMap.get("email"));
			u.setPassword((String)userMap.get("password"));
			u.setImage((String)userMap.get("image"));
			u.setEnabled((boolean)userMap.get("enabled"));
			
			ArrayList<Map<String, Object>> rolesMap = (ArrayList<Map<String, Object>>) userMap.get("roles");
			
			List<Role> roles = new ArrayList<Role>();
			for(Map<String, Object> roleMap: rolesMap){
				Role role = new Role();
				role.setId((Integer)roleMap.get("id"));
				role.setName((String)roleMap.get("name"));
				roles.add(role);
			}
			u.setRoles(roles);
			//roles.add(roleMap);
			System.out.println("Password " +u.getPassword());
			return u;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	return null;
	}

}
