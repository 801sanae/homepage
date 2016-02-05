package com.bit.homepage.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.homepage.domain.Board;
import com.bit.homepage.domain.User;
import com.bit.homepage.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	int pageUnit=3;

	int pageSize=3;
	
	@Autowired
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/delete")
	public String delete(@ModelAttribute("board") Board boardvo) throws Exception{
		
		System.out.println(boardvo.getNo());
		
		Board board = boardService.getView(boardvo);
		
		boardService.delete(board);
		return "redirect:/post";
	}
	
	@RequestMapping("/view")
	public String view(@ModelAttribute("board") Board boardvo, HttpServletRequest req, Model model) throws Exception{
		
		System.out.println("view:"+boardvo.getNo());
		
		Board board = boardService.getView(boardvo);
		
		boardService.updateViewCnt(board);

		model.addAttribute("board", board);
		
		return "view";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm(@ModelAttribute("board") Board board) throws Exception{
		return "/writeForm";
	}
	
	@RequestMapping("/insert")
	public String insert(@ModelAttribute("board") Board board,
			HttpSession session) throws Exception{
		User user = (User)session.getAttribute("authUser");
		
		System.out.println(user);
		
		board.setMember_no(user.getNo()); board.setMember_name(user.getName());

		System.out.println(board);
		
		boardService.insert(board);
		
		return "redirect:/post";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(@ModelAttribute("board") Board board, 
			@RequestParam("no") long no, Model model) throws Exception{
		
		board.setNo(no);
		
		System.out.println(no+"::"+board);
		
		Board vo = boardService.getView(board);
		
		model.addAttribute("board", vo);
		
		return "updateForm";
	}
	
	@RequestMapping("/update")
	public String update( 
			@ModelAttribute("board") Board board, Model model) throws Exception{
		
		System.out.println("update before:"+board);
		
		boardService.update(board);
		Board vo = boardService.getView(board);
		
		model.addAttribute("board", vo);
		
		return "/view";
	}
}
