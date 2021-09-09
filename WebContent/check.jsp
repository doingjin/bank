<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잔액 확인</title>
</head>
<body>

<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="check">
	<table>
		<tr>
			<td>본인 계좌번호</td>
			<td><input type="text" name="bnum"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="잔액 확인"></td>
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