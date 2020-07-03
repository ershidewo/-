<%--
  Created by IntelliJ IDEA.
  User: 儿时的我
  Date: 2020/7/3
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns:font-size="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shopping.css">
    <link rel="icon" href="img/favicon.png" type="image/x-icon">
    <title>顶级购物</title>
    <script>

        window.onload = function () {
            document.getElementById("1").onclick = function () {
                document.getElementById("7").value = "electrical";
            }

            document.getElementById("2").onclick = function () {
                document.getElementById("7").value = "necessities";
            }

            document.getElementById("3").onclick = function () {
                document.getElementById("7").value = "jujia";
            }

            document.getElementById("4").onclick = function () {
                document.getElementById("7").value = "store_fresh";
            }

            document.getElementById("5").onclick = function () {
                document.getElementById("7").value = "fashion_icon";
            }

            document.getElementById("6").onclick = function () {
                document.getElementById("7").value = "import_goods";
            }
        }
    </script>
</head>
<body style="background-color: whitesmoke">
<div class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-2">
                <ul class="tophead-link">
                    <li style="color: #d9edf7"><i> Welcome to Simple Mall Center !</i></li>
                </ul>
            </div>
            <div class="col-md-7 col-sm-7 col-xs-7">
                <div class="search">
                    <form action="/DBDemo/searchServlet">
                        <input type="text" id="in" name="search_goods" placeholder="搜索其实很简单" style="width: 350px; font-size: 16px">
                        <a href="shopping.jsp" class="btn btn-info btn-sm">
                            <input type="button" value="首页" class="glyphicon glyphicon-search" style="color: #d9edf7">
                        </a>
                            <input type="submit" value="搜索" class="glyphicon glyphicon-search" style="color: #d9edf7">

                    </form>
                </div>
            </div>
            <div class="col-md-3">
                <a href="http://localhost:8080/DBDemo/buyPage.jsp"><button type="button" class="btn btn-default">
                    <span input type="button" class="glyphicon glyphicon-shopping-cart"></span> 我的购物车</button>
                </a>
            </div>
        </div>
    </div>
</div><br>

<div class="container">
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="item active">
                <img src="img/1.jpg" style="height: 500px;width: 100%;" alt="First slide">
            </div>
            <div class="item">
                <img src="img/2.jpg" style="height: 500px;width: 100%" alt="Second slide">
            </div>
            <div class="item">
                <img src="img/3.jpg" style="height: 500px;width: 100%"  alt="Third slide">
            </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div><br>

<div class="container">
    <ul class="nav nav-pills nav-justified">
        <form action="/DBDemo/testServlet">
            <li class="col-md-2"><input type="submit" id="1" class="btn-default" value="猜你喜欢" name=""></li>
            <li class="col-md-2"><input type="submit" id="2" class="btn-default" value="智能先锋" name=""></li>
            <li class="col-md-2"><input type="submit" id="3" class="btn-default" value="居家优品" name=""></li>
            <li class="col-md-2"><input type="submit" id="4" class="btn-default" value="超市百货" name=""></li>
            <li class="col-md-2"><input type="submit" id="5" class="btn-default" value="时尚达人" name=""></li>
            <li class="col-md-1"><input type="submit" id="6" class="btn-default" value="进口好货" name=""></li>
            <input id="7" type="hidden" value="" name="pageChoose">
        </form>
    </ul>
</div><br>

<%--<div class="container">
    <div class="row">--%>
<table>
    <%
        //List<Map<String,Object>> list = template.queryForList("select name,price from " + session.getAttribute("page"));
        //List<Map<String,Object>> list = template.queryForList("select name,price from shopcar");
        List<Map<String,Object>> list = (List<Map<String,Object>>)session.getAttribute("List");
        int temp = 0;
        int flag = 0;
        for(Map<String,Object> ObjectMap : list){
            Map<String,String> map = new HashMap<String,String>();
            for(String str : ObjectMap.keySet()){
                map.put(str,ObjectMap.get(str).toString());
            }
            Collection<String> valueCollection = map.values();
            List<String> valueList = new ArrayList<String>(valueCollection);
            String[] valueArray = new String[3];
            map.values().toArray(valueArray);
            //System.out.println(valueArray[0]+"..."+valueArray[1]);
            /*out.print("<div class=\"container\">");
            out.print("<div class=\"row\">");*/
            if(temp==0){
                out.print("<tr>");
            }
            for(int i = 1 ; i >= 0 ; i--){
                Object obj = ObjectMap.values();

                if(i==1){
                    out.print("<td class=\"col-sm-2\">");
                    System.out.println(valueArray[1]);
                    //out.print("<img src=\"img/longxia.jpg\" class=\"img-rounded\" width=\"275\" height=\"275\"><br/>");
                    //out.print("<img src=\"img/Dress.jpg\" class=\"img-rounded\" width=\"275\" height=\"275\"><br/>");
                    String temp_str = valueArray[1];
                    //out.print("<img src=\"img/"+ valueArray[1] + ".jpg\" class=\"img-rounded\" width=\"275\" height=\"275\"><br/>");
                    out.print("<img src=\"img/"+ valueArray[1] + ".jpg\" class=\"img-rounded\" width=\"275\" height=\"275\"><br/>");
                    //out.print("<img src=\"img/Closet.jpg\">");
                }
                if(i==0){
                    //System.out.println(valueArray[0]+"222");
                    out.print("<form action=\"/DBDemo/shopServlet\" method=\"post\">");
                    out.print("<input type=\"text\" value=" + valueArray[1] + " name=good onfocus=this.blur() style=\"color: darkgray; font-size: 17px; border:none;width:200px\">");
                    out.print("<input type=\"text\" value=" + valueArray[0] + " name=good_price onfocus=this.blur() style=\"color: darkgray; font-size: 17px; border:none;width:200px\">");
                    out.print("<input type=\"submit\" value=\"加入购物车\" class=\"btn btn-danger\" class=\"glyphicon glyphicon-shopping-cart\">");
                    out.print("</form>");
                    out.print("</td>");
                }
            }
            if(temp == 3){
                out.print("</tr>");
                flag = 1;
                temp = 0;
            }
            temp++;
            /*out.print("</div>");
            out.print("</div>");*/
        }
        if(flag == 0){
            out.print("</tr>");
        }
    %>
</table>
<%--</div>
</div>--%>
<%--<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <img src="img/1.jpg" class="img-rounded" width="275" height="275"><br>
            <p style="background-color: white; font-size: 25px; color: red">
                <input type="text" value="机械键盘" onfocus=this.blur() style="color: darkgray; font-size: 17px; border:none">
                ¥488 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href=""><button type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车</button>
                </a>
            </p>
        </div>
    </div>
</div>--%>
<a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src=js/jquery-3.2.1.min.js></script>
<script src=js/bootstrap.min.js></script>
<script src=js/owl.carousel.min.js></script>
<script src=js/jquery.mixitup.min.js></script>
<script src=js/jquery.fancybox.min.js></script>
<script src=js/jquery.counterup.min.js></script>
<script src=js/waypoints.min.js></script>
<script src=js/jquery.magnific-popup.min.js></script>
<script src=js/countdown.js></script>
<script src=js/script.js></script>
</body>
</html>