<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.MenuDao" %>
<%@ page import="Mybeans.MenuList" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.RowMapper" %>
<%@ page import="javax.sql.RowSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<html>
<head>
    <meta charset="utf-8">
    <title>login</title>
    <link href="css/style.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <input type="button"  class="btn-info btn-lg" value="个人信息修改" id="change1">
            <br/>
            <input type="button" onclick="isHidden('table1')" class="btn-info btn-lg" value="商品菜单一览" id="change2">
            <br/>
            <input type="button" class="btn-info btn-lg" value="订单状态查询" id="change3">
        </div>
        <div class="col-md-1" id="table1">
            <table class="table table-hover" id="menu" class="col-md-8">
            <tr>
                <td>菜号</td>
                <td>菜名</td>
                <td>窗口号</td>
                <td>库存</td>
                <td>价格</td>
            </tr>
            <%  JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

                List<Map<String,Object>> list = template.queryForList("select * from menu");
                %>
<%--                    打印菜单的两种方法--%>
                    <%--<% for(Map<String,Object> ObjectMap : list){
                            out.print("<tr>");
                            for(Object obj : ObjectMap.values())
                            {
                                out.print("<td>");
                                out.print(obj);
                                out.print("</td>");
                            }
                            out.print("</tr>");
                    }
                    %>--%>
                <%
                Connection conn = JDBCUtils.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from menu");
                while(rs.next()){
                    out.print(
                                "<tr>"+
                                "<td>"+rs.getString("Mno")+"</td>" +
                                "<td>"+rs.getString("Mname")+"</td>" +
                                "<td>"+rs.getString("Window")+"</td>" +
                                "<td>"+rs.getString("amount")+"</td>" +
                                "<td>"+rs.getString("price")+"</td>" +
                                "</tr>");
                }
            %>
            </table>
          </div>
    </div>
</div>
</body>
</html>












<script>
function isHidden(table1){
    var vDiv = document.getElementById(table1);
    vDiv.style.display = (vDiv.style.display=='none')? 'block':'none';
}
</script>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
