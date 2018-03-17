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
<div align="center" >
    <label>密码找回</label>
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
                     <span class="glyphicon glyphicon-question-sign"></span>
                 </span>
                <input id="user_question" type="text" class="form-control"
                       placeholder="密保问题">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-pencil"></span>
                 </span>
                <input id="user_answer" type="text" class="form-control"
                       placeholder="密保答案">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-lock"></span>
                 </span>


                <input id="user_password" type="password" class="form-control"
                       placeholder="重置密码">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-lock"></span>
                 </span>

                <input id="user_password2" type="password" class="form-control"
                       placeholder="确认密码">
            </div>


            <button type="submit" class="btn btn-info form-control">确认</button>
            <br/><br/>
            <button type="button" class="btn btn-default form-control" style="background-color: #a9a9a9"
                    onclick="script:window.history.back();location.reload();">取消</button>
        </div>

    </form>
</div>
</body>
</html>
