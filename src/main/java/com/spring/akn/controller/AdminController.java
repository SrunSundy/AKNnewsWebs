package com.spring.akn.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
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

		return "admin/dashboard";

	}
     
	@RequestMapping(value="/admininfo",method=RequestMethod.GET)
	public String adminInfor() {
		return "admin/admin";
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

	
	@RequestMapping(value="/updatearticle")
	public String toUpdateArticle(ModelMap model){
		
		model.addAttribute("newsid", 0);
		return  "admin/updatearticle";
	}
	
	@RequestMapping(value="/updatearticle" , method = RequestMethod.POST)

	public String toUpdateArticle(ModelMap model,@RequestParam("newsid") int id,@RequestParam("newscate") String cate){
		
		model.addAttribute("newsid", id);
		System.err.println(cate);
		System.err.println(id);
		model.addAttribute("newscate", cate);
		return  "admin/updatearticle";
	}
	
	@RequestMapping(value ="/user")
	public String toUser() {
		return "admin/user";
	}
	
	@RequestMapping(value ="/scrap")
	public String scrapPage() {
		return "admin/scrap";
	}
	
	@RequestMapping(value ="/testscrap")
	public String testScrapPage() {
		return "admin/testscrap";
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
	
	@RequestMapping(value ="/setting")
	public String toSetting() {
		return "admin/setting";
	}

}
