<%@page import="java.text.DecimalFormat"%>
<%@page import="java.rmi.Remote"%>
<%@page import="oracle.net.aso.b"%>
<%@page import="book.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
<style type="text/css">
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<br><br>
<table border="1">
<tr>
<th>도서코드</th>
<th>도서제목</th>
<th>도서저자</th>
<th>출판사</th>
<th>가격</th>
<th>출간날짜</th>
<th>삭제</th></tr>
<%
	DecimalFormat df = new DecimalFormat("###,###"); //가격을 세 자리마다 콤마를 찍어주기 위해 해놓은 것
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");//세션에 저장해놓은 리스트 불러오기
	for(int i = 0; i < list.size(); i++){//리스트 사이즈 만큼 돌면서
		String msg = ""; //메세지 초기값 설정
		int bpub = list.get(i).getBpub(); //출판사 코드 가져오기
		if(bpub == 1001){ //출판사 코드 별로 출판사를 메세지에 넣기
		msg = "양영디지털";
		} else if(bpub == 1002){
			msg = "북스미디어";
		} else if(bpub == 1003){
			msg = "한빛아카데미";
		} else if(bpub == 1004){
			msg = "이지스";
		}
		%>
		<tr>
		<td><a href="updateBook.jsp?bcode=<%=list.get(i).getBcode()%>"><%=list.get(i).getBcode() %></a></td> <!-- a태그를 넣어 도서코드 누르면 수정화면으로 이동 -->
		<td><%=list.get(i).getBtitle() %></td>
		<td><%=list.get(i).getBwriter() %></td>
		<td><%=msg %></td> <!-- 아까 넣어놓은 출판사 보여주기 -->
		<td><%=df.format(list.get(i).getBprice()) %></td>
		<td><%=list.get(i).getBdate() %></td>
		<td><a href="deleteBook.jsp?bcode=<%=list.get(i).getBcode()%>">삭제</a></td> <!-- a태그를 넣어 삭제를 누르면 delete 페이지로 이동 -->
		</tr>
		<%
	}
	list.clear();
%>
</table>
<br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>