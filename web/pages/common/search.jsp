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
        function refreshImg(){
            document.getElementById("img_rand_code").src = "https://kyfw.12306.cn/otn/passcodeNew/getPassCodeNew?module=other&amp;rand=sjrand&amp;0.3079888817155274";
        }
    </script>
</head>
<body>
<form role="form">
    <div class="form-group input-group">
            <input type="text" class="form-control" placeholder="车次查询"/>
            <span class="input-group-btn">
           <button class="btn btn-default form-control" type="button" onclick="search();" >
           <span class="glyphicon glyphicon-search"></span>
           </button>
           </span>
    </div>
</form>
</body>
</html>
