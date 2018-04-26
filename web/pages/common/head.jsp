<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script>
        function authentication(){
            $.ajax($('#content').load("${pageContext.request.contextPath}/pages/common/authentication.jsp"));
        }
        function userCentral(){
            $.ajax($('#content').load("${pageContext.request.contextPath}/pages/common/userCentral.jsp"));
        }
    </script>
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
                    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${sessionScope._USER_.user_name}</button>
                    <ul class="dropdown-menu">
                        <li><a href="#" onclick="userCentral();">用户中心</a></li>
                        <li>
                            <c:if test="${sessionScope._USER_.real_name ==  null}"><a href="#" onclick="authentication();">实名认证</a></c:if>
                            <c:if test="${sessionScope._USER_.real_name !=  null}"><a href="#">已实名认证</a></c:if>
                        </li>
                        <li><a href="#"
                               onclick="javascript:$.ajax($('#content').load('${pageContext.request.contextPath}/pages/common/updatePassword.jsp'));"
                                       >更改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/pages/common/loginOut.jsp">退出登录</a></li>
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
