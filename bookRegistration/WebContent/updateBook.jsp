<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<style type="text/css">
* {
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
	<br>
	<form action="updateBookPro.jsp">
	<table border="1">
		<tr>
			<th colspan="2">도서 정보 수정</th>
		</tr>
		<%
			BookDAO instacne = BookDAO.getInstance(); //instance 연결
			int bcode = Integer.parseInt(request.getParameter("bcode")); //bcode 받아오기

			Connection conn = instacne.getConnection(); //커넥션 연결
			String sql = "select * from book_tbl where bcode = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql); //pstmt에 sql문 넣기
			pstmt.setInt(1, bcode);// ?에 bcode 넣어주어 조건 완성
			ResultSet rs = pstmt.executeQuery(); //sql문 실행

			String[] arr = { "양영디지털", "북스미디어", "한빛아카데미", "이지스" }; //배열에 출판사 넣어놓고
			int[] bpubArr = { 1001, 1002, 1003, 1004 }; //배열에 출판사 코드 넣기
			if (rs.next()) {
		%>
		<tr>
			<td>도서코드</td>
			<td><input type="text" name="bcode"
				value="<%=rs.getInt("bcode")%>" readonly></td> <!-- 리드온리를 넣어 바꿀 수 없게 한다 -->
		</tr>
		<tr>
			<td>도서제목</td>
			<td><input type="text" name="btitle"
				value="<%=rs.getString("btitle")%>" required></td>
		</tr>
		<tr>
			<td>도서저자</td>
			<td><input type="text" name="bwriter"
				value="<%=rs.getString("bwriter")%>" required></td>
		</tr>
		<tr>
			<td>출판사코드</td>
			<td><select name="bpub" required>
					<%
						for (int i = 0; i < bpubArr.length; i++) { //아까 만든 출판사 코드 배열 길이 만큼 돌면서
								if (rs.getInt("bpub") == bpubArr[i]) { // bpub과 출판사 코드 배열 i번째가 같으면
					%>
					<option value="<%=bpubArr[i]%>" selected><%=arr[i]%></option> <!-- selected를 추가하고 -->
					<%
						} else { //그렇지 않다면
					%>
					<option value="<%=bpubArr[i]%>"><%=arr[i]%></option> <!-- selected를 추가하지 않는다 -->
					<%
						}
							}
					%>

			</select></td>
		</tr>
		<tr><td>가격</td><td><input type="text" name="bprice" value="<%=rs.getInt("bprice") %>" required> </td></tr>
		<tr><td>출간날짜</td><td><input type="text" name="bdate" value="<%=rs.getDate("bDate") %>" required> </td></tr>
		<tr><td colspan="2"><input type="submit" value="수정"><input type="button" value="취소" onclick="location.href='selectBook.do'"> </td> </tr>
		<!-- 수정을 누르면 updatePro.jsp 로 이동하지만 취소를 누르면 목록으로 돌아간다 -->
	</table>
	</form>
	<%
			}
	%>
</body>
</html>