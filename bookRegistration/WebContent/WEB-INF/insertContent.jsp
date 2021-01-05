<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form action="insertContentPro.jsp">
	<table border="1">
	<tr><th>제목</th><td><input type="text" name="title"> </td></tr>
	<tr><th>내용</th><td><textarea rows="15" cols="50" name="content"></textarea> </td></tr>
	</table>
	<br>
	<input type="submit" value="작성" style="width: 70px; height:40px; ">
		</form>
</body>
</html>