<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%!
private String createOption(int start, int end) {
	StringBuilder builder = new StringBuilder();
	for(int i = start; i <= end; i++) {
		builder.append("<option value='" + i + "'>" + i + "</option>");
	}
	return builder.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ACTRESS新規登録</title>
</head>
<body>
<form method="POST" action="actressinsert.jsp">
<!-- form method="POST" action="actressInsertServlet" -->
<div>
	<label>名前：<br />
		<input type="text" name="name" size="15" maxlength="30" />
	</label>
</div>
<div>
	<label>本名：<br />
		<input type="text" name="rname" size="15" maxlength="30" />
	</label>
</div>
<div>
	<label>生年月日：<br />
		<select name="date_year"><%=createOption(1965, 1999)%></select>年
		<select name="date_month"><%=createOption(1, 12)%></select>月
		<select name="date_day"><%=createOption(1, 31)%></select>日
	</label>
</div>
<div>
	<label>出身地：<br />
		<select name="hometown"><%=createOption(1, 47)%></select>
	</label>
</div>
<div>
	<label>星座：<br />
		<select name="star"><%=createOption(1, 12)%></select>
	</label>
</div>
<div>
	<label>血液型：<br />
		<select name="blood"><%=createOption(1, 6)%></select>
	</label>
</div>
<div>
	<label>身長：<br />
		<input type="number" name="height" size="1" maxlength="3" />
	</label>
</div>
<div>
	<label>所属事務所：<br />
		<input type="text" name="office" size="70" maxlength="255" />
	</label>
</div>
<div>
	<label>備考：<br />
		<input type="text" name="etc" size="70" maxlength="255" />
	</label>
</div>
<div>
	<input type="submit" value="登録" />
</div>
</form>
<p>
<a href="http://localhost:8090/OracleSample/actress.html">
戻る
</a><p>
</body>
</html>
