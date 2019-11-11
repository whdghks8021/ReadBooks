package com.biz.books.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberVO {
	
	private String m_userid;  
	private String m_password; 
	private String m_name;     
	private String m_tel;
	private String m_addr;
	private String m_role;
	
}
