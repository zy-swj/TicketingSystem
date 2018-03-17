<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<html>
<head>

</head>
<body>
<div align="center">
    <label>用户登录</label>
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
       <button class="btn btn-info form-control" type="submit">登录</button>
        </div>
    </form>
   <br/>
   <br/>
   <a href="#" onclick="userRegister()">没有用户？去注册！</a>
    <br/>
    <br/>
    <a href="#" onclick="findPassword();">忘记密码？</a>
</div>
</body>
</html>
