<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FMT Example</title>
</head>
<fmt:requestEncoding value="UTF-8" />
<body>
    <!-- <form action="${ pageContext.request.requestURI }" method="POST"> -->
    <form action="/Website/fmt.do" method="POST">
        關鍵字：<input name="key" /><c:out value="${ param.key }" default="請輸入關鍵字"></c:out>
        <br/><br/>
        <input type="submit">
    </form>
</body>
</html>