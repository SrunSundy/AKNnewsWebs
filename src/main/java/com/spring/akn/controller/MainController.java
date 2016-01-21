package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	
	/*@RequestMapping(value={"/", "/home"})
	public String homePage(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "home";
	}*/
	
	@RequestMapping(value={"/admin", })
	public String homePage(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "admin/index";
	}
	@RequestMapping(value={"/admin/article", })
	public String toArticle(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "admin/article";
	}
	@RequestMapping(value="/admin/addarticle" )
	public String toAddArticle(ModelMap model){
		model.addAttribute("newsid", 0);
		return  "admin/insertarticle";
	}
	@RequestMapping(value="/admin/addarticle" , method = RequestMethod.POST)
	public String toAddArticle(ModelMap model,@RequestParam("newsid") int id){
		System.err.println(id);
		model.addAttribute("newsid", id);
		return  "admin/insertarticle";
	}
}
