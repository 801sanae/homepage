package com.bit.homepage.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.homepage.domain.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	public BoardDao() {
		System.out.println(this.getClass());
	}

	public List<Board> getList() {
		List<Board> list = sqlSession.selectList("board.getList");
		return list;
	}
	
	public void delete(Board board) throws Exception {
		sqlSession.delete("board.delete", board);
	}

	public void insert(Board board) throws Exception {
		sqlSession.insert("board.insert", board);
	}

	public Board getView(Board boardvo) throws Exception{
		
		Board board = sqlSession.selectOne("board.getView", boardvo);
		
		System.out.println("dao:"+board);
		return board;
	}

	public void update(Board board) throws Exception{
		sqlSession.update("board.update", board);
	}

	public void updateViewCnt(Board board) throws Exception {
		sqlSession.update("board.updateViewCnt", board);
	}
	
	
}
