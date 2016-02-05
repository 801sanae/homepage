package com.bit.homepage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.homepage.domain.Board;
import com.bit.homepage.domain.GuestBook;
import com.bit.homepage.domain.User;
import com.bit.homepage.service.BoardService;
import com.bit.homepage.service.GuestBookService;
import com.bit.homepage.service.UserService;

@Controller
public class MainController {

	@Autowired
	private GuestBookService guestBookService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	public MainController() {
		System.out.println(this.getClass());
	}

	
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("about")
	public String about(HttpServletRequest request) throws Exception{
		System.out.println(guestBookService.getList());
		List<GuestBook> list =guestBookService.getList();
		
		request.setAttribute("list", list);
		
		return "about";
	}
	
	@RequestMapping("post")
	public String post(HttpServletRequest req,
			HttpSession session) throws Exception{
		System.out.println(boardService.getList());
		
		User authUser = (User)session.getAttribute("authUser");
		
		List<Board> list = boardService.getList();
		req.setAttribute("list", list);
		
		req.setAttribute("authUser", authUser);
		
		return "post";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/index";
	}
	
}
