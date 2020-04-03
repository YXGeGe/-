<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/19/019
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/easyui/demo/demo.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function xiuGai(){
            $.ajax({
                url:"/user/changeOneUser",
                type:"post",
                dataType:"json",
                data: $('#myForm').serialize(),
                success:function (data) {
                    $(".span8 .table-hover").html(

                    )
                },
                error:function (data) {

                },
                complete: function () {
                    // $("span8").load("/user/getAllUser .table-hover");
                    //window.location.reload();
                }

            })

        }
        function shanChu(userId){
            $.ajax({
                url:"/user/deleteOneUser",
                type:"post",
                dataType:"json",
                data:{"userId":userId},
                success:function (data) {
                    console.log(data)
                    <%--for(let x;x<data.user.length;x++){--%>
                        <%--$("tbody").html("<tr>\n" +--%>
                            <%--"                    <td>${data.user[x].userId}</td>\n" +--%>
                            <%--"                    <td>${data.user[x].userIdt}</td>\n" +--%>
                            <%--"                    <td>${data.user[x].userId}</td>\n" +--%>
                            <%--"                    <td>${data.user[x].userId}</td>\n" +--%>
                            <%--"                    <td><div class=\"btn-group\">\n" +--%>
                            <%--"                        <button class=\"btn btn-small btn-primary\" value=\"${data.user[x].userId}\"><i class=\"icon-wrench\"></i></button>\n" +--%>
                            <%--"                    <button class=\"btn btn-small\"  value=\"${data.user[x].userId}\" id=\"btn2\" onclick=\"shanChu(this.value)\"><i class=\"icon-remove\"></i></button>\n" +--%>
                            <%--"                    </div></td>\n" +--%>
                            <%--"\n" +--%>
                            <%--"                    </tr>")--%>
                    <%--}--%>

                },
                error:function (data) {

                },
                complete: function () {
                    // $(".row-fluid").load("user/getAllUser.span8");
                    //window.location.reload();
                    console.log($("#userId").val())
                }


            })


        }
        function search(userId){


            $.ajax({
                url:"/user/getOneUser",
                type:"post",
                dataType:"json",
                data:{"userId":userId},
                success:function (data) {
                    // console.log(data);
                    // $(".span8").html(data)
                },
                error:function (data) {
                    // $(".row-fluid").load("user/getAllUser.span8");

                },
                complete: function () {

                    //window.location.reload();
                    // console.log($("#userId").val())
                }


            })
        }

        function checkUsername(account){
            $.ajax({
                url:"/user/checkRegisterUser",
                type:"post",
                dataType:"json",
                data:{"account":account},
                success:function (data) {
                    if(data.flag==="0"){
                        $("#account").text(data.Msg)
                        $("[name=submit]").attr('disabled',false).text("修改")
                    }
                    if (data.flag==="1") {
                        $("#account").text(data.Msg)
                        $("[name=submit]").attr('disabled',true).text("不可修改")
                    }
                },
                error:function (data) {

                    console.log(data)
                }
            })
        }
        $(function () {
            console.log("xxxxx")
            $("#btn1").click(function () {
                console.log("修改的那个ID"+this.value);
                if (this.value.trim()==null||this.value.trim()=="") {
                    alert("左边点击修改");
                }else {
                    alert("右边表单修改userId="+this.value+"的属性");
                    $("#userId").val(this.value)
                }

            })
            $( "#btn2").click(function () {
                console.log("x")
                // console.log("删除的那个ID"+this.value);

                // shanChu(this.value)
            })


            $("#sbtn").click(function () {
                console.log($("#sText").val())

                search($("#sText").val())
            })
            $("[name=account]").blur(function () {
                // console.log(this.value)
                if(this.value.trim()!==null&&this.value.trim()!=="")
                {
                    $("[name=submit]").attr('disabled',false).text("修改")
                    checkUsername($(this).val())
                }
                else
                {
                    $("[name=submit]").attr('disabled',true).text("不可修改")

                }
            })
        })

    </script>
</head>
</head>
<body>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<input type="text"  style="width:450px;height:40px;" id="sText"><button class="btn btn-mini" type="button" id="sbtn">搜索</button>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span8">
            <table class="table table-hover">
                <caption>用户查询</caption>
                <thead>
                <tr>
                    <th>用户ID</th>
                    <th>用户账号</th>
                    <th>用户密码</th>
                    <th>用户类型</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${users}" var="item">
                    <tr>
                        <td>${item.userId}</td>
                        <td>${item.account}</td>
                        <td>${item.password}</td>
                        <td>${item.userType}</td>
                        <td><div class="btn-group">
                            <button class="btn btn-small btn-primary" value="${item.userId}"><i class="icon-wrench"></i></button>
                            <button class="btn btn-small"  value="${item.userId}" id="btn2" onclick="shanChu(this.value)"><i class="icon-remove"></i></button>
                        </div></td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="span4">
            <form class="form-inline" onsubmit="return false" action="##" method="post" id="myForm">
                <input type="hidden"   id="userId" name="userId">
                <input type="text"  class="input-large" placeholder="Account" name="account">
                <input type="text" class="input-large" placeholder="Password" name="password">
                <input type="text" class="input-large" placeholder="UserType" name="userType">
                <button type="submit" class="btn" onclick="xiuGai()" name="submit">修改</button>
                <input type="reset" value="重置">
            </form>
        </div>
    </div>


</div>



</body>
</html>
