package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping(value={"/admin/addarticle", })
	public String toAddArticle(ModelMap model){
		model.addAttribute("message", "hello world");
		return  "admin/insertarticle";
	}
}
