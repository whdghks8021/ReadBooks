package com.biz.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.books.mapper.BookDao;
import com.biz.books.vo.BookVO;

@Service
public class BookService {

	@Autowired
	BookDao bDao;
	
	public List<BookVO> selectAll() {
		
		return bDao.selectAll(); 
	}

	public int insert(BookVO bookVO) {
		
		return bDao.insert(bookVO);
	}

	public BookVO findById(long b_id) {
		
		return bDao.findById(b_id);
	}

	public int update(BookVO bookVO) {
		
		return bDao.update(bookVO);
	}

	public List<BookVO> findByUserId(String m_userid) {
		
		return bDao.findByUserId(m_userid);
	}

}
