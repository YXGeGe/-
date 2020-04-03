<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/19/019
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>

    <link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../easyui/demo/demo.css">
    <script type="text/javascript" src="../../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
</head>
<body>




<div class="easyui-layout" style="width:100%;height:1700px;">
    <div data-options="region:'north',title:'HHH'" style="height:200px;">

    </div>
    <div id="p" data-options="region:'west'" title="选项" style="width:20%;padding:10px">
        <!--<h2>Loading Accordion Content with AJAX</h2>-->
        <!--<p>Click AJAX panel header to load content via AJAX.</p>-->



        <div id="sm" class="easyui-sidemenu" data-options="data:data" style="width: 100%"></div>
        <script type="text/javascript">

            

            var data=${userType}

            // function userType(x) {
            //     switch (x) {
            //         case '0':{
            //             return
            //             [{
            //                 text: '用户管理',
            //                 iconCls: 'icon-sum',
            //                 children: [
            //                     {
            //                         text: '用户查询',
            //
            //                     }]
            //             },{
            //                 text: '比赛审核',
            //                 iconCls: 'icon-sum',
            //                 children: [{
            //
            //                     text: "比赛查询"
            //                 }
            //                 ]
            //             }];
            //         }
            //         case '1':{
            //             return
            //             [{
            //                 text: '用户管理',
            //                 iconCls: 'icon-sum',
            //                 children: [
            //                     {
            //                         text: '用户查询',
            //
            //                     }]
            //             },{
            //                 text: '比赛审核',
            //                 iconCls: 'icon-sum',
            //                 children: [{
            //
            //                     text: "比赛查询"
            //                 }
            //                 ]
            //             }];
            //         }
            //         case '2':{
            //             return
            //              [{
            //                 text: '用户管理',
            //                 iconCls: 'icon-sum',
            //                 children: [
            //                     {
            //                         text: '用户查询',
            //
            //                     }]
            //             },{
            //                 text: '比赛审核',
            //                 iconCls: 'icon-sum',
            //                 children: [{
            //
            //                     text: "比赛查询"
            //                 }
            //                 ]
            //             }];
            //         }
            //     }
                // if(x==='0'){
                //    data= [{
                //         text: '用户管理',
                //         iconCls: 'icon-sum',
                //         children: [
                //             {
                //                 text: '用户查询',
                //
                //             }]
                //     },{
                //         text: '比赛审核',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "比赛查询"
                //         }
                //         ]
                //     }]
                //
                // }
                // else if(x==='1'){
                //   [{
                //         text: '选手管理',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "选手查询"
                //         }
                //         ]
                //     },{
                //         text: '对战管理',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "对战查询"
                //         }
                //         ]
                //     },{
                //         text: '票数管理',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "票数统计查询"
                //         }
                //         ]
                //     },{
                //         text: '投票人记录',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "次数限制"
                //         }
                //         ]
                //     }]
                // }
                // else if (x==='2')
                // {
                //    [{
                //         text: '对战',
                //         iconCls: 'icon-sum',
                //         children: [
                //             {
                //                 text: '对战查询',
                //
                //             }]
                //     }, {
                //         text: '比赛',
                //         iconCls: 'icon-sum',
                //         children: [{
                //
                //             text: "比赛查询"
                //         }
                //         ]
                //     }]
                // }
                // return data
            // }
            function getFun(x){
                if(x===1){
                    $.ajax({
                        url: "/user/getAllUser",
                        type:"post",
                        async: true,
                        dataType: "html",
                        contentType: 'application/json; charset=utf-8',
                        success:function (data) {
                            // console.log(data)
                            console.log("users列表网页加载")
                            $("#center").html(data)

                        },
                        error:function (data) {
                            console.log("users列表网页加载失败")
                        }
                    })


                }

                if(x===2){
                    // $.ajax({
                    //     url: "/user/getAllMatchs",
                    //     type:"post",
                    //     async: true,
                    //     dataType: "html",
                    //     contentType: 'application/json; charset=utf-8',
                    //     success:function (data) {
                    //         $("#center").html(data)
                    //         console.log(data)
                    //     }
                    // })
                    console.log("matchs列表网页加载")
                }
            }

            $(function () {

                <%--console.log(${userType});--%>
               <%--data = userType('${userType}');--%>
                <%--$("#sm").attr("data-options","data:"+data);--%>

                $("span:contains('用户查询')").click(function () {
                    getFun(1)
                })
                $("span:contains('比赛查询')").click(function () {
                    getFun(2)
                })


            });

        </script>
    </div>
    <div data-options="region:'center'" title="内容" id="center">
        <div style="margin-bottom:40px">
            <input class="easyui-textbox" data-options="buttonText:'Search',buttonIcon:'icon-search',prompt:'Search...'" style="width:450px;height:24px;">
    </div>

    </div>
</div>
</div>
</body>
</html>
