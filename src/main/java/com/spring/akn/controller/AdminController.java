package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String adminDashbord() {
		return "admin/user";
	}
     
	@RequestMapping(value="/article" )
	public String toArticle(ModelMap model){
		return  "admin/article";
	}
	
	@RequestMapping(value="/addarticle" )
	public String toAddArticle(ModelMap model){
		model.addAttribute("newsid", 0);
		return  "admin/insertarticle";
	}
	
	@RequestMapping(value="/addarticle" , method = RequestMethod.POST)
	public String toAddArticle(ModelMap model,@RequestParam("newsid") int id){
		System.err.println(id);
		model.addAttribute("newsid", id);
		return  "admin/insertarticle";
	}
	
	@RequestMapping(value ="/user")
	public String toUser() {
		return "admin/user";
	}
	
	@RequestMapping(value ="/category")
	public String toCategory() {
		return "admin/category";
	}
	
	@RequestMapping(value ="/site")
	public String toSite() {
		return "admin/site";
	}
	
	@RequestMapping(value ="/sitedetail")
	public String toSiteDetail() {
		return "admin/sitedetail";
	}

}
