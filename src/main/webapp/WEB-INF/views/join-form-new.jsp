<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  background-image: url("https://images.unsplash.com/photo-1504814532849-cff240bbc503?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=968&q=80");

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

/* span 설정 */
#userid_error {
	width:70%;
	color:red;
	font-weight: bold;
	}
	
.userid_label {
	display: none;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn_join").click(function(){
		let m_userid = $("#m_userid").val()
		let m_password = $("#m_password").val()
		let m_re_password = $("#m_re_password").val()
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
		if(m_re_password == "") {
			alert("비밀번호를 한번더 입력하세요")
			$("#m_re_password").focus()
			return false;
		}
		if(m_password != m_re_password) {
			alert("비밀번호와 확인이 일치하지 않습니다")
			$("#m_password").val("")
			$("#m_re_password").val("")
			$("#m_password").focus()
			return false;
		}
		// $("form").submit()
		// alert("회원가입이 완료되었습니다.")
		// window.close();
		$.ajax({
			url : "<c:url value='/joininsert' />",
			method:"POST",
			data:$('form').serialize(),
			success:function(result) {
				alert("회원가입이 완료되었습니다.")
				location.href="<c:url value='/' />"
			},
			error:function(){
				alert("서버오류")
			}
		})
		
		
	
	})
	
	// input box에서 tab를 입력하거나
	// 다른 부분에 마우스를 클릭 했을때
	// 이벤트를 발생
	$("#m_userid").blur(function(event){
		
		event.preventDefault()
		
		let userid= $("#m_userid").val()

		if(userid == "") {
			// alert("아이디는 반드시 입력하세요")
			$("#userid_error").text("* 아이디를 입력하세요")
			// userid_label 클래스의 css 속성중에
			// display를 inline-block 설정하라
			
			// attr('display','inline-block')
			// prop('display','inline-block')
			// css('display','inline-block')
			$(".userid_label").css("display","inline-block")
			return false;
		}
		
		$.ajax({
			
			url : "<c:url value='id_check' />",
			method:"POST",
			data : {m_userid:userid},
			success:function(result) {
				$("#userid_error").html(result)
				$(".userid_label").css("display","inline-block")
			},
			error:function(){
				alert("서버오류")
			}
		})
	})
})

</script>	
<body>
<div class="bg-img">
  <div class="container">
  <form action="javascript:void(0)" method="POST" autocomplete="off">
    <h1 style="text-align:center;color:#001a1a;">Sign In</h1>

    <label for="m_userid"><b>ID</b></label>
    <input type="text" placeholder="Enter ID" name="m_userid" id="m_userid" required>

    <label for="m_password"><b>비밀번호</b></label>
    <input type="password" placeholder="Enter Password" name="m_password" id="m_password" required>

    <label for="m_re_password"><b>비밀번호확인</b></label>
    <input type="password" placeholder="Enter Password Again" id="m_re_password" name="m_re_password" required>

    <label for="m_name"><b>이름</b></label>
    <input type="text" placeholder="Enter Name" id="m_name" name="m_name" required>

    <label for="m_tel"><b>전화번호</b></label>
    <input type="text" placeholder="Enter phone-number" id="m_tel" name="m_tel" required>

    <label for="m_addr"><b>주소</b></label>
    <input type="text" placeholder="Enter address" id="m_addr" name="m_addr" required>

    <button type="submit" class="btn" id="btn_join">Login</button>
  </form>
</div>
</div>
</body>
</html>
