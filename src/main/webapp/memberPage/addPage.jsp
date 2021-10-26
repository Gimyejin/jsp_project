<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form label{width: 120px;display: inline-block;
			padding: 7px 0; vertical-align: top;}
</style>
<script type="text/javascript">
	function check(){
		if (document.getElementById('id').value == "") {
			alert("아이디는 필수 사항입니다.");
		}else if(document.getElementById('pwd').value == ""){
			alert("비밀번호는 필수 사항입니다.");
		}else if(document.getElementById('name').value == ""){
			alert("이름은 필수 사항입니다.");
		} else {form.submit();}
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap" style="margin-top: 40px; text-align: center;">
		<form action="${contextPath }/memberPage/register.jsp" method="post" name="form">
				<label>아이디</label><input type="text" name="id" id="id"><br>
				<label>패스워드</label><input type="password" name="pwd" id="pwd"><br>
				<hr style="width: 400px; margin-top:20px;margin: auto;margin-bottom: 20px">
				<label>이름</label><input type="text" name="name" id="name"><br>
				<label>주소</label><input type="text" name="addr" id="addr"><br>
				<br>
				<input type="button" value="전 송" style="float: right;right: 200px;" onclick="check()">
			</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>