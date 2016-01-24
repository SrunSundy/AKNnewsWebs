package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping(value={"/", "/home"})
	public String homePage(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "home";
	}
	
	@RequestMapping(value="/detail/{id}")
	public String detailPage(ModelMap model, @PathVariable("id") int id){
		model.addAttribute("id", id);
		return  "detail";
	}
	
	@RequestMapping(value={"/{uid}/saved"})
	public String savedPage(ModelMap model){
		model.addAttribute("message", "hello world");
		return "saved-news";
	}
	
	@RequestMapping(value="/login")
	public String loginPage(){
		return  "login";
	}
}
