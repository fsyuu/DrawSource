<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
ようこそ
<c:forEach items="${rlist}" var="A">
<c:out value="${A.user}" />
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>
さん
<a href="?command=mypage&ID=<c:out value="${A.ID}" />" >マイページ</a>
</c:forEach>
<br>
<hr>


<h3>以下の条件に一致する商品はありませんでした。</h3>
<table bgcolor="#fdf5e6">
	<tr><th width="410" height="20">
	指定した条件
	</th></tr>
</table>
<table border="1">
	<tr>
		<td width="100">
		分類
		</td>
		<td width="300">	
		${group}
		</td>
		
	</tr>
	<tr>
		<td>
		タイトル
		</td>
		<td>
		${item}
		</td>
	</tr>
</table>
<hr>
<a href="#" onClick="history.go(-1)">戻る</a>
</body>
</html>