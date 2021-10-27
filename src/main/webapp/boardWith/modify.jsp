<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardWithDAO" />
	${dao.modify(param.name, param.id, param.title, param.content) }
	<c:redirect url="content_view.jsp?id=${param.id }"/>
</body>
</html>