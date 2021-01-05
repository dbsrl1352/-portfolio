package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;

@WebServlet("/selectBook.do")//selectBook.do 로 들어오면 무조건 실행
public class BookListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식으로 들어오면 실행
	doprocess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post 방식으로 들어오면 실행
	doprocess(req, resp);
	}
	
	public void doprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAO instacne = BookDAO.getInstance();//instance 연결
		instacne.selectBook(); // selectBook 메서드 실행
		req.setAttribute("list", instacne.list); //세션에 'list'라는 이름으로 리스트 저장
		//이때 저장되는 리스트에는 select된 것들이 담겨있다
		
		RequestDispatcher rd = req.getRequestDispatcher("selectBook.jsp"); //자원 넘기기
		rd.forward(req, resp);
		
	}
	
}
