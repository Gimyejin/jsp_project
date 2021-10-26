<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav {
	background-color: #569999;
	color: white;
	height: 30px
}

#title {
	width: 200px
}

#context {
	width: 650px;
}

#readID {
	width: 150px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />
	<jsp:useBean id="boardDao" class="com.care.root.board.dao.BoardDAO" />
	<c:set var="list" value="${dao.getMemberList() }" />
	<c:set var="boardList" value="${boardDao.allList() }" />

	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<table border="1">
			<caption>
				<h1>게시판</h1>
			</caption>
			<tr class="nav">
				<th id="title">제목</th>
				<th id="context">내용</th>
				<th id="readID">작성자</th>
			</tr>
			<c:forEach var="board_text" items="${boardList }">
				<tr>
					<td><a
						href="${contextPath }/board/itPage.jsp?context=${board_text.context}">${board_text.title }</a></td>
					<td><a
						href="${contextPath }/board/itPage.jsp?context=${board_text.context}">${board_text.context }</a></td>
					<td><a href="${contextPath }/memberPage/myPage.jsp">${board_text.id }</a></td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" onclick="location.href='boardInput.jsp'"
			value="작성하기">
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>