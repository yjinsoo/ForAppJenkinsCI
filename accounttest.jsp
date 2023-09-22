<%@page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터 정보 가져오기
String name = request.getParameter("name");
String id = request.getParameter("id");
String password = request.getParameter("password");
String phone = request.getParameter("phone");

// JDBC 참조 변수 준비
String url = "jdbc:mariadb://$MYDB:3306/accountdb";
String username = "root";
String password1 = "dkagh1.";
// 1) JDBC 드라이버 로딩
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, username, password1);// 2) DB연결(DB url, DB id, DB pw)

// 3) SQL문 준비
String sql = "INSERT INTO users (id, password,name,phone) VALUES (?, ?, ?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id); //?위치에 해당 데이터 
pstmt.setString(2, password);
pstmt.setString(3, name);
pstmt.setString(4,phone);

// 4) 실행
pstmt.executeUpdate();

// JDBC 자원 닫기
pstmt.close();
conn.close();
%>

<script>
alert("저장 성공!");
location.href = 'index.html';
</script>
</html>
