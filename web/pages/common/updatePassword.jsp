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
         $('#updatePassword').click(function(){
             var user_name = $('#user_name').val();
             var user_password = $('#user_password').val();
             var user_password2 = $('#user_password2').val();
             if(user_password != user_password2)
                 alert("两次密码输入不一致");
             else{
                 var user = {user_name:user_name,
                     user_password:user_password};
             $.ajax({
                 url:"${pageContext.request.contextPath}/user/updatePassword.action",
                 data:user,
                 type:'post',
                 success:function(response){
                     alert("密码修改成功！");
                     $('#content').html(response);
                 },
                 error:function(){
                     alert("密码修改失败！");
                 }
             });
             }
         });
    </script>
</head>

<body>
<div align="center" >
    <label>更改密码</label>
    <form role="form">
        <div style="width:250px;">
            <div class="form-group input-group">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-user"></span>
                </span>
                <input id="user_name" type="text" class="form-control"
                       placeholder="确认账户">
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


            <button type="submit" class="btn btn-info form-control" id="updatePassword">确认</button>
            <br/><br/>
            <button type="button" class="btn btn-default form-control" style="background-color: #a9a9a9"
                    onclick="script:window.history.back();location.reload();">取消</button>
        </div>

    </form>
</div>
</body>
</html>
