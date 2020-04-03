<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/23/023
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>TOUPIAO投票系统</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">TOUPIAO投票系统</div>


        <ul class="layui-nav layui-layout-right"  >
            <li class="layui-nav-item">

                <dl class="layui-nav-child">

                </dl>
            </li>
            <li class="layui-nav-item"><a href="/user/loginPage">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:forEach items="${Functions}" var="item">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">${item.funName1}</a>
                    <dl class="layui-nav-child">
                        <dd><a href='${item.funNameUrl}?userId=${userId}' target="myframe">${item.funName2}</a></dd>

                    </dl>
                </li>
                </c:forEach>


            </ul>
        </div>
    </div>

    <div class="layui-body" class="layui-bg-blue">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><iframe  frameborder="0" id="myframe" style="width: 100%; "  height="800px" name="myframe"></iframe>        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        投票系统
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    <%--console.log(${userId})--%>
</script>
</body>
</html>
