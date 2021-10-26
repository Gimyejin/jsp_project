<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />
	<c:set var="mem" value="${dao.myID(param.id) }" />
	<c:choose>
		 <c:when test="${mem.id !=null and mem.pwd == param.pwd }">
			<script type="text/javascript">
				alert('로그인 성공')
				location.href="../default/main.jsp"
			</script>
			<c:set var="userid" value="${mem.id }" scope="session"/>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${mem.id != param.id }">
					<script type="text/javascript">
					alert('등록되지 않은 아이디입니다.')
					location.href="login.jsp"
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						alert('비밀번호가 일치하지 않습니다.')
						location.href="login.jsp"
					</script>
				</c:otherwise>
			</c:choose>
		</c:otherwise> 
	</c:choose>
	
	
</body>
</html>