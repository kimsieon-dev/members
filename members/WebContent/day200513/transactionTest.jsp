<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "insert into members values('Oh', 'aaaa', '오정원', 30, '여성', 'oh@test.com')";
	String sql2 = "select * from members where age > 30";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/members");
			conn = ds.getConnection();
			
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				conn.rollback();
				out.println("<h3>롤백하였습니다.</h3>");
			} else {
				conn.commit();
				out.println("<h3>삽입되었습니다.</h3>");
			}
			conn.setAutoCommit(true);
		} catch(Exception e) {
			out.println("<h3>데이터 삽입 실패</h3>");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>