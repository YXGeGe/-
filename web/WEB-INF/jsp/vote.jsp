<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24/024
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1, user-scalable=0" />
    <meta charset="UTF-8">
    <title>投票显示</title>
    <%--<link rel="stylesheet" href="../css/all.css">--%>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        img{
            vertical-align:text-top;
        }
        html{
            width: 100vw;
            height: 100vh;
            background-image: url("../image/1.jpg");
            background-size: 100%
        }
        .mian{
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 100vw;
            height: 70vh;
        }
        .mian img{
            margin-top: auto;
            border-radius:50%;
        }
    </style>
    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <script type="text/javascript">
        var p1;
        var p2;
        function getVote(matchid,battlid){
            $.ajax({
                url: "/vote/getOneVote?matchId="+matchid+"&battleId="+battlid,
                type:"post",
                dataType:"json",
                success: function (res) {
                    console.log(res.list[0].vote1)
                    console.log(res.list[0].vote2)
                    $("#vote1").text(res.list[0].vote1+"票")
                    p1 = res.list[0].vote1
                    $("#vote2").text(res.list[0].vote2+"票")
                    p2 = res.list[0].vote2

                }

            })

        }
        function addVote(matchId,battleId,who){
            $.ajax({
                url: "/vote/AddOneVote?matchId="+matchId+"&battleId="+battleId+"&who="+who+"&userId=${userId}",
                type:"get",
                dataType:"json",
                success: function (res) {

                if (res.limit=="error") {
                   alert("本场投票已经达5票限制")
                }
                }

            })

        }
        $(function () {
            addVote(${matchId},${battleId},3)
            setInterval(function () {
                getVote(${matchId},${battleId})
            },1000)
            $("#p1").click(function () {
                console.log("xxx")
                addVote(${matchId},${battleId},1)
            })
            $("#p2").click(function () {
                addVote(${matchId},${battleId},2)
            })
        })

    </script>

</head>
<body>
<p style="width: 100%;text-align: center; font-size: 4rem;background-color: whitesmoke">投票</p>
<div class="mian">
    <div  align="center" style="width: 30%;height:400px;background-color: #00BFFF;">
        <img src="../image/xs1.jpg"  width="50%"/>
        <p id="vote1" style="width: 50%;text-align: center;font-size: 2rem;"></p>
        <p style="width: 100%;text-align: center;font-size: 2rem;">选手名：${playerOne}</p>
        <p id="p1">
            <button  class="layui-btn" style="width: 50%;text-align: center;font-size: 2rem;">投一票</button>
        </p>
    </div>
    <div ><p style="width: 100%;text-align: center;font-size: 60px;color: red;padding-top: 3em;">vs</p></div>
    <div align="center" style="width: 30%;height: 400px;background-color: #00BFFF;">
        <img src="../image/xs2.jpg" width="50%" />
        <p id="vote2" style="width: 50%;text-align: center;font-size: 2rem;"></p>
        <p style="width: 100%;text-align: center;font-size: 2rem;">选手名：${playerTwo}</p>
        <p id="p2">
            <button  class="layui-btn" style="width: 50%;text-align: center;font-size: 2rem;">投一票</button>
        </p>
    </div>
</div>
</body>
</html>
