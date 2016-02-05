package com.bit.homepage.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.homepage.domain.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public UserDao() {
		System.out.println(this.getClass());
	}

	public void join(User user) throws Exception {
		sqlSession.insert("user.insert", user);
	}

	public User get(String email, String password) throws Exception {
		Map<String, Object> map = new ConcurrentHashMap<>();
		map.put("email", email);
		map.put("password", password);
		
		User user = sqlSession.selectOne("user.getbyEmailAndPassword", map);
		
		return user;
	}

	public User get(String email) {
		User vo = sqlSession.selectOne("user.selectByEmail", email);
		return vo;
	}
}
