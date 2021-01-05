package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;

@WebServlet("/insertBook.do")//insertBook.do 로 들어오는 것들을 실행
public class BookInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식으로 들어오는 것들을 실행
		//date valueOf 가져올때 스트링 문제...
		doprocess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post 방식으로 들어오는 것들을 실행
		doprocess(req, resp);
	}
	
	public void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8"); //인코딩 필수 
		resp.setContentType("text/html; charset=UTF-8"); //인코딩 필수
		PrintWriter pw = resp.getWriter();//html 코드를 웹에 그리기 위해 필수
		
		int bcode = Integer.parseInt(req.getParameter("bcode")); //bcode 받기
		String btitle = req.getParameter("btitle");//btitle 받기
		String bwriter = req.getParameter("bwriter");//bwriter 받기
		int bpub = Integer.parseInt(req.getParameter("bpub"));//bpub 받기
		int bprice = Integer.parseInt(req.getParameter("bprice"));//bprice 받기
		String bdate = req.getParameter("bdate");//bdate 받기
		
		BookDAO instacne = BookDAO.getInstance(); //instance 연결
		BookVO vo = new BookVO(bcode,btitle,bwriter,bpub,bprice,bdate);//vo 생성자 값 넣기
		
		int cnt = instacne.insertBook(vo); //insertBook 메서드 실행 후 결과값 반환
		
		if(cnt > 0) { //cnt가 0보다 크면 성공
			//printwriter 이용해서 html 코드 작성 
			//성공 메세지 띄운 후 목록으로 돌아가기
			pw.println("<script> alert('도서 등록 성공');");
			pw.println("location.href='selectBook.do'; </script>");
		} else {
			//실패 메세지 띄운 후 목록으로 돌아가기
			pw.println("<script> alert('도서 등록 실패');");
			pw.println("location.href='selectBook.do'; </script>");
		}
		
	}
}
