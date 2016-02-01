package com.spring.akn.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	
	@RequestMapping(value={"/", "/home"})
	public String homePage(ModelMap model){
		//set default category for loading news
		model.addAttribute("cid", 0);
		return "home";
	}
	
	@RequestMapping(value="/search")
	public String searchPage(ModelMap model, @RequestParam("key") String key){
		System.err.println("------------------------->>>>>>>>>>>key: "+key);
		model.addAttribute("cid", 0);
		model.addAttribute("key", key.replaceAll("@", "%"));
		return "home";
	}
	
	@RequestMapping(value="/detail/{id}")
	public String detailPage(ModelMap model, @PathVariable("id") int id){
		model.addAttribute("id", id);
		return  "detail";
	}
		
	@RequestMapping(value="/user/profile")
	public String savedPage(ModelMap model, Principal principal){
		
		if(principal == null)
			return "login";
		
		return "saved-news";
	}

	@RequestMapping(value={"/{cid}/category"})
	public String categoryPage(ModelMap model, @PathVariable("cid") int cid){
		model.addAttribute("cid", cid);
		return "home";
	}
	
	@RequestMapping(value="/login")
	public String loginPage(){
		return  "login";
	}

}
