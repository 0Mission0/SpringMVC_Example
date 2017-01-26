<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SetLocale Example</title>
</head>
<body>
<% request.setAttribute("localeList", Locale.getAvailableLocales());%>
<table>
    <tr class="title">
        <th>Locale</th>
        <th>Language</th>
        <th>Date and Time</th>
        <th>Number</th>
        <th>Currency</th>
    </tr>
    <jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
    <c:forEach var="locale" items="${ localeList }">
        <fmt:setLocale value="${ locale }" scope="session" />
        <tr>
            <td align="left">${ locale.displayName }</td>
            <td align="left">${ locale.displayLanguage }</td>
            <td><fmt:formatDate value="${ date }" type="both" /></td>
            <td><fmt:formatNumber value="10000.5" /></td>
            <td><fmt:formatNumber value="10000.5" type="currency" /></td>
        </tr>
    </c:forEach>
    <tr>
    </tr>
</table>
</body>
</html>