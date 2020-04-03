<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24/024
  Time: 22:49
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
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">添加选中的选手到比赛中</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>


<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    function closeA(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        //layer.msg(index);
        parent.layer.close(index); //再执行关闭
    }
    var x=0;
    var y=0;
    var z=0;
    $(function () {
        $(":contains(添加选中的选手到比赛中)").click()
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/player/getAllPlayers'
                ,toolbar: '#toolbarDemo'
                ,title: '用户数据表'
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field:'playerId', title:'选手序号', width:120}
                    ,{field:'playerName', title:'选手名称', width:120}

                ]]
                ,page: true
            });

            //头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getCheckData':
                        var data = checkStatus.data;

                        for(var i = 0;i<data.length;i++){
                            tijiao(data[i].playerId)
                        }
                        // if (data.length%2===0){
                        //     x=data.length
                        // }
                        // else {
                        //     x=data.length-1
                        // }

                        // for(var i=1;i<=x/2;i++){


                        // }

                        // layer.msg("依次两个选手为一个battle添加完成")

                        closeA()
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
            function tijiao(a){
                $.ajax({
                    url: '/player/AddPlayersInMatch?playerId='+a+"&matchId=${matchId}",
                    type: "get",
                    dataType: "json",
                    success:function(data){
                        if (data.flag=="error"){
                            console.log("已经有选手在这个比赛中了");
                        }

                    }
                });
            }
            <%--function battle() {--%>
                <%--$.ajax({--%>
                    <%--url: '/battle/AddBattleByTwo?matchId=${matchId}',--%>
                    <%--type: "get",--%>
                    <%--dataType: "json",--%>
                    <%--success:function(data){--%>
                        <%--if (data.flag=="error"){--%>
                            <%--console.log("选手插入battle错误");--%>
                        <%--}--%>
                        <%--battle_player()--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
            // function battle_player() {
                <%--$.ajax({--%>
                    <%--url: '/battle/selectAllBattle?matchId=${matchId}',--%>
                    <%--type: "get",--%>
                    <%--dataType: "json",--%>
                    <%--success:function(res){--%>
                    <%--if(res.battles.length%2===0){--%>
                        <%--y = res.battles.length--%>
                    <%--}else--%>
                    <%--{--%>
                        <%--y = res.battles.length+1--%>
                    <%--}--%>
                        <%--$.ajax({--%>
                            <%--url: '/player/selectAllPlayer?matchId=${matchId}',--%>
                            <%--type: "get",--%>
                            <%--dataType: "json",--%>
                            <%--success:function (rs) {--%>
                               <%--for(var i=0;i<y;i++){--%>
                                   <%--for(var j=i;j<i+2;j++){--%>
                                       <%--$.ajax({--%>
                                           <%--url: '/battle/AddPlayerInBattle?battleId='+res.battles[i].battleId+"&playerId="+rs.players[j],--%>
                                           <%--type: "get",--%>
                                           <%--dataType: "json",--%>
                                           <%--success:function () {--%>

                                           <%--}--%>
                                       <%--})--%>
                                   <%--}--%>
                                   <%--$.ajax({--%>
                                       <%--url: '/battle/AddNullInVote?battleId='+res.battles[i].battleId+"&matchId=${matchId}",--%>
                                       <%--type: "get",--%>
                                       <%--dataType: "json",--%>
                                       <%--success:function () {--%>

                                       <%--}--%>
                                   <%--})--%>
                                   <%--console.log("xxx")--%>
                               <%--}--%>
                            <%--}--%>
                        <%--})--%>
                    <%--}--%>
                <%--});--%>
                <%--$.ajax({--%>
                    <%--url: '/battle/AddBattle_Player?matchId=${matchId}',--%>
                    <%--type: "get",--%>
                    <%--dataType: "json",--%>
                    <%--success:function(data){--%>
                        <%--if (data.flag=="error"){--%>
                            <%--console.log("选手插入比赛错误");--%>
                        <%--}--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
            //监听行工具事件
            // table.on('tool(test)', function(obj){
            //     var data = obj.data;
            //     //console.log(obj)
            //     if(obj.event === 'del'){
            //         layer.confirm('真的删除行么', function(index){
            //             obj.del();
            //             layer.close(index);
            //         });
            //     } else if(obj.event === 'edit'){
            //         layer.prompt({
            //             formType: 2
            //             ,value: data.status
            //         }, function(value, index){
            //             $.ajax({
            //                 url: "/match/changeOneMatch?matchId="+data.matchId+"&status="+value,
            //                 type:"post",
            //                 dataType:"json",
            //                 success: function (res) {
            //                     if(res.flag==="success"){
            //                         layer.msg('修改成功');
            //                     }
            //
            //                 }
            //             })
            //             obj.update({
            //                 status : value
            //             });
            //             layer.close(index);
            //         });
            //     }
            // });
        });
    })


</script>

</body>
</html>
