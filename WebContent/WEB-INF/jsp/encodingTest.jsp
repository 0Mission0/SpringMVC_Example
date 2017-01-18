<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="https://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="css/login.css" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
.title {
	margin-top: 3px;
	margin-left: 2px;
	float: left;
	width: 140px;
	margin-bottom: 4px;
}

.field {
	margin-left: 145px;
	width: 115px;
	margin-bottom: 4px;
}

.field input {
	width: 115px;
}

.field textArea {
    width: 115px;
}

.errorMsg {
	height: 40px;
	line-height: 40px;
	color: red;
	visibility: hidden;
}

#sendButton {
	float: right;
}

#buttonCancel {
	float: right;
}
</style>
<title>WebSite Encoding Test</title>
</head>
<body>
	<form id="form" method="POST" action="encodingTest.do">
		<table>
			<tr>
				<td><span class="short_label">主旨 : </span></td>
				<td><span class="short_text"><input name="title" type="text" /></span></td>
			</tr>
			<tr>
				<td><span class="short_text">內文 : </span></td>
				<td><span class="short_text"><textarea name="content"></textarea></span></td>
			</tr>
			<tr>
				<td></td>
				<td><span><input id="sendButton" type="submit" value="送出" /></span></td>
			</tr>
		</table>
	</form>
	<p>content: ${ content }</p>
</body>
</html>