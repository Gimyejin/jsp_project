<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<jsp:useBean id="dto" class="com.care.root.member.dto.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="result" value="${dao.register(dto) }"/>
	<c:choose>
		<c:when test="${result ==1 }">
			<script type="text/javascript">
				alert('회원가입 성공')
				location.href="${contextPath}/default/main.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('회원가입 실패')
				location.href="${contextPath}/memberPage/addPage.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>