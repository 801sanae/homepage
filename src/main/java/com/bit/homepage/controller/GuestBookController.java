package com.bit.homepage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.homepage.domain.GuestBook;
import com.bit.homepage.service.GuestBookService;


@Controller
@RequestMapping("guestbook")
public class GuestBookController {

	@Autowired
	private GuestBookService guestBookService;
	
	public GuestBookController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="test", produces="application/json; charset=utf8") //한글깨질때
	@ResponseBody
	public String test(){
		return "ㅅㅂ";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request) throws Exception{
		System.out.println(guestBookService.getList());
		List<GuestBook> list =guestBookService.getList();
		
		request.setAttribute("list", list);
		
		return "/guestbook/list";
	}
	
	@RequestMapping("/insert")
	public String insert(
			@ModelAttribute("guestbook") GuestBook guestBook,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("content") String content,
			HttpServletRequest request)throws Exception{

		System.out.println(guestBook.getName()+"/"+guestBook.getPassword()+"/"+guestBook.getMessage());
		
		System.out.println(name+"/"+password+"/"+content+"/"+request.getParameter("content"));
		
		guestBook.setName(name); guestBook.setPassword(password); guestBook.setMessage(content);
		System.out.println("insert = "+guestBook);
		guestBookService.insert(guestBook);
		
		return "redirect:/about";
	}
	
	@RequestMapping("form")
	public String form(){
		return "/deleteform";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, @ModelAttribute GuestBook guestBook) throws Exception{
		
		System.out.println(request.getParameter("no"));
		
		guestBook.setPassword(request.getParameter("password"));
		
		guestBookService.delete(guestBook);
		
		return "redirect:/about";
	}
	
}
