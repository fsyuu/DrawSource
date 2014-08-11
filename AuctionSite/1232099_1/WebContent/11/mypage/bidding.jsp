<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css"> 
<!-- 
.tableAuc {
	margin:0px;padding:0px;
	width:1000px;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:6px;
	-webkit-border-bottom-left-radius:6px;
	border-bottom-left-radius:6px;
	
	-moz-border-radius-bottomright:6px;
	-webkit-border-bottom-right-radius:6px;
	border-bottom-right-radius:6px;
	
	-moz-border-radius-topright:6px;
	-webkit-border-top-right-radius:6px;
	border-top-right-radius:6px;
	
	-moz-border-radius-topleft:6px;
	-webkit-border-top-left-radius:6px;
	border-top-left-radius:6px;
}.tableAuc table{
    border-collapse: collapse;
        border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.tableAuc tr:last-child td:last-child {
	-moz-border-radius-bottomright:6px;
	-webkit-border-bottom-right-radius:6px;
	border-bottom-right-radius:6px;
}
.tableAuc table tr:first-child td:first-child {
	-moz-border-radius-topleft:6px;
	-webkit-border-top-left-radius:6px;
	border-top-left-radius:6px;
}
.tableAuc table tr:first-child td:last-child {
	-moz-border-radius-topright:6px;
	-webkit-border-top-right-radius:6px;
	border-top-right-radius:6px;
}.tableAuc tr:last-child td:first-child{
	-moz-border-radius-bottomleft:6px;
	-webkit-border-bottom-left-radius:6px;
	border-bottom-left-radius:6px;
}.tableAuc tr:hover td{
	background-color:#e5e5e5;
		

}
.tableAuc td{
	vertical-align:middle;
	
	background-color:#e5e5e5;

	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:center;
	padding:17px;
	font-size:17px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
}.tableAuc tr:last-child td{
	border-width:0px 1px 0px 0px;
}.tableAuc tr td:last-child{
	border-width:0px 0px 1px 0px;
}.tableAuc tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.tableAuc tr:first-child td{
		background:-o-linear-gradient(bottom, #cccccc 5%, #333333 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #333333) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #333333 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#333333");	background: -o-linear-gradient(top,#cccccc,333333);

	background-color:#cccccc;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:17px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
}
.tableAuc tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #cccccc 5%, #333333 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #333333) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #333333 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#333333");	background: -o-linear-gradient(top,#cccccc,333333);

	background-color:#cccccc;
}
.tableAuc tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.tableAuc tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
 --> 
</style>

<script type="text/javascript">
function showCountdown() {
	var cnt = document.form1.statuscnt.value;
	
	// 現在日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
	var nowDate = new Date();
	var dNow = nowDate.getTime();
	// 終了時刻(1970-01-01 00:00:00からのミリ秒)を数値に代入
	   
	// 終了時刻から現在の時間引き算をして日数(ミリ秒)の差を計算
	var msg;
	
	for(var i =0; i<=cnt; i++){
		var endDate = document.form1.elements["etimestamp"+i].value;
		var timeleft = endDate - dNow;
		
	if( endDate > dNow ){	// 終了時刻に現在時刻が達していないとき
		// 差のミリ秒を、日数・時間・分・秒に分割
		var dDays = timeleft / ( 1000 * 60 * 60 * 24 );   // 日数
		timeleft = timeleft  % ( 1000 * 60 * 60 * 24 );
		var dHour = timeleft / ( 1000 * 60 * 60 );   // 時間
		timeleft = timeleft % ( 1000 * 60 * 60 );
		var dMin = timeleft / ( 1000 * 60 );   // 分
		timeleft = timeleft % ( 1000 * 60 );
		var dSec = timeleft / 1000;   // 秒
	   // 表示文字列の作成
		
		// まだ期限が来ていない場合
		if( Math.floor(dDays) != 0 )
			msg = Math.floor(dDays) + "日";
		else if( Math.floor(dHour) != 0 )
			msg = Math.floor(dHour) + "時間";
		else if( Math.floor(dMin) != 0 )
			msg = Math.floor(dMin) + "分";
		else
			msg = Math.floor(dSec) + "秒";
	}
	else {
		msg = "終了しました";
	}
	// 作成した文字列を表示
	document.getElementById("timer"+i).innerHTML = msg;
	}
}
window.onload = function(){
	// ページ読み込み時に実行したい処理
	showCountdown();
};
</script>
</head>
<body>
<form name="form1" method="post" action="/1232099_1/AucDB">

ようこそ
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
<input type="hidden" name="user" value=<c:out value="${A.user}" />>
さん
<br>
<hr>


<h3>
<input type="submit" name="command" value="マイページ" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="入札中" style="width:100px;height:50px;cursor:pointer" disabled>
<input type="submit" name="command" value="落札分" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品したもの" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品する"  style="width:100px;height:50px;cursor:pointer">
</h3>
<hr>


<h3>入札中</h3>
<c:if test="${list.size()<=0}" var="flg" />
<c:if test="${!flg}">
<div class="tableAuc">
<table border="1">
<tr>
	<th>オークションID</th>
	<th>商品</th>
	<th>分類</th>
	<th>現在価格</th>
	<th>即決価格</th>
	<th>入札回数</th>
	<th>残り時間</th>
</tr>
<c:forEach items="${list}" var="f" varStatus="status">
<input type="hidden" value=<c:out value="${f.etimestamp}" /> name="etimestamp<c:out value="${status.index}"/>">

<tr>
	<td><a href="?command=details&num=<c:out value="${f.bidID}" />&ID=<c:out value="${A.ID}" />"> <c:out value="${f.bidID}" /> </a></td>
	<td align="right"><c:out value="${f.item}" /></td>
	<td align="right"><c:out value="${f.group}" /></td>
	<td align="right"><c:out value="${f.price}" /></td>
	<td align="right"><c:out value="${f.eprice}" /></td>
	<td align="right"><c:out value="${f.bidcount}" /></td>
	<td align="right"><div id="timer<c:out value="${status.index}"/>"></div></td>
</tr>

<c:if test="${status.last}">
<input type="hidden" value="${status.index}" name="statuscnt">
</c:if>
</c:forEach>
</table>
</div>
</c:if>

<c:if test="${flg}">
入札中のオークションはありません。
</c:if>
<br><hr>
<a href="?command=top&ID=<c:out value="${A.ID}" />">戻る</a>
</c:forEach>
</form>
</body>
</html>