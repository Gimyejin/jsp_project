<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap" style="text-align: center;"><h1>로그인 화면</h1></div>
		<div class="wrap" style="text-align: right; margin-top: 20px;">
			<div class="page_input">
			<form action="loginChk.jsp" method="post">
					<div id="input">
						<input type="text" placeholder="아이디" name="id"><br>
						<input type="password" placeholder="비밀번호" name="pwd"><br>
						<label><a href="${contextPath }/memberPage/addPage.jsp">회원가입</a></label>
					</div>
					<div>
						<input type="submit" value="로그인" class="btn">
					</div>
				
			</form>
			</div>
		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>