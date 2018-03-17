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
<div  align="center">
    <label>用户注册</label>
    <form role="form">
        <div style="width:250px;">
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-user"></span>
                 </span>
                <input id="user_name" type="text" class="form-control"
                       placeholder="用户名">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-lock"></span>
                 </span>
                <input id="user_password" type="password" class="form-control"
                       placeholder="密码">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-lock"></span>
                 </span>

                <input id="user_checkpassword" type="password" class="form-control"
                       placeholder="确认密码">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-phone"></span>
                 </span>
                <input id="user_phone" type="text" class="form-control"
                       placeholder="手机号">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-envelope"></span>
                 </span>
                <input id="user_email" type="text" class="form-control"
                       placeholder="邮箱">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-question-sign"></span>
                 </span>
                <input id="user_question" type="text" class="form-control"
                       placeholder="设置密保问题">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-pencil"></span>
                 </span>
                <input id="user_answer" type="text" class="form-control"
                       placeholder="设置密保答案">
            </div>
            <button type="submit" class="btn btn-info form-control">注册</button>
        </div>

    </form>
    </br> <a style="cursor:pointer" href="#" onclick="userLogin();">已有用户？去登录!</a>
</div>
</body>
</html>
