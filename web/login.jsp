<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/09/12 0012
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录主页</title>
    <!--引入bootstrap样式文件--->
    <link rel="stylesheet" type="text/css"
          href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css"
          href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />

    <link
            href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
            rel="stylesheet" media="screen">
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
        $(function(){
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
<form class="form-horizontal" action="LoginAction" method="post">
    <!-- 约定：表达的name属性值和数据库的字段名保持一致【大小写敏感】 -->
    <div class="form-group" style="margin-top: 100px;">
        <label class="col-sm-2 control-label col-sm-offset-3">用户名</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="txtUserName"
                   name="adminname" placeholder="请输入用户名">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label col-sm-offset-3">密码</label>
        <div class="col-sm-3">
            <input type="password" class="form-control" id="txtUserPsw"
                   name="adminpsw" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label col-sm-offset-3">注册日期</label>
        <div class="col-sm-3">
            <div class="input-append date form_datetime">
                <input size="16" type="text" value="" id="regDate" name="regDate"
                       readonly> <span class="add-on"><i class="icon-th"></i></span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-2">
            <button type="submit" class="btn btn-default">登录</button>
        </div>
        <div class="col-sm-2">
            <button type="reset" class="btn btn-default">重置</button>
        </div>
    </div>
</form>
</body>

</html>
