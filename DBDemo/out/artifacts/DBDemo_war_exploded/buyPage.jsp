<%@ page import="java.util.Map" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: 儿时的我
  Date: 2020/6/29
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/buyPage.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>

    <script>
        function judge(obj){
            var totals = 0;
            var finals = document.getElementsByClassName("final");
            var results = document.getElementsByName("result");
            var cbs = document.getElementsByName("cb");
            for(var i = 0 ; i < cbs.length ; i++){
                if(cbs[i].checked){
                    cbs[i].value = parseFloat(finals[i].innerHTML);
                    totals += parseFloat(cbs[i].value);
                }
            }
            total.innerText = "总价为: " + totals + " 元";
        }

        function reduce(obj){
            var finals = document.getElementsByClassName("final");
            var prices = document.getElementsByClassName("price");
            var goods = document.getElementsByName("good");
            var counts = document.getElementsByName("count");
            var reduces = document.getElementsByName("redu");
            for(var i = 0 ; i <reduces.length ; i++){
                if(reduces[i]==obj){
                    var temp = parseFloat(counts[i].value)-1;
                    counts[i].value = temp;
                    finals[i].innerHTML = counts[i].value * parseFloat(prices[i].innerHTML);
                    break;
                }
            }
            <%--<%
                JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
                template.update("update shopcar set count = temp where name = temp_good");
            %>--%>
        }

        function add(obj){
            var finals = document.getElementsByClassName("final");
            var prices = document.getElementsByClassName("price");
            var goods = document.getElementsByName("good");
            var counts = document.getElementsByName("count");
            var adds = document.getElementsByName("ad");
            for(var i = 0 ; i <adds.length ; i++){
                if(adds[i]==obj){
                    var temp = parseFloat(counts[i].value)+1;
                    counts[i].value = temp;
                    finals[i].innerHTML = counts[i].value * parseFloat(prices[i].innerHTML);
                }
            }
        }

        function check_if() {
            var chcks = document.getElementsByName("cb");
            var checks = document.getElementById("check");
            var chckStr = "0";
            checks.value = "";
            for(var i = 0 ; i < chcks.length ; i++){
                if(chcks[i].checked==true){
                    checks.value +=  "," + "true";
                }
                else{
                    checks.value += ","+"false";
                }
            }
        }

        window.onload = function () {
            document.getElementById("selectAll").onclick = function () {
                //全选
                //1.获取所有的checkbox
                var totals = 0;
                var cbs = document.getElementsByName("cb");
                //2.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //3.设置每一个cb的状态为选中  checked
                    cbs[i].checked = true;
                    if (cbs[i].checked) {
                        totals += parseFloat(cbs[i].value);
                    }
                    total.innerText = "总价为: " + totals + " 元";
                }
            }



            document.getElementById("unSelectAll").onclick = function () {
                //全不选
                //1.获取所有的checkbox
                var cbs = document.getElementsByName("cb");
                //2.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //3.设置每一个cb的状态为未选中  checked
                    cbs[i].checked = false;
                }
                total.innerText = "总价为: " + 0 + " 元";
            }

            document.getElementById("selectRev").onclick = function () {
                //反选
                //1.获取所有的checkbox
                var cbs = document.getElementsByName("cb");
                //2.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //3.设置每一个cb的状态为相反
                    cbs[i].checked = !cbs[i].checked;
                }
                judge();
            }

            document.getElementById("firstCb").onclick = function () {
                var totals = 0;
                //第一个cb点击
                //1.获取所有的checkbox
                var cbs = document.getElementsByName("cb");
                //获取第一个cb

                //2.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //3.设置每一个cb的状态和第一个cb的状态一样
                    cbs[i].checked = this.checked;
                    if (cbs[i].checked) {
                        totals += parseFloat(cbs[i].value);
                    }
                }

                total.innerText = "总价为: " + totals + " 元";
            }
        }
    </script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="color:red">京东</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="#">儿时的我666</a>
        </div>
        <div>
            <!--向左对齐-->
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        我的京东
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">待处理订单</a></li>
                        <li><a href="#">返修退换货</a></li>
                        <li><a href="#">降价商品</a></li>
                        <li><a href="#">我的关注</a></li>
                        <li class="divider"></li>
                        <li><a href="#">我的京豆</a></li>
                        <li><a href="#">我的白条</a></li>
                        <li><a href="#">我的理财</a></li>
                    </ul>
                </li>
            </ul>
            <%--<form class="navbar-form navbar-left" role="search">
                <button type="submit" class="btn btn-default">
                    向左对齐-提交按钮
                </button>
            </form>--%>
            <!--向右对齐-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        客户服务 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">帮助中心</a></li>
                        <li><a href="#">在线客服</a></li>
                        <li><a href="#">电话客服</a></li>
                        <li class="divider"></li>
                        <li><a href="#">金融咨询</a></li>
                        <li class="divider"></li>
                        <li><a href="#">售后服务</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        企业采购 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">企业购</a></li>
                        <li><a href="#">工业品</a></li>
                        <li><a href="#">礼品卡</a></li>
                        <li><a href="#">商用场景馆</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="/DBDemo/payServlet" method="post">
