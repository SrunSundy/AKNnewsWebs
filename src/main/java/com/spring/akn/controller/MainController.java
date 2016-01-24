package com.spring.akn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(value="/admin/addarticle" )
	public String toAddArticle(ModelMap model){
		/*model.addAttribute("newsid", 0);*/
		return  "admin/insertarticle";

	}
	@RequestMapping(value="/login")
	public String loginPage(){
		return  "login";

	}


	@RequestMapping(value="/admin/updatearticle" )
	public String toUpdateArticles(ModelMap model){
	
		return  "admin/updatearticle";
	}
	
	@RequestMapping(value="/admin/updatearticle" , method = RequestMethod.POST)
	public String toUpdateArticle(ModelMap model,@RequestParam("newsid") int id,@RequestParam("newscate") String cate){
		
		model.addAttribute("newsid", id);
		System.err.println(cate);
		System.err.println(id);
		model.addAttribute("newscate", cate);
		return  "admin/updatearticle";
	}

}
