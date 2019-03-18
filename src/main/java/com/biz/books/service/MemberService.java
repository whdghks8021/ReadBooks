package com.biz.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.books.mapper.MemberDao;
import com.biz.books.vo.MemberVO;


@Service
public class MemberService {
	
	@Autowired
	MemberDao dao;

	public void insert(MemberVO memberVO) {
		
		dao.insert(memberVO);
	}

	public MemberVO findById(String m_userid) {

		return dao.findById(m_userid);
	}

	public List<MemberVO> loginCheck(String userid) {
		
		List<MemberVO> mList = dao.loginCheck(userid);
		return mList;
	}
}
