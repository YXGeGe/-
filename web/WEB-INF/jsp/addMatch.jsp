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
        <label class="layui-form-label">比赛名称</label>
        <div class="layui-input-inline">
            <input type="text" name="matchName" required lay-verify="required" placeholder="请输入比赛名称" autocomplete="off" class="layui-input">
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">比赛日期</label>
        <div class="layui-input-inline">
            <input type="text" name="matchDate" required lay-verify="required" placeholder="请输入比赛时间" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="btn">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>

     function closeA(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        //layer.msg(index);
        parent.layer.close(index); //再执行关闭
    }


    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            $.ajax({
                url: '/match/AddOneMatch?userId=${userid}',
                type: "get",
                dataType: "json",
                data:{matchName:data.field.matchName,matchDate:data.field.matchDate},
                success:function(data){

                        layer.msg('提交成功');

                        // parent.$("#reFresh").click();//通过触发页面局部刷新按钮来刷新父页面更新修改后的表格数据
                    }


            });
            closeA()
            return false;
        });
    });
</script>
</body>
</html>
