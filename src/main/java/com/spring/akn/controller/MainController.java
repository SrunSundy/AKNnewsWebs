package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping(value={"/", "/home"})
	public String homePage(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "home";
	}
}
