<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="website.model.impl.Person" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.foreach {
    float: left;
    padding: 3px;
    width: 50px;
    text-alien: center;
    border: 1px solid #000000;
}
</style>
<title>JSTL Example</title>
</head>
<body>
    <!-- http://localhost:8080/Website/jstl.do?action=test -->
    <c:out value="${ param.action }"></c:out>
    
    <c:if test="${ param.action == 'add' }">
        <form action="jstl.do" method="post">
            <table>
	            <tr>
	                <td>帳號：</td>
	                <td><input type="text" name="account" /></td>
	            </tr>
	            <tr>
	                <td>姓名：</td>
	                <td><input type="text" name="name" /></td>
	                <td><input type="hidden" name="action" value="edit" /></td>
	            </tr>
	            <tr>
	                <td><input type="submit" value="submit" /></td>
	            </tr>
	        </table>
        </form>
    </c:if>
    <c:if test="${ param.action == 'edit' }">
        <form>
	        <table>
	            <tr>
	                <td>帳號：</td>
	                <td><c:out value="${ param.account }"></c:out></td>
	            </tr>
	            <tr>
	                <td>姓名：</td>
	                <td><input type="text" name="name" /></td>
	            </tr>
	        </table>
	    </form>
    </c:if>
    <c:choose>
        <c:when test="${ param.input % 2 == 0 }">
            <p>偶數</p>
        </c:when>
        <c:otherwise>
            <p>奇數</p>
        </c:otherwise>
    </c:choose>
    <c:forEach var="num" begin="2" end="100" step="2">
        <div class="foreach">${ num }</div>
    </c:forEach>
    <table>
        <c:forEach items="${ people }" var="person">
	        <tr bgcolor="${ varStatus.index % 2 == 1 ? '#EFEFEF' : '#FFFFFF'}">
	            <td>${ person.id }</td>
	            <td>${ person.name }</td>
	            <td>${ person.age }</td>
	            <td>${ person.sex }</td>
	            <td>${ person.address }</td>
	        </tr>
        </c:forEach>
    </table>
    <table>
        <c:forEach items="${ people }" var="person" varStatus="varStatus">
            <c:if test="${ varStatus.first }">
	            <tr>
	                <td><p>這是第一筆</p></td>
	                <td>${ person.id }</td>
	                <td>${ person.name }</td>
	                <td>${ person.age }</td>
	                <td>${ person.sex }</td>
	                <td>${ person.address }</td>
	            </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <c:forTokens items="Mission, Jiang, Root, Katarina" delims="," var="item" begin="0" end="4" step="1">
        <p>${ item }</p>
    </c:forTokens>
    
    <c:set var="applicationCount" value="${ applicationCount + 1 }" scope="application"></c:set>
    <c:set var="sessionCount" value="${ sessionCount + 1 }" scope="session"></c:set>
    <p>這個網站已被瀏覽了：${ applicationCount }次</p>
    <p>你瀏覽了：${ sessionCount }次</p>
    
    <c:set var="test" value="by value property"></c:set>
    <p>${ test }</p>
    <c:set var="test">by body</c:set>
    <p>${ test }</p>
    
    <%
        request.setAttribute("person", new Person("1", "2", "3", "4", "5"));
    %>
    <c:set target="${ person }" property="id" value="${ test }"></c:set>
    <p>${ person.id }</p>
    <p>${ person.name }</p>
    
    <p>Before Remove: ${ person == null ? "Person is null" : "Person is not Null"}</p>
    <c:remove var="person" />
    <p>After Remove: ${ person == null ? "Person is null" : "Person is not Null"}</p>
    
    <%
        request.setAttribute("person", new Person("1", "2", "3", "4", "5"));
    %>
    <c:catch var="ex">
        <!-- <c:set target="${ person }" property="id" value="This will throw Exception"></c:set> -->
        <c:set target="person" property="id" value="This will throw Exception"></c:set>
    </c:catch>
    <c:if test="${ ex != null }">
        <p>例外：${ ex.message }</p>
    </c:if>
    
    <p><c:url value="/image/404.jpg" /></p>
    
    <p><%= request.getContextPath() %></p>
</body>
</html>