<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="com.alibaba.druid.util.JdbcUtils" %>
<%@ page import="utils.JDBCUtils" %><%--
  Created by IntelliJ IDEA.
  User: 儿时的我
  Date: 2020/7/2
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结算页面</title>
    <%--<script>
        window.onload = function() {
            alert("确定结算吗?");
        }
    </script>--%>
</head>
<body>
    <form action="/DBDemo/resultServlet" method="post">
        <input type="text" value="你确定要结算吗？">
        <input type="submit" class="btn-default" value="确定">
        <input type="reset" class="btn-default" value="取消">
    </form>
</body>
</html>
