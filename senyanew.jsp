<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, javax.naming.*, javax.sql.*, java.util.Date"%>
<%!private String createOption(int start, int end, int flag) {
		Date date = new Date();
		int month = date.getMonth() + 1; // 0 = 1 月
		int day = date.getDate();
		StringBuilder builder = new StringBuilder();
		for (int i = start; i <= end; i++) {
			switch (flag){
			    case 1:
			    	builder.append("<option value='" + i + "'>" + i + "</option>");
			    	break;
				case 2:
					if (i == month){
						builder.append("<option value='" + i + "' selected>" + i + "</option>");
					}else{
						builder.append("<option value='" + i + "'>" + i + "</option>");
					}
			    	break;
				case 3:
					if (i == day){
						builder.append("<option value='" + i + "' selected>" + i + "</option>");
					}else{
						builder.append("<option value='" + i + "'>" + i + "</option>");
					}
			    	break;
			}
// 			builder.append("<option value='" + i + "'>" + i + "</option>");
		}
		return builder.toString();
	}%>
<%
	Date date = new Date();
	int year = date.getYear() + 1900; // 0 = 1900 年
// 	int month = date.getMonth() + 1; // 0 = 1 月
// 	int day = date.getDate();

	//String registDay = year + "/" + month + "/" + day;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>千夜千冊新規登録</title>
</head>
<!-- 必須入力チェック -->
<!-- https://www.sejuku.net/blog/91384 -->
<script type="text/javascript">
    function check(){
        if (senya.title.value == ""){
            //条件に一致する場合
            alert("書名を入力してください");    //エラーメッセージを出力
            return false;    //送信ボタン本来の動作をキャンセルします
        }else if(senya.auther.value == ""){
            alert("著者を入力してください");
            return false;
        }else if(senya.publisher.value == ""){
            alert("出版社を入力してください");
            return false;
        }else{
            //条件に一致しない場合(入力されている場合)
            return true;    //送信ボタン本来の動作を実行します
        }
    }
</script>

<body>
	<form method="POST" action="senyainsert.jsp" name="senya" onsubmit="return check()">
		<!-- form method="POST" action="InsertServlet" -->
		<div>
			<label>書名：<br /> <input type="text" name="title" size="70"
				maxlength="50" />
			</label>
		</div>
		<div>
			<label>著者：<br /> <input type="text" name="auther" size="30"
				maxlength="50" />
			</label>
		</div>
		<div>
			<label>出版社：<br /> <input type="text" name="publisher"
				size="70" maxlength="255" />
			</label>
		</div>
		<div>
			<label>原題：<br /> <input type="text" name="original"
				size="70" maxlength="255" />
			</label>
		</div>
		<div>
			<label>日付：<br />
				<select name="date_year"><%=createOption(year, year + 10, 1)%></select>年
				<select name="date_month"><%=createOption(1, 12, 2)%></select>月
				<select name="date_day"><%=createOption(1, 31, 3)%></select>日
			</label>
		</div>

		<div>
			<input type="submit" value="登録" />
		</div>
	</form>
<p>
<a href="http://localhost:8090/OracleSample/senya.html">
戻る
</a><p>
</body>
</html>
