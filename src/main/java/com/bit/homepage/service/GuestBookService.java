package com.bit.homepage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.homepage.domain.GuestBook;
import com.bit.homepage.repository.GuestBookDao;

@Service
public class GuestBookService {
	
	@Autowired
	private GuestBookDao guestBookDao;
	
	public GuestBookService() {
		System.out.println(this.getClass());
	}

	public void delete(GuestBook guestBook) throws Exception {
		guestBookDao.delete(guestBook);
	}

	public void insert(GuestBook guestBook) throws Exception {
		guestBookDao.insert(guestBook);
	}

	public List<GuestBook> getList() throws Exception {
		List<GuestBook> list = guestBookDao.getList();
		return list;
	}

}
