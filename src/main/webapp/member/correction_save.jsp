<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="com.care.root.member.dto.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />

	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />

	<c:choose>
		<c:when test="${dao.update(dto)==1 }">
		<script type="text/javascript">
			alert('수정 성공')
			location.href = "myPage.jsp?id=${dto.id}";
		</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('수정 실패')
				location.href = "myPage.jsp?id=${dto.id}";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>