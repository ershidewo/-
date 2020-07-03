<%--
  Created by IntelliJ IDEA.
  User: 儿时的我
  Date: 2020/5/27
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>login</title>
  <link href="css/style.css" rel="stylesheet"/>
</head>
<body>
<form action="/DBDemo/Servlet" method="post">
<div class="container">

  <!-- login module -->
  <div class="login-box">
    <div id="login-title">
      Simple Mall Center
    </div>


      <div class="input">
        <input type="text" id="userName" placeholder="Input your userName" name="sno">
      </div>
      <div class="input">
        <input type="password" id="password" placeholder="Input your password" name="password">
      </div>

    <div id="login" style="left: 50%">

      <input type="submit" value="Login" id="login-btn"/>

    </div>


    <div id="register">
      <input type="button" value="To Register" id="to-register-btn" />
    </div>

  </div>

</div>
</form>
</body>
</html>
