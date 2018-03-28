<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<html>
<head>
    <script>
        $('#user_name').blur(function(){
            var user_name = $('#user_name').val();
            if(user_name != ""){
            var user = {user_name:user_name}
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkUserName.action",
                data:user,
                type:'post',
                success:function(){
                    document.getElementById("info").innerHTML="";
                },
                error:function(){
                    document.getElementById("info").innerHTML="该用户不存在，请检查用户名是否正确！";
                }
            });
            }
        });
        $('#login').click(function (){
            var user_name = $('#user_name').val();
            var user_password = $('#user_password').val();
            if(user_name == "" || user_password == ""){
                alert("账户密码不能为空！！！");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/userLogin.action",
                    data : {
                        user_name:user_name,
                        user_password:user_password
                    },
                    type:'post',
                    success:function(responseText){
                        $("#content").html(responseText);
                        window.location.reload();
                    },
                    error:function(){
                        document.getElementById("info").innerHTML="密码错误!!!";
                    }
                });
            }
        });
    </script>
</head>
<body>
<div align="center">
    <label>用户登录</label>
    <p id="info" style="color:#ff0000"></p>
    <form role="form">
        <div style="width:250px;">
        <div class="input-group form-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
          <input class="form-control" type="text" placeholder="用户名/手机号/邮箱" id="user_name" onfocus="javascript:document.getElementById('info').innerHTML='';">
       </div>

       <div class="input-group form-group">
          <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
          <input class="form-control" type="password" placeholder="密码" id="user_password" onfocus="javascript:document.getElementById('info').innerHTML='';">
       </div>
       <button class="btn btn-info form-control" type="button" id="login">登录</button>


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
