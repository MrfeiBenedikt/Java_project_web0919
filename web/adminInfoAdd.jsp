<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/09/15 0015
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息新增</title>
    <!--引入bootstrap样式文件--->
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />

    <link href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        #mainBody {
            width: 95%;
            margin: 0px auto;
        }
    </style>
    <!--引入jquery-->
    <script type="text/javascript"
            src="static/jQuery/jquery-1.12.4.min.js"></script>
    <!--引入bootstrap脚本--->
    <script type="text/javascript"
            src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"
            charset="UTF-8"></script>
    <script type="text/javascript"
            src="static/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.fr.js"
            charset="UTF-8"></script>
    <script type="text/javascript">
        $(function() {
            $(".form_datetime").datetimepicker({
                format : "yyyy-mm-dd hh:ii",
                autoclose : true,
                todayBtn : true,
                pickerPosition : "bottom-left"
            });
        });
    </script>
</head>
<body>
<div id="mainBody">
    <form class="form-horizontal" action="AdminInfoAddAction" enctype="multipart/form-data" method="post">
        <div class="form-group" style="margin-top: 10px;">

            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="adminname"
                       name="adminname" placeholder="请输入用户名">
            </div>

            <label class="col-sm-2 control-label">地址</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="adminaddress"
                       name="adminaddress" placeholder="请输入地址">
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="adminpsw"
                       name="adminpsw" placeholder="请输入密码">
            </div>

            <label class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="adminpsw2"
                       name="adminpsw2" placeholder="请输入密码">
            </div>


        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">电话</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="admintel"
                       name = "admintel" placeholder="请输入联系电话">
            </div>


            <label class="col-sm-2 control-label">注册日期</label>
            <div class="col-sm-3">
                <input type="date" class="form-control" id="regdate" name="regdate"
                       placeholder="请输入联系电话">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">头像</label>
            <div class="col-sm-3">
                <input type="file" class="form-control" id="adminimg" name = "adminimg">
            </div>

        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">保存</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
