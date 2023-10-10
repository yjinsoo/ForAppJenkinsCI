<%@page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 파라미터 정보 가져오기
    String browser = request.getParameter("browser");
    String upper = request.getParameter("upper");
    String pants = request.getParameter("pants");
    String shoes = request.getParameter("shoes");
    String service = request.getParameter("service");
    
    // JDBC 참조 변수 준비
    String url = "jdbc:mariadb:localhost:3306/mydb";
    String username = "root";
    String password1 = "dkagh1.";
    // 1) JDBC 드라이버 로딩
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, username, password1);// 2) DB연결(DB url, DB id, DB pw)
    
    // 3) SQL문 준비
    String sql = "INSERT INTO survey (browser,upper,pants,shoes,service) VALUES (?,?,?,?,?)";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, browser); //?위치에 해당 데이터 
    pstmt.setString(2, upper);
    pstmt.setString(3, pants);
    pstmt.setString(4, shoes);
    pstmt.setString(4, service);
    
    // 4) 실행
    pstmt.executeUpdate();
    
    // JDBC 자원 닫기
    pstmt.close();
    conn.close();
    %>
    
    <script>
    alert("설문 조사에 참여해주셔서 감사합니다!!");
    location.href = 'index.html';
    </script>
    </html>
    