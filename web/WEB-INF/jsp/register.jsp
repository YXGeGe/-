<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/20/020
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>register</title>
    <link rel="stylesheet" type="text/css" href="/style.css">
    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <style>
        body{
            background-image: url("/image/5.jpg")
        }
    </style>
    <script type="text/javascript">
        // JavaScript Document
        function checkUsername(account){
            $.ajax({
                url:"/user/checkRegisterUser",
                type:"post",
                dataType:"json",
                data:{"account":account},
                success:function (data) {
                    if(data.flag==="0"){
                        $("#account").text(data.Msg)
                        $("[name=submit]").attr('disabled',false).text("Register")
                    }
                    if (data.flag==="1") {
                        $("#account").text(data.Msg)
                        $("[name=submit]").attr('disabled',true).text("Can't Register")
                    }
                },
                error:function (data) {
                    console.log(data)
                }
            })
        }
        $(function () {
            $("[name=account]").blur(function () {
                // console.log(this.value)
                if(this.value.trim()!==null&&this.value.trim()!=="")
                {
                    $("[name=submit]").attr('disabled',false).text("Register")
                    checkUsername($(this).val())
                }
                else
                {
                    $("[name=submit]").attr('disabled',true).text("Can't Register")
                    $("#account").text("不合法")
                }
            })
        })

    </script>
</head>
<body>
<form action="/user/insertOneUser" method="post">
    <div id1="page_container" style="width: 300px;margin: auto;margin-top: 50px;background-color:transparent;">
        <div class="input_block">
            <input type="text" name="account">
            <div id="account" style="color: rgb(34, 4, 83);float: left;"></div>
        </div>

        <div class="input_block">
            <input type="password" name="password"/>
            <div id="password" style="color: rgb(34, 4, 83);float: left;"></div>
        </div>


    </div>
    <button type="submit" name="submit">Register</button>
</form>

</body>
</html>

