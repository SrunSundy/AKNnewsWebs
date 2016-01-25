package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping(value={"/", "/home"})
	public String homePage(ModelMap model){
		//set default category for loading news
		model.addAttribute("cid", 0);
		return "home";
	}
	
	@RequestMapping(value="/search/{key}")
	public String searchPage(ModelMap model, @PathVariable("key") String key){
		System.out.println(key);
		model.addAttribute("cid", 0);
		model.addAttribute("key", key);
		return "home";
	}
	
	@RequestMapping(value="/detail/{id}")
	public String detailPage(ModelMap model, @PathVariable("id") int id){
		model.addAttribute("id", id);
		return  "detail";
	}
	
	@RequestMapping(value={"/{uid}/saved"})
	public String savedPage(ModelMap model, @PathVariable("uid") int uid){
		model.addAttribute("uid", uid);
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
