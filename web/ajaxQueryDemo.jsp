<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/09/14 0014
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ajaxdemo</title>
    <!--引入bootstrap样式文件--->
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />

    <link href="static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!--引入jquery-->
    <script type="text/javascript" src="static/jQuery/jquery-1.12.4.min.js"></script>
    <!--引入bootstrap脚本--->
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        // 使用jquery进行ajax处理
        function doAjaxQuery() {
            // 使用jquery进行ajax请求处理
            $.ajax({
                type : "POST", // 请求类型
                url : "AjaxQueryDemoAction", // 请求的url
                data : $("#form1").serialize(), // 发送的数据 使用serialize方法替代手动拼写数据串
                dataType : "json", // 响应发挥的数据类型
                success : function(data, textStatus, jqXHR) { // 执行成功之后的回调函数
                    // 回调函数的dom操作

                    // 解析json数据
                    console.info(data);
                    /*
                     注意，如果返回数据为文本类型，需要将json字符串转为json对象
                    each函数解析的是json对象，而不是json字符串
                     */
                    // 解析拼写的html内容
                    var strHtml = "";
                    $.each(data, function(index, eachVal) {
                        strHtml+="<tr>";

                        strHtml+="<th scope='row'>";
                        strHtml+=(index+1);
                        strHtml+="</th>";

                        strHtml+="<td>";
                        strHtml+=eachVal.adminname;
                        strHtml+="</td>";

                        strHtml+="<td>";
                        strHtml+=eachVal.adminaddress;
                        strHtml+="</td>";

                        strHtml+="<td>";
                        strHtml+=eachVal.admintel;
                        strHtml+="</td>";
                        strHtml+="</tr>";
                    });

                    // 把解析的html内容，使用dom操作赋值到表格中
                    $("#displaytbody").html(strHtml);
                },
                error : function(data) {
                    alert("请求失败" + data);
                }
            });
        }
    </script>
</head>
<body>
<form id="form1" class="form-horizontal" action="AjaxQueryDemoAction" method="post">
    <div class="form-group" style="margin-top: 100px;">
        <label class="col-sm-2 control-label col-sm-offset-3">用户名</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="txtUserName" name="adminname" placeholder="请输入用户名">
        </div>
        <label class="col-sm-2 control-label" id="userMsg"></label>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-2">
            <button type="button" class="btn btn-default" onclick="doAjaxQuery()">查询</button>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-7" >
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>地址</th>
                    <th>手机</th>
                </tr>
                </thead>
                <tbody id="displaytbody">
                </tbody>
            </table>
        </div>
    </div>
    <!-- /example -->
</form>
</body>
</html>
