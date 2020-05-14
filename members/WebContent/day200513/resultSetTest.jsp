<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSetMetaData rsmd = null;

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

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
	%>
	
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>반</td>
			<td>주야</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>연락처</td>
			<td>휴대폰</td>
		</tr>
	<%	
			while (rs.next()) {
	%>
		<tr>
			<td><%=rs.getString("stu_no") %></td>
			<td><%=rs.getString("stu_name") %></td>
			<td><%=rs.getInt("grade") %></td>
			<td><%=rs.getInt("class") %></td>
			<td><%=rs.getString("juya") %></td>
			<td><%=rs.getString("birthday") %></td>
			<%
				int gender = Integer.parseInt(rs.getString("gender"));
				String genderStr = gender % 2 == 0? "여성" : "남성";
			%>
			<td><%=genderStr %></td>
			<td><%=rs.getString("post_no") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("tel1") %> - <%=rs.getString("tel2") %> - <%=rs.getString("tel3") %></td>
			<td><%=rs.getString("mobile") %></td>
		</tr>
	
	<%
			}
	%>
	</table>
	<%		
		
		out.println("컬럼 수 : " + rsmd.getColumnCount() + "<br />");
		for(int i = 1; i <= rsmd.getColumnCount(); i++) {
			out.println(i + "번째 컬럼의 이름 : " + rsmd.getColumnName(i) + "(" + rsmd.getColumnLabel(i) + ")" + " : ");
			out.println(i + "번째 컬럼의 타입 이름: " + rsmd.getColumnTypeName(i) + "(" + rsmd.getColumnType(i) + ")" +  "<br />");
		}
		} catch (Exception e) {
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