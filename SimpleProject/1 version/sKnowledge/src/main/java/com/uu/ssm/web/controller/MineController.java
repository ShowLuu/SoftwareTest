package com.uu.ssm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mine")
public class MineController {
	
	@RequestMapping("/LBS")
	public String Lbs(){
		return "/mine/application/LBS/show";
	}
	
	@RequestMapping("/pcenter/doc/doc_info")
	public String docInfo(){
		return "/mine/pcenter/doc/doc_info";
	}
	
	@RequestMapping("/doc_search")
	public String docSearch(){
		return "mine/pcenter/doc/doc_search";
	}
	
}
