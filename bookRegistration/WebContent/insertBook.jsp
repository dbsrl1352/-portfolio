<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<style type="text/css">
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
BookDAO instance = BookDAO.getInstance();//instacne 연결 
int bcode = instance.getMaxCode(); //bcode 중 제일 큰값에 +1 해서 가져오기
%>
<br><br>
<!-- insert.do로 실행하기 -->
<form action="insertBook.do">
<table border="1" style="text-align: center;">
<tr><th>도서코드</th><td><input type="text" name="bcode" value="<%=bcode%>" readonly> </td></tr> <!-- bcode 넣고 readonly로 바꿀 수 없게 한다 -->
<tr><th>도서제목</th><td><input type="text" name="btitle" required> </td></tr>
<tr><th>도서저자</th><td><input type="text" name="bwriter" required> </td></tr>
<tr><th>출판사코드</th><td>
<select name="bpub"  required>
	<option value="1001">양영디지털</option>
	<option value="1002">북스미디어</option>
	<option value="1003">한빛아카데미</option>
	<option value="1004">이지스</option>
</select>
</td></tr>
<tr><th>가격</th><td><input type="text" name="bprice" required> </td></tr>
<tr><th>출간날짜</th><td><input type="text" name="bdate" placeholder="2019-07-22" required> </td></tr> <!-- 2010-07-22 이런 형태로 작성해야 함 -->
<tr><td colspan="2"><input type="submit" value="등록"><input type="reset" value="재작성"></td> </tr>
</table>
</form>
<br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>