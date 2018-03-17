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
<div class="container">
    <div class="row">
        <div class="col-md-3 col-md-offset-6">
            <%@ include file="/pages/common/search.jsp" %>
        </div>

        <c:if test="${not empty _USER_ }">
            <div class="col-md-1"  style="margin-left:-15px;height: 50px;">
                <div class="dropdown">
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${_USER_.userName}</button>
                    <ul class="dropdown-menu">
                        <li><a href="#">用户中心</a></li>
                        <li><a href="#">实名认证</a></li>
                        <li><a href="#">基本设置</a></li>
                        <li class="divider"></li>
                        <li><a href="#">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${empty _USER_}">
            <div class="col-md-1" style="margin-left:-15px;">
                <button style="height: 35px;" type="button" class="btn btn-default" onclick="userLogin();"><span class="glyphicon glyphicon-user"></span></button>
            </div>
        </c:if>

    </div>
</div>
</body>
</html>
