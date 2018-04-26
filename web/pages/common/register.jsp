<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
    <script>
        $('#user_name').blur(function(){
            var user_name = $('#user_name').val();
            var user = {user_name:user_name}
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkUserName.action",
                data:user,
                type:'post',
                success:function(){
                    document.getElementById("info").innerHTML="该用户名已被注册！";
                }
            });
        });
        $('#user_phone').blur(function(){
            var user_phone = $('#user_phone').val();
            var user = {user_phone:user_phone}
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkUserName.action",
                data:user,
                type:'post',
                success:function(){
                    document.getElementById("info").innerHTML="该手机号已被注册！";
                }
            });
        });

        $('#user_checkpassword').blur(function(){
            var pas1 = $('#user_password').val();
            var pas2 =  $('#user_checkpassword').val();
           if( pas1 != pas2)
               alert("两次密码输入不一致！！！");
        });

        $('#user_email').blur(function (){
            var user_email = $('#user_email').val();
            var user = {user_email:user_email}
            var reg = new RegExp("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?");
            if(user_email !=""){
                if(!reg.test(user_email))
                    document.getElementById("info").innerHTML="请输入有效邮箱地址!!!";
                else
                    document.getElementById("info").innerHTML="";
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/user/checkUserName.action",
                data:user,
                type:'post',
                success:function(){
                    document.getElementById("info").innerHTML="该邮箱已被注册！";
                }
            });
        });
        $('#register').click(function(){
            var user_name = $('#user_name').val();
            var user_password = $('#user_password').val();
            var user_phone = $('#user_phone').val();
            var user_email = $('#user_email').val();
            var user_question = $('#user_question').val();
            var user_answer = $('#user_answer').val();
            var user = {user_name:user_name,
                user_password:user_password,
                user_phone:user_phone,
                user_email:user_email,
                user_question:user_question,
                user_answer:user_answer};
            $.ajax({
                url:"${pageContext.request.contextPath}/user/userRegister.action",
                data:user,
                type:'post',
                success:function(response){
                    if("ERROR".isEqual(response)) {
                        $('#content').html(response);
                        alert("注册成功！！！");
                    }else
                        alert("注册失败！");
                },
                error:function(){
                    alert("注册失败！");
                }
            });
        });
    </script>
</head>

<body>
<div  align="center">
    <label>用户注册</label>
    <p id="info" style="color:#ff0000;"></p>
    <form role="form">
        <div style="width:250px;">
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-user"></span>
                 </span>
                <input id="user_name" type="text" class="form-control"
                       placeholder="用户名" onfocus="javascript:document.getElementById('info').innerHTML='';">
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
                       placeholder="手机号" onfocus="javascript:document.getElementById('info').innerHTML='';">
            </div>
            <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-envelope"></span>
                 </span>
                <input id="user_email" type="text" class="form-control"
                       placeholder="邮箱" onfocus="javascript:document.getElementById('info').innerHTML='';">
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
            <button type="submit" class="btn btn-info form-control" id="register">注册</button>
        </div>

    </form>
    </br> <a style="cursor:pointer" href="#" onclick="userLogin();">已有用户？去登录!</a>
</div>
</body>
</html>
