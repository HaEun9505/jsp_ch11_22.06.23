<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- java.sql import -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<%
		//data source 설정
		String driverName="com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "12345";
		
		Connection conn=null;	//Connection 객체 생성
		Statement stmt=null;	//sql을 실행해주는 Statement 객체 생성
		ResultSet rs = null;	//ResultSet 객체 생성
		
		String sql = "SELECT * FROM members";
		
		try{
			Class.forName(driverName);	//드라이버 로딩
			//데이터베이스 연동
			conn = DriverManager.getConnection(url, username, password);
			//sql 실행
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	//SELECT
			
			 int count=1;
			 while(rs.next()){	//next : 처음 위치 필드명에서 다음 포지션으로 이동(없으면 false)
				 String mid = rs.getString("id");
				 String mpw = rs.getString("passwd");
				 String memail = rs.getString("email");
				 String mdate = rs.getString("signuptime");
				 
				 out.println("[" + count + "]" + "아이디 : " + mid + " / 비밀번호 : " + mpw + " / 이메일 : " + memail + " / 가입일 : " + mdate);
				 out.println("<br>");
				 
				 count++;
			 }
			 int totalCount = count-1;
			 out.println("총 회원수 : " + totalCount + "명");
			
		}catch(Exception e) {	//Exception: 모든 에러를 찾는 상위 클래스
			e.printStackTrace();
		}finally{	//에러가 있든 없든 무조건 실행
			try{
				if(rs != null){	//null값이 아니면
					stmt.close();//데이터베이스 닫기
				}
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
	<br><br>
	<hr>
	<form action="deleteOk.jsp">
		아이디 : <input type="text" name="userId">
		<input type="submit" value="회원탈퇴">
	
	</form>
</body>
</html>