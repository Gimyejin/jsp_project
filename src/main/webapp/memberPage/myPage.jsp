<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form label {
	width: 120px;
	display: inline-block;
	padding: 7px 0;
	vertical-align: top;
	left: 300px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${userid ==null }">
			<script type="text/javascript">
				alert('로그인이 필요합니다.')
				location.href = "${contextPath}/login/login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<c:import url="../default/header.jsp" />

			<div class="wrap">
				<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />
				<c:set var="mem" value="${dao.myID(userid) }" />
				<form action="change.jsp" method="post">
					<h1 style="text-align: center;">${userid }님의페이지</h1>
					<input type="hidden" name="id" value="${userid }"><br>
					<label>아이디</label> <label><b>${mem.id }</b></label><br> <label>비밀번호</label>
					<input type="text" name="pwd" value=${mem.pwd }><br> <label>이
						름</label><input type="text" name="name" value=${mem.name }><br>
					<label>주 소</label><input type="text" name="addr" value=${mem.addr }><br>
					<input type="submit" value="수 정"> <input type="button"
						onclick="location.href='delete.jsp'" value="탈 퇴"> <input
						type="button" onclick="history.back()" value="뒤 로">
				</form>
			</div>

			<c:import url="../default/footer.jsp" />
		</c:otherwise>
	</c:choose>

</body>
</html>