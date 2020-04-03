<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/20/020
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="/style.css">
    <style>
        body{
            background-image: url("/image/3.jpg");
            background-size:100% ;
        }
    </style>

    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[name=account]").val(${account})

        })
       <%--console.log(${account})--%>
    </script>
</head>
<body>


<form action="/user/checkLoginUser">
    <div id="page_container" >

        <div class="input_block">
            <input type="text"  placeholder="account" name="account" />
        </div>

        <div class="input_block">
            <input type="password"  placeholder="password" name="password" />
        </div>
    </div>
    <button type="submit" >Login</button>
    <a href="/user/registerPage">没账号？注册</a>
</form>
</body>
</html>

