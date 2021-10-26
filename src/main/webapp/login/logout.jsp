<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그아웃 페이지</h1>
	<%-- <%
	session.removeAttribute("userid");
	//session.invalidate();	%> --%>
	<script type="text/javascript">
		alert('${userid}님 로그아웃 되었습니다')
		location.href="${contextPath}/default/main.jsp"
	</script>
	<c:remove var="userid" scope="session"/>
</body>
</html>