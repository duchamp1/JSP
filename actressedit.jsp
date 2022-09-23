<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*, javax.naming.*, javax.sql.*" %>
<%!
private String createOption(int start, int end, int def) {
	StringBuilder builder = new StringBuilder();
	for(int i = start; i <= end; i++) {
		builder.append("<option value='" + i + "' ");
		if(i == def) { builder.append("selected"); }
		builder.append(">" + i + "</option>");
	}
	return builder.toString();
}
%>
<%
request.setCharacterEncoding("UTF-8");
Context context = new InitialContext();
//DB接続情報を設定する
String path = "jdbc:oracle:thin:@localhost:1521:DB"; // 接続パス
String id = "woman"; // ログインID
String pw = "woman"; // ログインパスワード

//Oracle JDBC Driverのロード
Class.forName("oracle.jdbc.driver.OracleDriver");
//Oracleに接続
Connection db = DriverManager.getConnection(path, id, pw);

//DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");
//Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM actress WHERE cd=?");
ps.setString(1, request.getParameter("id"));
ResultSet rs = ps.executeQuery();
if(rs.next()) {
	/*Calendar d = Calendar.getInstance();
	Calendar t = Calendar.getInstance();
	d.setTime(rs.getDate("schedule_date"));
	t.setTime(rs.getTime("schedule_time"));*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ACTRESS編集</title>
</head>
<body>
<form method="POST" action="actressupdate.jsp">
<div>
	<label>名前：<br />
		<input type="hidden" name="cd" value="<%=rs.getString("cd") %>" />
		<input type="text" name="name" size="50" maxlength="255"
			value="<%=rs.getString("name") %>" />
	</label>
</div>
<div>
	<label>本名：<br />
		<input type="text" name="rname" size="50" maxlength="255"
			value="<%=rs.getString("rname") %>" />
	</label>
</div>
<div>
	<label>所属事務所：<br />
		<input type="text" name="office" size="50" maxlength="255"
			value="<%=rs.getString("office") %>" />
	</label>
</div>
<div>
	<label>備考：<br />
		<input type="text" name="etc" size="70" maxlength="255"
		value="<%=rs.getString("etc") %>" />
	</label>
</div>
<div>
		<input type="submit" name="update" value="更新" />
		<input type="submit" name="delete" value="削除"
			onclick="return confirm('本当に削除しても良いですか？')" />
</div>
</form>
<p>
<a href="http://localhost:8090/OracleSample/actressselect.jsp">
戻る
</a><p>
</body>
</html>
<%
}
%>