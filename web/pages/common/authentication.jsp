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
        $('#authentication').click(function (){
            var real_name = $('#real_name').val();
            var id_card = $('#id_card').val();
            var user_id = ${sessionScope._USER_.user_id};
            var user = {
                user_id:user_id,
                id_card:id_card,
                real_name:real_name
            };
            $.ajax({
                url:"${pageContext.request.contextPath}/user/authentication.action",
                type:'post',
                data:user,
                success:function (response) {
                    $('#content').html(response);
                }
            });
        });
    </script>
</head>
<body>
<div align="center">
    <label>实名认证</label>
    <form role="form">
        <div style="width:250px;">
        <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-user"></span>
                 </span>
            <input id="real_name" type="text" class="form-control"
            placeholder="真实姓名">
        </div>
        <div class="form-group input-group">
				<span class="input-group-addon">
                     <span class="glyphicon glyphicon-credit-card"></span>
                 </span>

            <input id="id_card" type="text" class="form-control"
                   placeholder="身份证号">
        </div>
        <button type="submit" class="btn btn-info form-control" id="authentication">确认</button>
        <br/><br/>
        <button type="button" class="btn btn-default form-control" style="background-color: #a9a9a9"
                onclick="script:window.history.back();location.reload();">取消</button>
        </div>
    </form>
</div>
</body>
</html>
