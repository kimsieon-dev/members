<%@page import = "members.dao.MembersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	MembersDAO dao = new MembersDAO();
	Connection conn = dao.getConn();
	CallableStatement cs = null;
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
	String sql = "{call Get_Annual_Income(?, ?)}";
	cs = conn.prepareCall(sql);
	cs.setString(1, "aaa");
	cs.registerOutParameter(2, java.sql.Types.INTEGER);
	cs.execute();
	out.println("<h3>" + cs.getInt(2) + "</h3>");
} catch(Exception e){
	e.printStackTrace();
} finally {
	try{
		if(cs !=null) cs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	dao.membersClose();
}
%>
</body>
</html>