package com.biz.books.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.books.service.BookService;
import com.biz.books.vo.BookVO;
import com.biz.books.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {

	@Autowired
	BookService bService;
	
	@RequestMapping(value="books", method=RequestMethod.GET)
	public String readBook(Model model, HttpSession session) {
		MemberVO vo = (MemberVO)session.getAttribute("LOGIN_INFO");
		
		List<BookVO> bList = bService.findByUserId(vo.getM_userid());
		model.addAttribute("BOOKS",bList);
		model.addAttribute("BODY","LIST");
		return "home";
	}
	
	@RequestMapping(value="books_update", method=RequestMethod.GET)
	public String updateBook(@RequestParam long id, Model model) {
		
		BookVO vo = bService.findById(id);
		
		model.addAttribute("BOOKS",vo);
		model.addAttribute("BODY","WRITE");
		return "book_form";
	}
	
	@RequestMapping(value="books_write", method=RequestMethod.GET)
	public String writeBook(Model model) {
		
		model.addAttribute("BODY","WRITE");
		return "book_form";
	}
	
	@RequestMapping(value="books_save",
			method=RequestMethod.POST,
			produces="text/plan;charset=utf8")	
	public String booksave(@ModelAttribute BookVO bookVO, Model model) {

		log.debug(bookVO.toString());
		int ret ;
		if(bookVO.getB_id() > 0) {
			ret = bService.update(bookVO);
		} else {
			ret = bService.insert(bookVO);
		}
		
		if(ret < 0) {
			model.addAttribute("MSG","FAIL");
		} else {
			model.addAttribute("MSG","SUCCESS");
		}
		model.addAttribute("BODY","LIST");
		return "home";
		
	}
	
	
}
