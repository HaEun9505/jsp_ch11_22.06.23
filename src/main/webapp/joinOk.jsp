<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- java.sql import -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
</head>
<body>
	<%
		
		request.setCharacterEncoding("utf-8");
		
		//request객체로 파라미터 값 빼오기
		String mid = request.getParameter("userId");
		String mpw = request.getParameter("userPw");
		String memail = request.getParameter("userEmail");
		
		String sql = "INSERT INTO members(id, passwd, email) VALUES('" + mid +"','" + mpw +"','" +memail+"')";				
		
		//data source 설정
		String driverName="com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "12345";
		
		//Connection 객체 생성
		Connection conn=null;
		
		try{
			Class.forName(driverName);	//드라이버 로딩
			//데이터베이스 연동
			conn = DriverManager.getConnection(url, username, password);
			
			//sql을 실행해주는 Statement 객체 생성
			Statement stmt = conn.createStatement();
			
			//SQL 실행 -> 1이 반환되면 성공, 아니면 실패
			int resultCheck = stmt.executeUpdate(sql);
			
			if(resultCheck == 1){
				out.println("회원가입 성공!");
			}else{
				out.println("회원가입 실패!");
			}
			
			out.println(conn);
			
		}catch(Exception e) {	//Exception: 모든 에러를 찾는 상위 클래스
			e.printStackTrace();
		}finally{	//에러가 있든 없든 무조건 실행
			if(conn != null){	//null값이 아니면
				conn.close();	//데이터베이스 닫기
			}
		}
		
	%>
</body>
</html>