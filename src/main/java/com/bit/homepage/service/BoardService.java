package com.bit.homepage.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.homepage.domain.Board;
import com.bit.homepage.repository.BoardDao;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;

	public BoardService() {
		System.out.println(this.getClass());
	}

	public List<Board> getList()  throws Exception{
		List<Board> list = boardDao.getList();
		return list;
	}
	
	public void insert(Board board)throws Exception{
		boardDao.insert(board);
	}
	
	public void delete(Board board)throws Exception{
		boardDao.delete(board);
	}

	public Board getView(Board board)throws Exception {
		Board vo = boardDao.getView(board);
		
		System.out.println("service:"+vo);
		
		return vo;
	}

	public void update(Board board) throws Exception{
		boardDao.update(board);
	}

	public void updateViewCnt(Board board) throws Exception{
		boardDao.updateViewCnt(board);
	}
	
	
	
}
