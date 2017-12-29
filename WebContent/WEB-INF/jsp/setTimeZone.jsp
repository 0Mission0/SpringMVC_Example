<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SetTimeZone Example</title>
</head>
<body>
<% 
String[] ids = TimeZone.getAvailableIDs();
request.setAttribute("ids", ids);
%>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<fmt:setLocale value="en_FR" />
現在時刻：<%= TimeZone.getDefault().getDisplayName() %>
</body>
</html>