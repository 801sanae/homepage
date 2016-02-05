package com.bit.homepage.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.homepage.domain.GuestBook;

@Repository
public class GuestBookDao {
	
	@Autowired
	private SqlSession sqlSession;

	public GuestBookDao() {
		System.out.println(this.getClass());
	}

	public void delete(GuestBook guestBook) throws Exception {
		sqlSession.delete("guestbook.delete", guestBook);
	}

	public List<GuestBook> getList() throws Exception {
		List<GuestBook> list = sqlSession.selectList("guestbook.getList");
		return list;
	}

	public void insert(GuestBook guestBook) throws Exception {
		sqlSession.insert("guestbook.insert", guestBook);
	}
	
	
	
}
