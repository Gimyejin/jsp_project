<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />
	<c:set var="mem" value="${dao.myID(param.id) }" />


	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<h1>${param.id }님의개인정보</h1>
		<hr>
		id : ${mem.id }<br> pwd : ${mem.pwd }<br> name : ${mem.name }<br>
		addr : ${mem.addr }<br>
		<hr>
		<button type="button"
			onclick="location.href='memberCorrection.jsp?id=${mem.id}'">수정</button>
		<c:set var="session_id" value="${ mem.id}" scope="session" />
		<button type="button" onclick="location.href='delete.jsp'">삭제</button>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>