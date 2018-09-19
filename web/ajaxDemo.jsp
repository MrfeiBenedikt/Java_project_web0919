<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/09/14 0014
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ajaxdemo</title>
    <!--引入bootstrap样式文件--->
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"/>

    <link href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
          media="screen">
    <!--引入jquery-->
    <script type="text/javascript" src="static/jQuery/jquery-1.12.4.min.js"></script>
    <!--引入bootstrap脚本--->
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">



        // // 一、使用ajax进行验证-get
        // function checkUnique_get() {
        //     // 1、创建一个XMLHttpRequest代理对象
        //     var xmlhttp;
        //     if (window.XMLHttpRequest) {
        //         // code for IE7+, Firefox, Chrome, Opera, Safari
        //         xmlhttp = new XMLHttpRequest();
        //     } else {
        //         // code for IE6, IE5
        //         xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        //     }
        //     // 2、建立请求连接
        //     var url = "AjaxDemoAction?adminname=" + document.getElementById("txtUserName").value;
        //     xmlhttp.open("get", url, true); // ture是异步，false是同步；默认是true；
        //     // 发送请求
        //     // 发送的数据形式为：变量名=变量值&变量名=变量值...
        //     // 注意：如果需要直接将表单的值映射给实体类的属性，则需要发送的变量名和实体类的属性名一致
        //     // 组织发送的数据
        //     //var data = ...;
        //     xmlhttp.send(null);
        //     // 3、回调处理
        //     // 会调用函数
        //     xmlhttp.onreadystatechange = function () {
        //         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        //             // 使用dom操作进行html页面局部刷新
        //             //document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
        //             //获取服务影响的文本内容
        //             var txtMsg = xmlhttp.responseText;
        //             alert(txtMsg);
        //         }
        //     }
        // }
        //
        //
        // // 二、使用ajax进行验证-post
        // function checkUnique_post() {
        //     // 1、创建一个XMLHttpRequest代理对象
        //     var xmlhttp;
        //     if (window.XMLHttpRequest) {
        //         // code for IE7+, Firefox, Chrome, Opera, Safari
        //         xmlhttp = new XMLHttpRequest();
        //     } else {
        //         // code for IE6, IE5
        //         xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        //     }
        //     // 2、建立请求连接
        //     var url = "AjaxDemoAction";
        //     xmlhttp.open("post", url, true); // ture是异步，false是同步；默认是true；
        //     // 发送请求
        //     // 设置header头格式
        //     xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        //     // 发送的数据形式为：变量名=变量值&变量名=变量值...
        //     // 注意：如果需要直接将表单的值映射给实体类的属性，则需要发送的变量名和实体类的属性名一致
        //     // 组织发送的数据
        //     var data = "adminname=" + document.getElementById("txtUserName").value;
        //     xmlhttp.send(data);
        //     // 3、回调处理
        //     // 会调用函数
        //     xmlhttp.onreadystatechange = function () {
        //         // 清除上一次遗留内容
        //         document.getElementById("userMsg").innerHTML = "";
        //         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        //             // 4和200表示ajax的请求已经成功
        //             // 使用dom操作进行html页面局部刷新
        //             // 获取服务影响的文本内容
        //             var txtMsg = xmlhttp.responseText;
        //             //alert(txtMsg);
        //             document.getElementById("userMsg").innerHTML = txtMsg;
        //         }
        //     }
        // }


        // 使用jquery进行ajax处理
        function checkUnique_jquery() {
            // 使用jquery进行ajax请求处理
            $.ajax({
                type: "POST",  // 请求类型
                url: "AjaxDemoAction", // 请求的url
                data: $("#form1").serialize(), // 发送的数据 使用serialize方法替代手动拼写数据串
                //dataType:text, // 响应发挥的数据类型
                success: function (data, textStatus, jqXHR) { // 执行成功之后的回调函数
                    // 回调函数的dom操作
                    $("#userMsg").html(data + "--" + textStatus);
                    console.info(jqXHR);
                },
                error: function (data) {
                    alert("请求失败" + data);
                }
            });
        }

    </script>
</head>
<body>
<form id="form1" class="form-horizontal" action="AjaxDemoAction" method="post">
    <div class="form-group" style="margin-top: 100px;">
        <label class="col-sm-2 control-label col-sm-offset-3">用户名</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="txtUserName" name="adminname" placeholder="请输入用户名">
        </div>
        <label class="col-sm-2 control-label" id="userMsg"></label>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-2">
            <button type="button" class="btn btn-default" onclick="checkUnique_jquery()">唯一性验证</button>
        </div>
    </div>
</form>
</body>
</html>
