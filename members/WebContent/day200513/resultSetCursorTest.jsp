<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from student";
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
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/haksa");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			rs.next();
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
			rs.last();
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
			rs.previous();
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
			rs.first();
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
			rs.absolute(15);
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
			rs.next();
			out.println("<h3>" + rs.getString(1) + " : " + rs.getString(2) + "</h3><br />");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>