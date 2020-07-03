<%--
  Created by IntelliJ IDEA.
  User: 儿时的我
  Date: 2020/6/30
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/cartStyle.css">
    <title>Document</title>
</head>

<body>
<div class="content">
    <div class="logo">
        <img src="image/dd_logo.jpg" alt=""><span>关闭</span>
    </div>
    <div class="cartList">
        <ul>
            <li>¥<input type="text" name="price" value="21.90"></li>
            <li><input type="button" name="minus" value="-"><input type="text" name="amount" value="2"><input type="button" name="plus" value="+"></li>
            <li id="price0">¥21.90</li>
            <li>
                <p>移入收藏</p>
                <p>删除</p>
            </li>
        </ul>
        <ul>
            <li>¥<input type="text" name="price" value="24.00"></li>
            <li><input type="button" name="minus" value="-"><input type="text" name="amount" value="3"><input type="button" name="plus" value="+"></li>
            <li id="price1">¥24.00</li>
            <li>
                <p>移入收藏</p>
                <p>删除</p>
            </li>
        </ul>
        <ol>
            <li id="totalPrice">&nbsp;</li>
            <li onclick="jiesuan()"><span>结 算</span></li>
        </ol>
    </div>
    <p id="c1"></p>
</div>

<script>
    function jiesuan() {
        const show = document.getElementById("c1");
        const elobj = document.getElementsByClassName("cartList")[0];
        const price = elobj.firstElementChild.firstElementChild.firstElementChild.value;
        const number = elobj.firstElementChild.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.value;
        const totalPrice = parseFloat(price * number);
        const price1 = elobj.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.value;
        const number1 = elobj.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.value;
        const totalPrice1 = parseFloat(price1 * number1);
        show.innerHTML = `白岩松 白说：${totalPrice}<br>
                              岛上书店：${totalPrice1}<br>
                              总价：${totalPrice+totalPrice1}<br>`;
    }
</script>
</body>

</html>