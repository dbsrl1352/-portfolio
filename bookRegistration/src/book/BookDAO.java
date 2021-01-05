package book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class BookDAO {
	
	private BookDAO() {}
	private static BookDAO instance = new BookDAO(); //instance 사용을 위해 만들었다
	public ArrayList<BookVO> list = new ArrayList<BookVO>(); //어디서든 사용할 수 있는 리스트
	
	public static BookDAO getInstance() { //instance 사용을 위해 만들었다
		return instance;
	}
	
	public Connection getConnection() { //오라클 연결
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; //오라클 주소
		String user = "hr"; //계정 이름
		String password ="hr"; //비밀번호
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user, password); //오라클 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getMaxCode() { //최댓값에 1 더하여 반환 하는 메서드
		int maxCode = 0; //초기값 설정
		Connection conn = getConnection(); //오라클 연결
		PreparedStatement pstmt = null; //초기 설정
		ResultSet rs = null; //초기 설정
		String getSql = "select max(bcode) from BOOK_TBL"; //book_tbl에서 가장 큰 bcode 값 가져오기
		
		try {
			pstmt = conn.prepareStatement(getSql); //sql문 담기
			rs = pstmt.executeQuery(); //sql문 실행
			if(rs.next()) {
				maxCode = rs.getInt(1); //bcode 가져오기
				maxCode++; //1 더해주기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maxCode; //반환
	}
	
	public void selectBook() { // 목록 불러오기
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectsql = "select * from BOOK_TBL order by bcode asc"; //bcode 오름차순으로 불러오기
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일"); //데이터 형 변환
		
		try {
			pstmt = conn.prepareStatement(selectsql); //sql문 담기
			rs = pstmt.executeQuery(); //sql문 실행
			while (rs.next()) {
				int bcode = rs.getInt("bcode"); //bcode 받기
				String btitle = rs.getString("btitle"); //btitle 받기
				String bwriter = rs.getString("bwriter");//bwriter 받기
				int bpub = rs.getInt("bpub");//bpub 받기
				int bprice = rs.getInt("bprice");//bprice 받기
				String bdate = sf.format(rs.getDate("bdate"));//bdate 받기
				
				BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, bdate); //생성자로 set 하기
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertBook(BookVO vo){ //목록 삽입하기
		int cnt = 0;
		String insertSql = "insert into BOOK_TBL values (?, ?, ?, ?, ?, ?)"; //삽입 sql
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Date date = Date.valueOf(vo.getBdate()); //date 형 변환
		
		try {
			pstmt = conn.prepareStatement(insertSql);//sql 문 담기
			pstmt.setInt(1, vo.getBcode()); // ?에 set 하기
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBwriter());
			pstmt.setInt(4, vo.getBpub());
			pstmt.setInt(5, vo.getBprice());
			pstmt.setDate(6,date); //형 변환한 date 넣기
			cnt = pstmt.executeUpdate();  //sql문 실행 insert는 executeUpdate로 실행
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateBook(BookVO vo) throws SQLException {//수정하기
		String updateSql = "update book_tbl set bcode = ? ,btitle=?, bwriter =?, bpub=?, bprice=?, bdate=? where bcode = ?"; //수정을 위한 sql문 
	   	int cnt = 0;
	   
	   	Connection conn = getConnection(); //오라클 연결
	   	PreparedStatement pstmt = conn.prepareStatement(updateSql); //sql 문 담기
	   	pstmt.setInt(1, vo.getBcode());//물음표에 값 넣어주기
	   	pstmt.setString(2, vo.getBtitle());
	   	pstmt.setString(3, vo.getBwriter());
	   	pstmt.setInt(4, vo.getBpub());
	   	pstmt.setInt(5, vo.getBprice());
	   	pstmt.setString(6, vo.getBdate());
	   	pstmt.setInt(7, vo.getBcode());
	   	cnt = pstmt.executeUpdate();//성공한 row 개수
		
	   	return cnt; //cnt 반환
	}
	
	public int deleteBook(int bcode) { //삭제하기
		int check = 0; //체크 기본 설정
		String deleteSql = "delete from book_tbl where bcode = ?"; //삭제 sql문
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(deleteSql); //sql문 담기
			pstmt.setInt(1, bcode);//?에 값 넣기
			pstmt.executeUpdate();// delete는 executeUpdate로 실행
			check = 1; // 성공하면 체크 1로 바꾸기
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
}








