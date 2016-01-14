package com.spring.akn.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping(value={"/","home"})
	public String test(){
		System.out.println("**************************########################## testing");
		return "home";
	}
	
	@RequestMapping(value={"/sample","/test"})
	public String test1(){
		System.out.println("**************************########################## testing");
		return "admin/sample";
	}
	
	@RequestMapping(value={"/category"})
	public String test2(){
		System.out.println("**************************########################## testing");
		return "admin/category";
	}
	
}
