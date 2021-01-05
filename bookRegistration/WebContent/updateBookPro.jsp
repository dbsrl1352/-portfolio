<%@page import="book.BookDAO"%>
<%@page import="book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	int bcode = Integer.parseInt(request.getParameter("bcode")); //bcode 받기
	String btitle = request.getParameter("btitle");//btitle 받기
	String bwriter = request.getParameter("bwriter");//bwriter 받기
	int bpub = Integer.parseInt(request.getParameter("bpub"));//bpub 받기
	int bprice = Integer.parseInt(request.getParameter("bprice"));//bprice 받기
	String bdate = request.getParameter("bdate");//bdate 받기
	
	BookVO vo = new BookVO(bcode,btitle, bwriter, bpub, bprice, bdate); //vo 생성자로 생성
	
	BookDAO instance = BookDAO.getInstance(); //instance 연결
	int check = instance.updateBook(vo); // updateBook메서드 실행시키고 결과값 반환
	
	if(check > 0){ //check가 0보다 크면 수정 성공
		//수정 성공 메세지 띄운 후 목록으로 돌아가기
		%>
		<script type="text/javascript">
		alert('도서 정보 수정 성공');
		location.href='selectBook.do';
		</script>
		<%
	} else {// check가 0이거나 0보다 작으면 수정 실패
		//수정 실패 메세지 띄운 후 목록으로 돌아가기
		%>
		<script type="text/javascript">
		alert('도서 정보 수정 실패');
		location.href='selectBook.do';
		</script>
		<%
	}
%>
</body>
</html>