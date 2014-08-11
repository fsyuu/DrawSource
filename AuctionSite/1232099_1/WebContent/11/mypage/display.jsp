<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
window.onload = function(){
	document.form1.fprice.onblur = compare;
	document.form1.eprice.onblur = compare;
};

function check(){
	var flag = 0;
	var fprice = document.form1.fprice.value;
	var eprice = document.form1.eprice.value;
	var group =document.form1.group.value;
	var item = document.form1.item.value;
	
	if(item== ""){
		flag = 1;
	}
	else if(fprice == ""){
		flag = 1;
	}
	
	if(flag){
		window.alert('未入力の項目があります');
		return false;
	}
	else{
		if(eprice == ""){
			judge =confirm('分類：'+group+'\n商品名：'+item+'\n開始価格：'+fprice+'円\n即決価格：なし\nで出品します。よろしいですか？');
			if(judge == true) return true;
			else return false;
		}else{
			eprice = parseInt(eprice);
			if(fprice >= eprice){
				window.alert('開始価格が即決価格未満に設定してください。');
				return false;
			}else{
				judge =confirm('分類：'+group+'\n商品名：'+item+'\n開始価格：'+fprice+'円\n即決価格：'+eprice+'円\nで出品します。よろしいですか？');
				if(judge == true) return true;
				else return false;
			}
		}
	}
}


function compare(){
	var fprice = document.form1.fprice.value;
	var eprice = document.form1.eprice.value;
	
	
	if(fprice!="" && eprice!=""){
		if(parseInt(fprice) >= parseInt(eprice)){
			document.getElementById("wrong").style.display="block";
		}else{
			document.getElementById("wrong").style.display="none";
		}
	}else{
		document.getElementById("wrong").style.display="none";
	}
}
</script>

</head>
<body>


ようこそ
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
さん
<form name="form2" method="post" action="/1232099_1/AucDB" >
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
<input type="hidden" name="user" value=<c:out value="${A.user}" />>
<hr>


<h3>
<input type="submit" name="command" value="マイページ" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="入札中" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="落札分" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品したもの" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品する"  style="width:100px;height:50px;cursor:pointer" disabled>
</h3>
</form>
<hr>


<form name="form1" method="post" action="/1232099_1/AucDB" onSubmit="return check()">
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
<input type="hidden" name="user" value=<c:out value="${A.user}" />>

分類　
<select name = "group" style="cursor:pointer"> 
<option value="ファッション">ファッション</option> 
<option value="アクセサリー">アクセサリー</option> 
<option value="食品">食品</option> 
<option value="飲料">飲料</option> 
<option value="パソコン・周辺機器">パソコン・周辺機器</option> 
<option value="TV・オーディオ・カメラ">TV・オーディオ・カメラ</option> 
<option value="家電">家電</option> 
<option value="音楽">音楽</option> 
<option value="スポーツ">スポーツ</option> 
<option value="アウトドア">アウトドア</option> 
<option value="インテリア">インテリア</option> 
<option value="日用品雑貨">日用品雑貨</option> 
<option value="ペット用品">ペット用品</option> 
<option value="おもちゃ・ゲーム">おもちゃ・ゲーム</option> 
<option value="本">本</option> 
<option value="車・バイク">車・バイク</option> 
</select>

<pre>
商品名
<input type="text" maxlength="30" name="item">

開始価格
<input type="text" style="ime-mode:disabled" maxlength="30" onKeyup="this.value=this.value.replace(/[^0-9]+/,'')" name="fprice">円

即決価格(任意)
<input type="text" style="ime-mode:disabled" maxlength="30" onKeyup="this.value=this.value.replace(/[^0-9]+/,'')" name="eprice">円
</pre>
<div style="display:none" id="wrong"><font size=2 color="#ff0033">
開始価格は落札価格以下で設定してください
</font></div>
<input type="hidden" name="command" value="出品">
<input type="image" src="11/icon/shuppin.png" style="cursor:pointer">


</form>
<hr>
<a href="?command=top&ID=<c:out value="${A.ID}" />">戻る</a>
</c:forEach>

</body>
</html>