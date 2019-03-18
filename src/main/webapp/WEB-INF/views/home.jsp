<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" 
	content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<%@ include file ="/WEB-INF/views/include/nav.jspf"  %>
<section id="body">
	<c:if test="${BODY == 'LIST' }" >
		<%@ include file="/WEB-INF/views/book_list.jsp" %>
	</c:if>
	<c:if test="${BODY == 'WRITE' }" >
		<%@ include file="/WEB-INF/views/book_form.jsp" %>
	</c:if>
	<c:if test="${BODY == 'LOGIN' }" >
		<%@ include file="/WEB-INF/views/login-form-new.jsp" %>
	</c:if>
	<c:if test="${BODY == 'JOIN' }" >
		<%@ include file="/WEB-INF/views/join-form-new.jsp" %>
	</c:if>
	
	
</section>
<footer>
	<address>CopyRight &copy; whdekf8021@naver.com</address>
</footer>
</body>
</html>
