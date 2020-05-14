<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	
	.td_title {
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
	<form name="joinform" action="joinProcess.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2" class="td_title">
					회원 가입 페이지
				</td>
			</tr>
				
			<tr>
				<td>
					<label for="id">아이디 : </label>
				</td>
				
				<td>
					<input type="text" name="id" id="id" />
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="pass">비밀번호 : </label>
				</td>
				
				<td>
					<input type="password" name="pass" id="pass"  required="required" />
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="name">이름</label>
				</td>
				
				<td>
					<input type="text" name="name" id="name" required="required" />
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="age">나이</label>
				</td>
				
				<td>
					<input type="text" name="age" id="age" required="required" />
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="gender1">성별 : </label>
				</td>
				
				<td>
					<input type="radio" name="gender" value="남" checked="checked" id="gender1" />남자
					<input type="radio" name="gender" value="여" checked="checked" id="gender2" />여자
				</td>
			</tr>
			
			<tr>
				<td>
					<label for="email">이메일 주소 : </label>
				</td>
				
				<td>
					<input type="email" name="eamil" id="email" required="required" />
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<a href="javascript:joinform.submit()">회원 가입</a>&nbsp;&nbsp;
				<a href="javascript:joinform.reset()">다시 작성</a>
				</td>
			</tr>
			
		</table>
	</form>

</body>
</html>