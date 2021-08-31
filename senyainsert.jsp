<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
//文字化け対策
request.setCharacterEncoding("UTF-8");
//Context context = new InitialContext();
//DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Jsp10");


//DB接続情報を設定する
String path = "jdbc:oracle:thin:@localhost:1521:BOOK"; // 接続パス
String id = "book"; // ログインID
String pw = "book"; // ログインパスワード

//Oracle JDBC Driverのロード
Class.forName("oracle.jdbc.driver.OracleDriver");
// Oracleに接続
Connection db = DriverManager.getConnection(path, id, pw);

//ステートメントを作成
Statement stmt = db.createStatement();
// CDの最大値を取得
ResultSet rs = stmt.executeQuery("SELECT MAX(CD) AS MAXCD FROM SENYA");
rs.next();
int lngMaxCD = rs.getInt("MAXCD");

//Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement(
		"INSERT INTO SENYA(CD, TITLE, AUTHER, PUBLISHER, ORIGINAL, DAY)"
		+ "VALUES(?, ?, ?, ?, ?, ?)");
ps.setInt(1, lngMaxCD + 1);
ps.setString(2, request.getParameter("title"));
ps.setString(3, request.getParameter("auther"));
ps.setString(4, request.getParameter("publisher"));
ps.setString(5, request.getParameter("original"));
ps.setString(6, request.getParameter("date_year") + "-" +
	request.getParameter("date_month") + "-" +
	request.getParameter("date_day"));
ps.executeUpdate();
ps.close();
db.close();
response.sendRedirect("senyanew.jsp");
%>
