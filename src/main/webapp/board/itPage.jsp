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
</head>
<body>
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO" />
	<c:set var="board" value="${dao.myList(context) }" />
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<form action="boardChk.jsp" method="get">
			<h3 id="user">
				<label>작성자:</label> ${userid }
			</h3>
			<input type="hidden" name="id" value="${userid }"> <br>
			<table>
				<tr>
					<td id="area">제목</td>
					<td><input type="text" name="title" style="width: 365px"
						value="${board.title }"></td>
				</tr>
				<tr>
					<td id="area">본문</td>
					<td><textarea rows="5px" cols="50px" name="context"
							value="${board.context }"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="업로드" style="margin-top: 10px">
		</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>