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
<!-- 必須入力チェック -->
<!-- https://www.sejuku.net/blog/91384 -->
<script type="text/javascript">
    function check(){
        if (actress.name.value == ""){
            //条件に一致する場合
            alert("名前を入力してください");    //エラーメッセージを出力
            return false;    //送信ボタン本来の動作をキャンセルします
        }else if(actress.rname.value == ""){
            alert("本名を入力してください");
            return false;
        }else if(actress.office.value == ""){
            alert("所属事務所を入力してください");
            return false;
        }else{
            //条件に一致しない場合(入力されている場合)
            return true;    //送信ボタン本来の動作を実行します
        }
    }
</script>

<body>
<form method="POST" action="actressinsert.jsp" name="actress" onsubmit="return check()">
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
<%-- 		<select name="hometown"><%=createOption(1, 47)%></select> --%>
		<select name="hometown">
		  <option value="1" selected>北海道</option>
		  <option value="2">青森県</option>
		  <option value="3">岩手県</option>
		  <option value="4">宮城県</option>
		  <option value="5">秋田県</option>
		  <option value="6">山形県</option>
		  <option value="7">福島県</option>
		  <option value="8">茨城県</option>
		  <option value="9">栃木県</option>
		  <option value="10">群馬県</option>
		  <option value="11">埼玉県</option>
		  <option value="12">千葉県</option>
		  <option value="13">東京都</option>
		  <option value="14">神奈川県</option>
		  <option value="15">新潟県</option>
		  <option value="16">富山県</option>
		  <option value="17">石川県</option>
		  <option value="18">福井県</option>
		  <option value="19">山梨県</option>
		  <option value="20">長野県</option>
		  <option value="21">岐阜県</option>
		  <option value="22">静岡県</option>
		  <option value="23">愛知県</option>
		  <option value="24">三重県</option>
		  <option value="25">滋賀県</option>
		  <option value="26">京都府</option>
		  <option value="27">大阪府</option>
		  <option value="28">兵庫県</option>
		  <option value="29">奈良県</option>
		  <option value="30">和歌山県</option>
		  <option value="31">鳥取県</option>
		  <option value="32">島根県</option>
		  <option value="33">岡山県</option>
		  <option value="34">広島県</option>
		  <option value="35">山口県</option>
		  <option value="36">徳島県</option>
		  <option value="37">香川県</option>
		  <option value="38">愛媛県</option>
		  <option value="39">高知県</option>
		  <option value="40">福岡県</option>
		  <option value="41">佐賀県</option>
		  <option value="42">長崎県</option>
		  <option value="43">熊本県</option>
		  <option value="44">大分県</option>
		  <option value="45">宮崎県</option>
		  <option value="46">鹿児島県</option>
		  <option value="47">沖縄県</option>
		</select>
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
