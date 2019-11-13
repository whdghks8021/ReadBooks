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
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.books.service.MemberService;
import com.biz.books.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	MemberService mService;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(Model model) {
		
		model.addAttribute("BODY","LOGIN");
		return "home" ;
	}
	
	
	/*
	 * 로그인, 로그아웃을 처리할 method에는 
	 * HttpSessio 클래스를 매개변수로 설정 해 두어야 한다.
	 */
	@RequestMapping(value="login-check",method=RequestMethod.POST)
	public String login(HttpSession session, 
				@ModelAttribute MemberVO memberVO,
				Model model) {

		// memberVO에는 로그인 폼에서 
		// 입력한 id와 비밀번호만 담겨 있을 것이다.
		String userid = memberVO.getM_userid();
		String password = memberVO.getM_password();
		
		// userid로 DB 조회를 해서 사용자 정보를 추출
		List<MemberVO> mList = mService.loginCheck(userid);
		// mList에는 userid에 해당하는 사용자(들)이 포함되있다.
		boolean login_ok = false;
		if(mList != null) {
			for(MemberVO vo : mList) {
				
				// 로그인 폼에서 입력한 비밀번호와 DB에 저장된 비밀번호를 비교
				if(password.equalsIgnoreCase(vo.getM_password())) {
					login_ok = true;
					memberVO = vo;
					break;
				}
			}
			
			if(login_ok) {
				
				// 이 프로젝트가 서버에서 실행되고 있는 동안에
				// 같은 웹브라우저 페이지에서
				// req, res 중일때 어디에서나
				// LOGIN이라는 변수를 통해서 memberVO내용을 조회 할 수 있게된다.
				session.setAttribute("LOGIN_INFO", memberVO);
				model.addAttribute("LOGIN_MSG","SUCCESS");
			} else {
				model.addAttribute("LOGIN_MSG","FAIL");
			}
		} 
		model.addAttribute("BODY","LOGIN");
		return "home";
	}
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		// 혹시모를 시스템에서 사용하는 세션 정보가 있을경우에
		// login 정보만 삭제를 한다.
		session.setAttribute("LOGIN_INFO", null); // 값을 null 해서 삭제된것처럼
		session.removeAttribute("LOGIN_INFO"); // 값을 아예 삭제
		session.invalidate(); // 모든 session 정보를 삭제
		return "redirect:/" ;
	}
	

	@RequestMapping(value="join",method=RequestMethod.GET)
	public String join(Model model) {
		
		model.addAttribute("BODY","JOIN");
		return "home";
	
	}

	@RequestMapping(value="joininsert",
			method=RequestMethod.POST,
			produces="text/plan;charset=utf8")	
	public String join(@ModelAttribute MemberVO memberVO) {

		log.debug(memberVO.toString());
		
		mService.insert(memberVO);
		return "home";
		
	}
	
	@ResponseBody
	@RequestMapping(value="id_check",
		method=RequestMethod.POST,
		produces="text/html;charset=utf8")
	public String id_check(@RequestParam String m_userid) {
		String ret = "";
		
		MemberVO vo = mService.findById(m_userid);
		
		if(vo == null) ret = "사용할 수 있는 ID 입니다";
		else ret = "이미 등록된 ID 입니다";
		return ret;
	}
	

	
}