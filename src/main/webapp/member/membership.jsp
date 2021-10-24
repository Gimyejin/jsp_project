<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mine{text-decoration: none;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	
	<c:set var="list" value="${dao.getMemberList() }"/>
	<!-- ArrayList<MemberDTO> list = dao.getMemberList(); -->
	<!-- dao안에 있는 getmemberlist라는 메소드를 호출함 // list에는 getmemberlist의 값이 들어갈것-->
	<div class="wrap">
		리턴 값 : ${list }
		<table border="1">
			<tr>
				<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th>
			</tr>
			<c:forEach var="member" items="${list }">
				<tr>
					<td>${member.id }</td>
					<td>${member.pwd }</td>
					<c:set var="myid" value="${member.id }"/>
					<td><a href="myPage.jsp?id=${myid }" class="mine" >${member.name }</a></td>
					<td>${member.addr }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><button type="button" onclick="location.href='${contextPath}/member/member_register.jsp'">등록</button></td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>