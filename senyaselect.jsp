<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.text.* "  %>
<%
	//DB接続情報を設定する
 	String path = "jdbc:oracle:thin:@localhost:1521:BOOK"; // 接続パス
 	String id = "book"; // ログインID
 	String pw = "book"; // ログインパスワード

	//Oracle JDBC Driverのロード
 	Class.forName("oracle.jdbc.driver.OracleDriver");
	// Oracleに接続
	//Connection conn = null;
	//conn = BookDbDriver.getConnection();
	Connection conn = DriverManager.getConnection(path, id, pw);
	String strSQL = "SELECT CD,TITLE,AUTHER,PUBLISHER,NVL(ORIGINAL,' ') AS ORIGINAL,DAY FROM SENYA ORDER BY CD";
	PreparedStatement ps = conn.prepareStatement(strSQL);
	//PreparedStatement ps = db.prepareStatement("SELECT * FROM SENYA ORDER BY CD");
	ResultSet rs = ps.executeQuery();
	SimpleDateFormat dformat = new SimpleDateFormat("yyyy/MM/dd");
	//SimpleDateFormat dformat = new SimpleDateFormat("yyyy年MM月dd日");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>千夜千冊</title>
</head>
<body>
<table border="1">
<tr>
	<th>CD</th><th>TITLE</th><th>AUTHER</th><th>PUBLISHER</th><th>ORIGINAL</th><th>DAY</th>
</tr>
<% while(rs.next()) { %>
	<tr>
		<td><%=rs.getString("CD") %></td>
		<td><%=rs.getString("TITLE") %></td>
		<td><%=rs.getString("AUTHER") %></td>
		<td><%=rs.getString("PUBLISHER") %></td>
		<td><%=rs.getString("ORIGINAL") %></td>
		<td><%=dformat.format(rs.getDate("DAY")) %></td>
	</tr>
<%
}
rs.close();
ps.close();
conn.close();
//db.close();
%>
</table>
</body>
</html>
