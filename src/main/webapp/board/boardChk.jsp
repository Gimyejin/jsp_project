<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="boardDao" class="com.care.root.board.dao.BoardDAO" />
	<jsp:useBean id="boardDto" class="com.care.root.board.dto.BoardDTO" />
	<jsp:setProperty property="*" name="boardDto" />
	<c:set var="result" value="${boardDao.insert(boardDto) }" />
	<c:choose>
		<c:when test="${result ==1 }">
			<script type="text/javascript">
				alert('업로드 성공')
				location.href = "${contextPath}/board/boardView.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('업로드 실패')
				location.href = "${contextPath}/board/boardView.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>