<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌이체</title>
</head>
<body>


<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="trans">
	<table>
		<tr>
			<td>본인 계좌번호</td>
			<td><input type="text" name="give"></td>
		</tr>
		<tr>
			<td>받는 사람 계좌번호</td>
			<td><input type="text" name="take"></td>
		</tr>
		<tr>
			<td>보낼 금액</td>
			<td><input type="text" name="bal"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="이체하기"></td>
		</tr>
	</table>
</form>
	<br><br>
	<div>
		<p>${str}</p>
	</div>
	
	<br><br>
	<button onclick="location.href='index.jsp'">main</button>


</body>
</html>