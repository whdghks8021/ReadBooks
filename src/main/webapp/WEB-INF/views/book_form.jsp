<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<style>
label {
	
	display: block;
	width: 100px;
	float: left;
	
	padding: 8px;
	text-align: right;
	
	font-weight: bold;
	color: #009688;
	font-size: 11pt;
}

input, textarea {
	margin: 3px;	
	padding: 8px;
	border: 1px solid #ccc;
	display: inline-block;
	width: 85%;
}

#btn_delete {
	margin: 2px ;
	background-color: darkgray;
	font-size: 12pt;
	padding: 3px ;
	border: 1px solid black;
}
#btn_delete:hover {
	background-color: gray;
	cursor: pointer;
	
}
</style>

<section>
	<form action="<c:url value='/books_save'/>" method="POST" >
	
		<input type="hidden" name="b_id" value=<c:out value="${BOOKS.b_id}" default="0" />  >
		<label for="b_userid">USERID</label>
		<input value="${LOGIN_INFO.m_userid}" readonly id="b_userid" name="b_userid"><br/>
		
		<label for="b_isbn">도서코드</label>
		<input value="${BOOKS.b_isbn}" id="b_isbn" name="b_isbn"><br/>
		
		<label for="b_title">도서제목</label>
		<input value="${BOOKS.b_title}" id="b_title" name="b_title"><br/>
		
		<label for="b_date">독서일자</label>
		<input value="${BOOKS.b_date}" type="date" id="b_date" name="b_date"><br/>
		
		<label for="b_star">별점</label>
		<input value="${BOOKS.b_star}" type="text" id="b_star" name="b_star"><br/>
		
		<label for="b_text">독서록</label>
		<textarea rows="5" id="b_text" name="b_text">${BOOKS.b_text}</textarea><br/>
		
		<hr />
		<label></label>
		<button>독서록저장</button>
		<a id="btn_delete">독서록삭제</a>
	</form>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$("#btn_delete").click(function(){
	let id = ${BOOKS.b_id}
	if(confirm("게시물을 삭제할까요?")) {
		location.href = "<c:url value='/delete'/>" + "?id=" + id
	}
	
})
</script>