package com.spring.akn.repositories;
import com.spring.akn.entyties.User;


public interface UserRespositories {
	
    public User findUserByEmail(String email);
}
