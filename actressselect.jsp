<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.*" %>
<%
//Context context = new InitialContext();
//DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");

//DB接続情報を設定する
String path = "jdbc:oracle:thin:@localhost:1521:DB"; // 接続パス
String id = "woman"; // ログインID
String pw = "woman"; // ログインパスワード

//Oracle JDBC Driverのロード
Class.forName("oracle.jdbc.driver.OracleDriver");
// Oracleに接続
Connection db = DriverManager.getConnection(path, id, pw);
//Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement("SELECT * FROM ACTRESSALL");
ResultSet rs = ps.executeQuery();
SimpleDateFormat dformat = new SimpleDateFormat("yyyy/MM/dd");
//SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
//SimpleDateFormat tformat = new SimpleDateFormat("HH時mm分");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ACTRESS情報</title>
</head>
<body>
<table border="1">
<tr>
	<th>CD</th><th>名前</th><th>本名</th><th>生年月日</th><th>年齢</th><th>出身地</th>
	<th>星座</th><th>血液型</th><th>身長</th><th>所属事務所</th><th>備考</th><th>編集</th>
</tr>
<% while(rs.next()) { %>
	<tr>
		<td><%=rs.getString("CD") %></td>
		<td><%=rs.getString("名前") %></td>
		<td><%=rs.getString("本名") %></td>
		<td><%=dformat.format(rs.getDate("生年月日")) %></td>
		<td><%=rs.getInt("年齢") %></td>
		<td><%=rs.getString("出身地") %></td>
		<td><%=rs.getString("星座") %></td>
		<td><%=rs.getString("血液型") %></td>
		<td><%=rs.getInt("身長") %></td>
		<td><%=rs.getString("所属事務所") %></td>
		<td><%=rs.getString("備考") %></td>
		<td>
			<a href="actressedit.jsp?id=<%=rs.getString("id") %>">編集</a>
		</td>
	</tr>
<%
}
rs.close();
ps.close();
db.close();
%>
</table>
</body>
</html>
