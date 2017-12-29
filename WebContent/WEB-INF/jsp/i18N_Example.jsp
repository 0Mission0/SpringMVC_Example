<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setBundle basename="messages" />
<html>
    <body>
            你好，資源國際化。
    <fmt:message key="hello"></fmt:message>
    <table>
        <tr>
            <th>Locale</th>
            <th>Country</th>
            <th>Display Country</th>
            <th>Language</th>
            <th>Display Language</th>
            <th>Variant</th>
        </tr>
    </table>
    </body>
</html>
<!--
<fmt:bundle basename="messages">
    <fmt:message key="hello"></fmt:message>
</fmt:bundle>  
-->