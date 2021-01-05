<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<style type="text/css">
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
<%
	int bcode = Integer.parseInt(request.getParameter("bcode"));
	//bcode 받아오기
%>
<script type="text/javascript">
	let check = confirm('정말 삭제하겠습니까?');
	
	if(check == true){//확인을 누르면
		location.href='deleteBookPro.jsp?bcode=<%=bcode%>'; //bcode 가지고 프로로 이동
	} else if(check == false){// 취소 누르면
		location.href='selectBook.do'; // 목록 보기로 이동
	}
</script>
</body>
</html>