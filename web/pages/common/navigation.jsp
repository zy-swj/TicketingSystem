<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<head>


</head>

<body>
<div>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type ="button" class="navbar-toggle" data-toggle="collapse" data-target="#n-navbar-collapse">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" onclick="">98k购票网</a>
    </div>

    <div class="collapse navbar-collapse" id="n-navbar-collapse">
        <ul class="nav navbar-nav navbar-left">
            <li><a href="#" onclick="queryTickets();">余票查询</a></li>
            <li><a href="#" onclick="endorseTickets();">车票改签</a></li>
            <li><a href="#" onclick="cancelTickets();">退票</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">我的订单 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="#" onclick="showOrder('yes');">已出行</a></li>
                    <li><a href="#" onclick="showOrder('no');">未出行</a></li>
                    <li class="divider"></li>
                    <li><a href="#" onclick="showOrder('all');">全部订单</a></li>
                </ul>
            </li>
            <li><a href="#">我的行程</a></li>
            <li><a href="#" onclick="login12306()">我的12306</a></li>
        </ul>
        <c:if test="${empty _USER_}">
          <ul class="nav navbar-nav navbar-right">
              <li><a href="#" onclick="userRegister();" class="glyphicon glyphicon-user">免费注册</a></li>
          </ul>
        </c:if>
    </div>
</nav>
</div>
</body>
</html>
