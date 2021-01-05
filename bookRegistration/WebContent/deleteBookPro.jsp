<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<%
	int bcode = Integer.parseInt(request.getParameter("bcode"));
	//bcode 받아오기

	BookDAO instance = BookDAO.getInstance(); //instance를 사용하기 위해
	
	int check = instance.deleteBook(bcode); //deleteBook 실행시켜서 결과값 받아오기
	
	if(check == 1){//삭제 성공하면
		%>
		<!-- 삭제 후 완료 문자 띄우고 목록으로 돌아가기 -->
		<script type="text/javascript">
		alert('도서 삭제 완료');
		location.href='selectBook.do';
		</script>
		<%
	} else {
		%>
		<!-- 실패 문자 띄우고 목록으로 돌아가기 -->
		<script type="text/javascript">
		alert('도서 삭제 실패');
		location.href='selectBook.do';
		</script>
		<%
	}
%>
</body>
</html>