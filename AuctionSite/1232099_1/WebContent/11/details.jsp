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
<!--
function plus(){
	document.form1.money.value = parseInt(document.form1.t1.value) + 1;
}
//-->
function check(){
	var NowMoney = parseInt(document.form1.t1.value);
	var UpMoney = document.form1.money.value;
	var EndMoney = document.form1.t2.value;
	if(EndMoney == "-"){}
	else EndMoney = parseInt(EndMoney);
	var str = /[^0-9]+/;
	if(str.test(UpMoney)){
		window.alert("不正な金額です。コピペはせずに入力してください");
		return false;
	}
	else{
	if(UpMoney <= NowMoney){
		document.getElementById("disp").style.display="block";
		return false;
	}
	else{
		if(EndMoney == "-"){
			Conf = confirm(UpMoney+"円で入札します。よろしいですか？");
			if(Conf==true){
				return true;
			}else{
				return false;
			}
		}
		else{
			if(EndMoney > UpMoney ){
				Conf = confirm(UpMoney+"円で入札します。よろしいですか？");
				if(Conf==true){
					return true;
				}else{
					return false;
				}
			}
			else{
				Conf = confirm(EndMoney+"円で落札することができます。よろしいですか？");
				if(Conf==true){
					document.form1.money.value = EndMoney;
					return true;
				}else{
					return false;
				}
			}
		}
	}
	}
}

function showCountdown() {
	// 現在日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
	var nowDate = new Date();
	var dNow = nowDate.getTime();
	// 終了時刻(1970-01-01 00:00:00からのミリ秒)を数値に代入
	var endDate = document.form1.etimestamp.value;
	// 終了時刻から現在の時間引き算をして日数(ミリ秒)の差を計算
	var timeleft = endDate - dNow;
	var msg1;
	var msg2 = "";

	if( endDate > dNow ){	// 終了時刻に現在時刻が達していないとき
		// 差のミリ秒を、日数・時間・分・秒に分割
		var dDays = timeleft / ( 1000 * 60 * 60 * 24 );   // 日数
		timeleft = timeleft  % ( 1000 * 60 * 60 * 24 );
		var dHour = timeleft / ( 1000 * 60 * 60 );   // 時間
		timeleft = timeleft % ( 1000 * 60 * 60 );
		var dMin = timeleft / ( 1000 * 60 );   // 分
		timeleft = timeleft % ( 1000 * 60 );
		var dSec = timeleft / 1000;   // 秒
		var msg = Math.floor(dDays) + "日" + Math.floor(dHour) + "時間" + Math.floor(dMin) + "分" + Math.floor(dSec) + "秒";
	   // 表示文字列の作成
		
		msg1 = "あと" + msg + "";
		
		if( Math.floor(dDays) != 0 )
			msg2 = Math.floor(dDays) + "日";
		else if( Math.floor(dHour) != 0 )
			msg2 = Math.floor(dHour) + "時間";
		else if( Math.floor(dMin) != 0 )
			msg2 = Math.floor(dMin) + "分";
		else
			msg2 = Math.floor(dSec) + "秒";
	}
	else {
		// 期限が過ぎた場合
		msg1 = "このオークションは終了しました";
		msg2 = "終了しました";
	}

	// 作成した文字列を表示
	document.getElementById("RealtimeCountdownArea").innerHTML = msg1;
	document.getElementById("timer").innerHTML = msg2;
}

function judge(){
	
	// 現在日時を数値(1970-01-01 00:00:00からのミリ秒)に変換
	var nowDate = new Date();
	var dNow = nowDate.getTime();
	// 終了時刻(1970-01-01 00:00:00からのミリ秒)を数値に代入
	var endDate = document.form1.etimestamp.value;
	// 終了時刻から現在の時間引き算をして日数(ミリ秒)の差を計算
	var timeleft = endDate - dNow;
	
	var NowMoney =document.form1.t1.value;
	var EndMoney = document.form1.t2.value;
	if(EndMoney != "-"){
		EndMoney = parseInt(EndMoney); 
		if(NowMoney >= EndMoney){
			document.getElementById("EndJudge").innerHTML ="<h3>この商品の取引は終了しました。</h3>";
		}
	}
	if(timeleft < 0){
		document.getElementById("EndJudge").innerHTML ="<h3>この商品の取引は終了しました。</h3>";
	}
}

// 1秒ごとに実行
setInterval('showCountdown()',1000);

window.onload = function(){
	// ページ読み込み時に実行したい処理
	judge();
	plus();
};

</script>

</head>
<body>

<form name="form1"  method="post" action="/1232099_1/AucDB">


ようこそ
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
<input type="hidden" name="user" value=<c:out value="${A.user}" />>
さん
<a href="?command=mypage&ID=<c:out value="${A.ID}" />" >マイページ</a>
<br>
<hr>


<c:if test="${list != null}">
<c:forEach items="${list}" var="f">

<input type="hidden" value=<c:out value="${f.user}" />  name="user1">
<input type="hidden" value=<c:out value="${f.bidID}" /> name="bidID">
<input type="hidden" value=<c:out value="${f.bidcount}" /> name="bidcount">
<input type="hidden" value=<c:out value="${f.etimestamp}" /> name="etimestamp">

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
<tr>
	<td><c:out value="${f.bidID}" /></td>
	<td align="right"><c:out value="${f.item}" /></td>
	<td align="right"><c:out value="${f.group}" /></td>
	<td align="right"><c:out value="${f.price}" /></td>
	<td align="right"><c:out value="${f.eprice}" /></td>
	<td align="right"><c:out value="${f.bidcount}" /></td>
	<td align="right"><div id="timer"></div></td>
</tr>
</table>
</div>

<div id="EndJudge">
<c:if test="${A.user == f.user}" var='flag' />
<c:if test="${!flag}">
	<h3>この商品に入札する</h3>
	<input type="hidden" value=<c:out value="${f.price}" /> name="t1">
	<input type="hidden" value=<c:out value="${f.eprice}" /> name="t2">
	最高入札額<input type="text" size="5" maxlength="30" style="ime-mode:disabled" onKeyup="this.value=this.value.replace(/[^0-9]+/i,'')" name="money">円<br>
	<div style="display:none" id="disp"><font size=2 color="#ff0033">現在の価格より低い値段で入札できません<br>
	<c:out value="${f.price}" />円以上で入札できます</font>
	</div>
	
	<input type="hidden" name="command" value="入札">
	<input type="image" src="11/icon/nyusatu.png" style="cursor:pointer" onClick="return check()">

</c:if>
<c:if test="${flag}">
<h3>あなたの出品している商品です</h3>
</c:if>
</div>

<hr>
<h4>詳細情報</h4>
<pre>
出品者		:<c:out value="${f.user}" />さん
開始時の価格	:<c:out value="${f.fprice}" />円
最高額入札者	:<c:out value="${f.maxuser}" />
開始日時 	:<c:out value="${f.ftimes}" />
終了日時 	:<c:out value="${f.etimes}" />
残り時間 	:<a id="RealtimeCountdownArea"><nobr></nobr></a>
</pre>
</c:forEach>
</c:if>


</c:forEach>
</form>

<hr>
<p>
<a href="#" onClick="history.go(-1)">戻る</a>
</p>


</body>
</html>