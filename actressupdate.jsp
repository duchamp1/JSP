<%@ page contentType="text/html; charset=UTF-8"
  import="java.sql.*, javax.naming.*, javax.sql.*" %>
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
PreparedStatement ps;

if (request.getParameter("delete") != null) {
  ps = db.prepareStatement("DELETE FROM actress WHERE cd=?");
  ps.setString(1, request.getParameter("cd"));
} else {
  ps = db.prepareStatement("UPDATE actress SET name=?, rname=?, office=?, etc=? WHERE cd=?");
  ps.setString(1, request.getParameter("name"));
  ps.setString(2, request.getParameter("rname"));
  ps.setString(3, request.getParameter("office"));
  ps.setString(4, request.getParameter("etc"));
  ps.setString(5, request.getParameter("cd"));
}
ps.executeUpdate();
ps.close();
db.close();
response.sendRedirect("actressselect.jsp");
%>