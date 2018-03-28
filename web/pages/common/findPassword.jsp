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
        $('#findPassword').click(function (){
            var user_name = $('#user_name').val();
            var user_question = $('#user_question').val();
            var user_answer = $('#user_answer').val();
            if("" != user_name && "" != user_question && "" != user_answer){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkUser.action",
                    data:{
                        user_name:user_name,
                        user_question:user_question,
                        user_answer:user_answer
                    },
                    type:'post',
                    success:function(response){
                        $('#content').html(response);
                    },
                    error:function () {
                        alert("验证错误!!!");
                    }
                });
            }
            else
                alert("信息不能出现空值!!!");
        });
    </script>
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
            <button type="submit" class="btn btn-info form-control" id="findPassword">确认</button>
            <br/><br/>
            <button type="button" class="btn btn-default form-control" style="background-color: #a9a9a9"
                    onclick="script:window.history.back();location.reload();">取消</button>
        </div>

    </form>
</div>
</body>
</html>
