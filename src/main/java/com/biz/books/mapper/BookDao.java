package com.biz.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.books.vo.BookVO;

public interface BookDao {

	@Select("SELECT * FROM tbl_books")
	public List<BookVO> selectAll();
	
	@Select("SELECT * FROM tbl_books WHERE b_id = #{b_id}")
	public BookVO findById(long b_id);
	
	@InsertProvider(type=BookSQL.class, method="book_insert_sql")
	public int insert(BookVO vo);
	
	@UpdateProvider(type=BookSQL.class, method="book_update_sql")
	public int update(BookVO vo);
	
	@Delete("DELETE FROM tbl_books WHERE b_id = #{b_id}")
	public int delete(long b_id);

	@Select("SELECT * FROM tbl_books WHERE b_userid = #{m_userid}")
	public List<BookVO> findByUserId(String m_userid);

	
}
