package com.biz.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.biz.books.vo.MemberVO;


public interface MemberDao {
	
	@Select("SELECT * FROM tbl_bookmember")
	public List<MemberVO> selectAll();
	
	@Select("SELECT * FROM tbl_bookmember WHERE m_userid = #{m_userid}")
	public MemberVO findById(String m_userid);
	
	@Insert("INSERT INTO tbl_bookmember(m_userid, m_password, m_name, m_tel, m_addr) VALUES(#{m_userid}, #{m_password}, #{m_name}, #{m_tel}, #{m_addr})")
	public int insert(MemberVO vo);
	
	@Update("UPDATE tbl_bookmember SET m_password = #{m_password}, m_name = #{m_name}, m_tel = #{m_tel}, m_addr = #{m_addr} WHERE m_userid = #{m_userid}")
	public int update(MemberVO vo);
	
	@Delete("DELETE FROM tbl_bookmember WHERE m_userid=#{m_userid}")
	public int delete(String m_userid);

	@Select("SELECT * FROM tbl_bookmember WHERE m_userid = #{m_userid}")
	public List<MemberVO> loginCheck(String m_userid);
}

