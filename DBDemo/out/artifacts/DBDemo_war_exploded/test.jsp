<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8" />

    <title></title>
</head>

<body>
<%
    String str = (String)session.getAttribute("x");
    System.out.println(str);
%>
</body>

</html>