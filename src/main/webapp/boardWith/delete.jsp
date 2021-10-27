<%@page import="com.care.root.board.dao.BoardWithDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardWithDAO dao = new BoardWithDAO();
		int result = dao.delete(request.getParameter("id"));
		//response.sendRedirect("list.jsp");
		if(result==1){
			out.print("<script type='text/javascript'>alert('삭제 성공');"+
					"location.href='list.jsp'</script>");
		}else {
			out.print("<script type='text/javascript'>alert('삭제 실패');"+
					"location.href='list.jsp'</script>");
		}
		
	%>
	<%-- 	if(result ==1){	%>
			<script type="text/javascript">
				alert('삭제 성공');
				location.href="list.jsp"
			</script>
		<%}else{ %>
		<%} %> --%>
	<%-- 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardWithDAO"/>
	${dao.delete(param.id)}
	<c:redirect url="list.jsp"/> 
	--%>
</body>
</html>