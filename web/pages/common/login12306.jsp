<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
    <div align="center">
        <label>登录我的12306</label>
        <form role="form">
            <div style="width:250px;">
                <div class="input-group form-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input class="form-control" type="text" placeholder="用户名/手机号/邮箱">
                </div>

                <div class="input-group form-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input class="form-control" type="text" placeholder="密码">
                </div>
                <div id="yanzhengma">
                </div>
                <button class="btn btn-info form-control" type="submit">登录</button>
            </div>
        </form>
    </div>
</body>
</html>
