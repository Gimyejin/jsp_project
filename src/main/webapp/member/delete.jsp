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
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<c:choose>
		<c:when test="${dao.delete(session_id) ==1}">
			<script type="text/javascript">
				alert('이용해주셔서 감사합니다.')
				location.href="${contextPath}/default/main.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('탈퇴에 실패하였습니다.')
				location.href="myPage.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>