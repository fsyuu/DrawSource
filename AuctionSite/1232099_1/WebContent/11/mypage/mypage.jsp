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
<input type="submit" name="command" value="マイページ" style="width:100px;height:50px;cursor:pointer" disabled>
<input type="submit" name="command" value="入札中" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="落札分" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品したもの" style="width:100px;height:50px;cursor:pointer">
<input type="submit" name="command" value="出品する"  style="width:100px;height:50px;cursor:pointer">
</h3>
<hr>

<a href="?command=top&ID=<c:out value="${A.ID}" />">戻る</a>
</c:forEach>
</form>
</body>
</html>