<div class="col-md-12" id="table1">
    <table class="table table-hover" id="cartTable" class="col-md-8">
        <tr>
            <td><input type="checkbox" id="firstCb" name="firCb"></td>
            <td>商品</td>
            <td>单价</td>
            <td id="much">数量</td>
            <td>小计</td>
            <td>操作</td>
        </tr>
        <%  JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
            List<Map<String,Object>> list = template.queryForList("select * from shopcar");

            for(Map<String,Object> ObjectMap : list){
                            int temp = 0;
                            out.print("<tr>");
                            out.print("<td>");
                            out.print("<input value="+ObjectMap.get("price")+" type=checkbox name=cb onclick=judge(this)>");
                            out.print("</td>");
                            for(Object obj : ObjectMap.values())
                            {

                                if(temp==3){
                                    out.print("<td class=final>");
                                    out.print(obj);
                                    out.print("</td>");
                                }
                                else if(temp==2) {
                                    out.print("<td class=\"count\">");
                                    out.print("<input type=\"button\" class=\"btn btn-default\" value=\"-\" name=\"redu\" onclick=reduce(this)>");
                                    out.print("<input class=\"count_input\"  type=\"text\" value=" + obj + " name=\"count\" style=\"border: none\">");
                                    out.print("<input type=\"button\" class=\"btn btn-default\" value=\"+\" name=\"ad\" onclick=add(this)> ");
                                    out.print("</td>");
                                }
                                else if(temp==0){
                                    out.print("<td name=good>");
                                    out.print("<input type=text class=\"in_good\" value="+obj+" name=shopName style=\"border: none;width: 80px;height:60px;margin-top:0px\">");
                                    out.print("<img src=\"img\\"+obj+".jpg\" style=\"width:60px;height: 60px\">");
                                    out.print("</td>");
                                }
                                else if(temp==1){
                                    out.print("<td class=price>");
                                    out.print(obj);
                                    out.print("</td>");
                                }
                                else{
                                    out.print("<td>");
                                    out.print(obj);
                                    out.print("</td>");
                                }
                                temp++;
                            }
                            /*out.print("<td>");
                            out.print(result[temp]);
                            temp++;
                            out.print("</td>");*/
                            out.print("</tr>");
                    }
           %>
            <%--Connection conn = JDBCUtils.getConnection();
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
            }--%>

    </table>
</div>
<div>
    <input type="button" class="btn bg-primary" id="selectAll" value="全选">
    <input type="button" class="btn bg-primary" id="unSelectAll" value="全不选">
    <input type="button" class="btn bg-primary" id="selectRev" value="反选">
    <a href="shopping.jsp"><input type="button" class="btn bg-primary" value="首页"></a>
    <p style="float: right;margin-right: 150px;" id="total">总价为: 0 元</p>
    <br/>
        <input type="hidden" id="check" value="20" name="if_Check" >
        <input class="btn btn-default" type="submit" value="去结算"  onclick="check_if()" style="float: right;margin-right: 150px;">
</div>
</form>
</body>
</html>
