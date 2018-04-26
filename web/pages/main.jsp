<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>98K购票网</title>
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/content/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/content/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/content/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/content/js/myJS.js"></script>
    <script>
        $(document).ready(function(){
            $.ajax($('#content').load("${pageContext.request.contextPath}/pages/common/queryTickets.jsp"));

        });
        function userLogin(){
            $.ajax($('#content').load("${pageContext.request.contextPath}/pages/common/login.jsp"));
        }
        function userRegister(){
            $.ajax(
                $('#content').load("${pageContext.request.contextPath}/pages/common/register.jsp")
            );
        }
        function findPassword(){
            $.ajax(
                $('#content').load("${pageContext.request.contextPath}/pages/common/findPassword.jsp")
            );
        }
        function queryTickets(){
            $.ajax(
                $('#content').load("${pageContext.request.contextPath}/pages/common/queryTickets.jsp")
            );
        }

    </script>
</head>
<body style="background-color:#cdf0ff;">
    <div class="container">  <%--visible-md--%>
        <div class="row" style="margin-top: 20px;margin-bottom: -10px;">
            <div class="col-md-10 col-md-offset-1 ">
                 <%@ include file="/pages/common/head.jsp"%>
            </div>
        </div>
        <div class="row" style="margin-top: 15px;">
            <div class="col-md-10 col-md-offset-1">
                <%@ include file="/pages/common/navigation.jsp"%>
            </div>
        </div>
        <div class="row" style="margin-top: 15px;">
            <div class="col-md-2 col-md-offset-1">
                <%@ include file="/pages/common/left.jsp"%>
            </div>
            <div class="col-md-7 col-md-offset-1" id="content" name="content">

            </div>
        </div>
        <div class="row" style="margin-top: 100px;">
            <div class="col-md-10 col-md-offset-1" id="copyright">
                版权所有：
                <address>
                    <strong>@41531P25 ZhouMin</strong><br/>
                    E-mail:<a href="#">37428498@qq.com</a>
                </address>
                <address>
                    <strong>@NanJing College of Information Technology, 99, WenLan Road,  NanJing, JangSu|
                        <a href="http://www.njcit.cn" target="_blank">@NJCIT.CN</a></strong><br/>
                    TEL:2558-004885
                </address>
            </div>
        </div>
    </div>

</body>
</html>
