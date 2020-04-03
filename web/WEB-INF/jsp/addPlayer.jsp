<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24/024
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">选手名称</label>
        <div class="layui-input-inline">
            <input type="text" name="playerName" required lay-verify="required" placeholder="请输入选手名称" autocomplete="off" class="layui-input" autofocus="autofocus">
        </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="btn">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>

        $(function () {
               $("#btn").click(function () {
                   tijiao();
                   console.log($("[name=playerName]").val())
               })
        })
        function tijiao(){
            $.ajax({
                url: '/player/AddOnePlayer?playerName='+$("[name=playerName]").val(),
                type: "get",
                dataType: "json",
                success:function(data){

                    // alert("已经插入"+$("[name=playerName]").val())


                }


            });
        }



</script>

</body>
</html>
