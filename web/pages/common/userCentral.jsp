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
        $('#updatePhoneEmail').click(function () {
            var user_id = ${sessionScope._USER_.user_id};
            var user_phone = document.getElementById("userPhone").value;
            var user_email = document.getElementById("userEmail").value;
            if(user_phone == "")
                user_phone = '${sessionScope._USER_.user_phone}';
            if(user_email == "")
                user_email = '${sessionScope._USER_.user_email}';
            var user = {
                user_id:user_id,
                user_phone:user_phone,
                user_email:user_email
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePhoneEmail.action",
                type:'post',
                data:user,
                success:function(response){
                    alert("修改成功");
                    $('#content').html(response);
                }
            });
        });
    </script>
</head>
<body>
    <div  align="center">
        <label>用户中心</label>
        <form role="form">
            <div align="center">
                <table>
                    <tr>
                        <td><div class="form-group input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </span>
                            <input id="user_name" type="text" class="form-control"
                                   placeholder="${_USER_.user_name}" readonly>
                        </div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><div class="form-group input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-phone"></span>
                    </span>
                            <input id="userPhone" type="text" class="form-control"
                                   placeholder="${_USER_.user_phone}">
                        </div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><div class="form-group input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-envelope"></span>
                    </span>
                            <input id="userEmail" type="text" class="form-control"
                                   placeholder="${_USER_.user_email}">
                        </div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><div class="form-group input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </span>
                            <input id="real_name" type="text" class="form-control"
                                   placeholder="${_USER_.real_name}"  readonly>
                        </div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><div class="form-group input-group">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-credit-card"></span>
                    </span>

                            <input id="id_card" type="text" class="form-control"
                                   placeholder="${_USER_.id_card}" readonly>
                        </div></td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <button type="submit" class="btn btn-info form-control" id="updatePhoneEmail" style="width:125px;">确认修改</button>
            <button type="button" onclick="script:window.history.back();location.reload();" class="btn btn-info form-control" style="width:125px;background-color: #a9a9a9">取消</button>
        </form>
    </div>
</body>
</html>
