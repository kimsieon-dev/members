<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value="en_US"/>
	<fmt:bundle basename="test">
		<fmt:message key="name"></fmt:message><br />
		<fmt:message key="say"></fmt:message><br />
		<fmt:message key="say2">
			<fmt:param value="고길동"></fmt:param>
		</fmt:message>
	</fmt:bundle>
	
	<p>
		<fmt:formatNumber value="50000" type="currency"></fmt:formatNumber><br />
		<fmt:formatNumber value="0.15" type="percent"></fmt:formatNumber><br />
		<fmt:formatNumber value="500567300" pattern="###,###,###"></fmt:formatNumber>
	</p>
	
	<p>
		<fmt:formatDate value="${date }"/><br />
		<fmt:formatDate value="${date }"/><br />
		<fmt:formatDate value="${date }"/>
	</p>
	
	<fmt:formatDate value="${date }" type="both" timeStyle="short" dateStyle="short"/><br />
	<fmt:formatDate value="${date }" type="both" timeStyle="long" dateStyle="long"/><br />
</body>
</html>