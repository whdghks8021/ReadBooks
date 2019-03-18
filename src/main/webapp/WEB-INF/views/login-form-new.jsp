<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Nova+Flat" rel="stylesheet">
<style>
body, html {
  height: 100%;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

.bg-img {
  /* The image used */
  background-image: url("https://images.unsplash.com/photo-1515060939377-d73d9c162a66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1034&q=80");

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  padding:30px;
}

/* Add styles to the form container */
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 30px;
  max-width: 400px;
  padding: 16px;
  padding-top: 20px;
  background-color: white;
  opacity: 0.9;
  font-family: 'Nova Flat', cursive;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  font-family: 'Nova Flat', cursive;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
  font-family: 'Nova Flat', cursive;
}

/* Set a style for the submit button */
.btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  font-family: 'Nova Flat', cursive;
}

.btn:hover {
  opacity: 1;
}

	.btn-login {
		background-color: green;
		color:yellow;
		font-size : 20px;
		font-weight: bold;
	}
	
	.error-box {
		display: none;
	}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn-login").click(function(){
		let m_userid = $("#m_userid").val()
		let m_password = $("#m_password").val()
		if(m_userid == "") {
			alert("id(email)을 반드시 입력하세요")
			$("#m_userid").focus();
			return false;
		}
		if(m_password == "") {
			alert("비밀번호를 반드시 입력하세요")
			$("#m_password").focus()
			return false;
		}
		$("form").submit()
		
	})
	
	// 컨트롤러에서 보낸 LOGIN_MSG 변수에 에 문자열 FAIL이 담겨 있으면
	if("${LOGIN_MSG}" == "FAIL") {
		alert("존재하지 않는 아이디거나 비밀번호가 다릅니다.")
	}
	if("${LOGIN_MSG}" == "ADMIN FAIL") {
		alert("관리자로 로그인해주세요.")
	}
	if("${LOGIN_MSG}" == "SUCCESS") {
		alert("${LOGIN_INFO.m_name} 님 환영합니다.")
	}
	
})

</script>	
<body>
<div class="bg-img">
  <div class="container">
  <form action="<c:url value='/login-check' />" method="POST" autocomplete="off">
    <h1 style="text-align:center;color:#001a1a;">Log In</h1>

    <label for="m_userid"><b>ID</b></label>
    <input type="text" placeholder="Enter ID" id="m_userid" name="m_userid" required>

    <label for="m_password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" id="m_password" name="m_password" required>

    <button type="submit" class="btn" id="btn_login">Login</button>
  </form>
</div>
</div>
</body>
</html>