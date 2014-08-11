<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
setTimeout("link()", 1000);
function link(){
location.href="/1232099_1/AucDB?command=notback&ID="+document.form1.ID.value;
}

window.onunload = function(){};
history.forward();
</script>
</head>
<body>

<form name=form1>
<c:forEach items="${rlist}" var="A">
<input type="hidden" name="ID" value=<c:out value="${A.ID}" />>

<pre>
処理中です。1秒後に画面が切り替わるのでお待ちください。


切り替わらない方は<a href="/1232099_1/AucDB?command=notback&ID=<c:out value="${A.ID}" />" >こちら</a>
</pre>

</c:forEach>
</form>
</body>
</html>