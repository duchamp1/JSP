<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
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

//ステートメントを作成
Statement stmt = db.createStatement();
// CDの最大値を取得
ResultSet rs = stmt.executeQuery("SELECT MAX(CD) AS MAXCD FROM ACTRESS");
rs.next();
int lngMaxCD = rs.getInt("MAXCD");

//Connection db = ds.getConnection();
PreparedStatement ps = db.prepareStatement(
		"INSERT INTO ACTRESS(CD, NAME, RNAME, BIRTH, HOMETOWN, STAR, BLOOD, HEIGHT, OFFICE, ETC)"
		+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
ps.setInt(1, lngMaxCD + 1);
ps.setString(2, request.getParameter("name"));
ps.setString(3, request.getParameter("rname"));
ps.setString(4, request.getParameter("date_year") + "-" +
	request.getParameter("date_month") + "-" +
	request.getParameter("date_day"));
ps.setString(5, request.getParameter("hometown"));
ps.setString(6, request.getParameter("star"));
ps.setString(7, request.getParameter("blood"));
ps.setString(8, request.getParameter("height"));
ps.setString(9, request.getParameter("office"));
ps.setString(10, request.getParameter("etc"));
ps.executeUpdate();
ps.close();
db.close();
response.sendRedirect("actressnew.jsp");
%>
