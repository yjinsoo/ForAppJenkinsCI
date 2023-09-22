<%@ page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Make account</title>
    <script type="text/javascript">

        // 취소 버튼 클릭시 메인 화면으로 이동
        function goMainForm() {
            location.href="index.html";
        }
    </script>
    
</head>
<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">Make Account</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="accounttest.jsp" name="userInfo" 
                onsubmit="return checkValue()">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="text" name="password" maxlength="50">
                    </td>
                </tr>                                
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Sign up "/>  
            <input type="button" value="Cancel" onclick="goMainForm()">
        </form>
    </div>
    
    <%
      String url = "jdbc:mariadb://$MYDB:3306/accountdb";
      String username = "root";
      String password = "dkagh1.";
      try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
	// if(conn != null)
	//	out.println("disConnected");
        String sql = "SELECT * FROM users";
        PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
	out.println(rs.getString(1)); //rs.getSrting(1):1열
	}
	} catch(ClassNotFoundException e){
		out.println("Not Connected");
	}catch (Exception e) {
            // 연결 또는 작업 중 예외 발생 시 처리
             e.printStackTrace(); 
        } 
        %>
</body>
</html>

