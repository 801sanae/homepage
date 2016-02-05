package com.bit.homepage.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.homepage.domain.User;
import com.bit.homepage.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("signup")
	public String signup(){
		return "signup";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute User user) throws Exception{
		userService.join(user);
		System.out.println("된겨");
		return "redirect:/index";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, @ModelAttribute User user,
			@RequestParam("email") String email,
			@RequestParam("password") String password
			) throws Exception{
		System.out.println(email+"/"+password);
		System.out.println(user);
		User authUser=userService.login(user);
		System.out.println("::login="+authUser);
		
		if(user.getEmail().equals(authUser.getEmail())){
			session.setAttribute("authUser", authUser);			
		}
		
		return "redirect:/index";
	}
	
	@ResponseBody
	@RequestMapping("/chkemail")
	public Object checkEmail(@RequestParam(value="email", required=true, defaultValue="") String email){
		System.out.println(email);
		
		User vo =userService.getUser(email);
		
		System.out.println(vo);
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("result", "success");
		map.put("message", "null");
		map.put("data", vo==null);
		
		return map;
	}
	
}
