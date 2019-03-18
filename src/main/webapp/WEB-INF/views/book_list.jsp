<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
table {
	border-collapse:collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ccc;
	
}

tr {
	border: 1px solid #ddd;
	
}

tr:nth-child(even) {
	background-color: #ccc;
}

tr:nth-child(odd) {
	background-color: #fff;
}

tr:hover {
	background-color: #ddd;
}

td {
	text-align: center;
}

td, th {
	padding: 8px 8px;
	vertical-align: top;
}

td:first-child, th:first-child {
	padding-left: 16px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	
	$(".book_tr").click(function(){
		
		let id = $(this).attr("data-id")
		$.ajax({
			url : "<c:url value='/books_update' />",
			method : "GET",
			data :{id:id},
			success:function(result){
				$("#body").html(result)
			}
		})
		
	})
	
	$("#btn_book").click(function(){
		
		$.ajax({
			url : "<c:url value='/books_write' />",
			method : "GET",
			success:function(result){
				$("#body").html(result)
			}
		})
		
	})
	
	
})

</script>
</head>
<body>

<table id="book_list">
<tr>
	<th>게시물번호</th>
	<th>UserID</th>
	<th>도서코드</th>
	<th>도서제목</th>
	<th>독서일자</th>
	<th>별점</th>
	
</tr>
<c:choose>
	<c:when test="${empty BOOKS}">
		<tr><td colspan=6>독서록이 없습니다</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${BOOKS}" var="book" varStatus="i">
		<tr class="book_tr" data-id="${book.b_id}">
			<td>${i.count}</td>
			<td>${book.b_userid}</td>
			<td>${book.b_isbn}</td>
			<td>${book.b_title}</td>
			<td>${book.b_date}</td>
			<td>${book.b_star}</td>
		</tr>
	</c:forEach>
	</c:otherwise>
	
</c:choose>

</table>

<button id="btn_book">독서록작성</button>

</body>
</html>