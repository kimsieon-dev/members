<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  <%@ page import = "members.dao.MembersDAO, java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
   
    <% 
    	MembersDAO dao = new MembersDAO();
    	Connection conn = dao.getConn();
    	Statement stmt = null;
    	ResultSet rs = null;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
    		stmt = conn.createStatement();
    		String sql = "select * from members";
    		rs = stmt.executeQuery(sql);
    		out.println("<table border='1'>");
    		out.println("<tr>");
    		out.println("<th>아이디</th>");
    		out.println("<th>비밀번호</th>");
    		out.println("<th>이름</th>");
    		out.println("<th>나이</th>");
    		out.println("<th>성별</th>");
    		out.println("<th>이메일</th>");
    		out.println("</tr>");
    		while(rs.next()){
    			String id = rs.getString("id");
    			String password = rs.getString("password");
    			String name = rs.getString("name");
    			int age = rs.getInt("age");
    			String gender = rs.getString("gender");
    			String email = rs.getString("email");
    			
    			out.println("<tr>");
    			out.println("<td>" + id +"</td>");
    			out.println("<td>" + password +"</td>");
    			out.println("<td>" + name +"</td>");
    			out.println("<td>" + age +"</td>");
    			out.println("<td>" + gender +"</td>");
    			out.println("<td>" + email +"</td>");
    			out.println("</tr>");
    		}
    		out.println("</table>");
    	} catch(Exception e){
    		out.println("<h3>유저 생성 실패</h3>");
    		e.printStackTrace();
    	}finally{
    		try{
    			if(stmt !=null) stmt.close();
    		} catch(Exception e){
    			e.printStackTrace();
    		}
    		dao.membersClose();
    	}
%>
</body>
</html>