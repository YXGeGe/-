<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24/024
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <script type="text/javascript" src="/layer/layer.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<button class="layui-btn layui-btn-primary" id="addMatch">添加比赛</button>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
        <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
        <%--<button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>

    </div>
</script>

<script type="text/html" id="barDemo">


    <a class="layui-btn layui-btn-xs" lay-event="edit">添加选手</a>
    <a class="layui-btn layui-btn-xs" lay-event="del">添加对战</a>
</script>

<script src="/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
    function battle(a) {
        $.ajax({
            url: '/battle/AddBattleByTwo?matchId='+a,
            type: "get",
            dataType: "json",
            success:function(data){
                if (data.flag=="error"){
                    console.log("选手插入battle错误");
                }
                battle_player(a)
            }
        });
    }

    function battle_player(a) {
        $.ajax({
            url: '/battle/AddBattle_Player?matchId='+a,
            type: "get",
            dataType: "json",
            success:function(data){
                if (data.flag=="error"){
                    console.log("选手插入比赛错误");
                }
                layer.msg("已经分配场次")
            }
        });
    }
    $(function () {

        $('#addMatch').on('click', function(){
            layer.open({
                title: '提交比赛',
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                area: ['500px', '220px'], //宽高
                content: '/match/getAddMatchPage?userId=${userId}', //弹出的页面
                shadeClose: true, //点击遮罩关闭

                end: function () {

                    window.location.reload();
                },
                btn:function () {

                }

            });

        });
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/match/getMyMatchs?userId=${userId}'
                ,toolbar: '#toolbarDemo'
                ,title: '用户数据表'
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}

                    ,{field:'matchId', title:'ID', width:120, sort: true}
                    ,{field:'matchName', title:'比赛名称', width:100}
                    ,{field:'matchDate', title:'比赛日期', width:120}
                    ,{field:'userId', title:'发布人id', width:120}
                    ,{field:'status', title:'发布状态', width:120}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            //头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：'+ data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
                        break;
                };
            });

            //监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                //console.log(obj)
                if(obj.event === 'del'){
                    // layer.confirm('真的删除行么', function(index){
                    //     obj.del();
                    //     layer.close(index);
                    // });
                    battle(data.matchId)
                } else if(obj.event === 'edit'){
                    var a
                    if(data.status===0){
                        a="未审核通过不可添加选手";
                        layer.prompt(

                            {formType: 3
                                ,value: a},
                            function(value, index){



                                layer.close(index);
                            });
                    }
                    else{
                        layer.open({
                            title: '提交选手',
                            type: 2,
                            skin: 'layui-layer-rim', //加上边框
                            area: ['40%', '50%'], //宽高
                            content: '/player/getAllPlayerPage?matchId='+data.matchId, //弹出的页面
                            shadeClose: true, //点击遮罩关闭
                        });
                    }

                }
            });
        });
    })

    $.ajax()

</script>

</body>
</html>
