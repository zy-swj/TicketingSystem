<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE HTML>
<html>
<head>
    <script>
        alert('${t.station_train_code}');
    </script>

</head>
<body>
<div align="center">
    <table class="table">
        <label>订票详情</label>
        <thead>
        <tr>
            <th>车次</th>
            <th>出发站</th>
            <th>到达站</th>
            <th>乘车日期</th>
            <th>开车时间</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty _TRAIN_}">
         <c:set var="t" value="${_TRAIN_}"/>  <%--因为只有一条数据，所以不能用遍历，会报错--%>
            <tr>
                <td>${t.station_train_code}</td>
                <td>${t.from_station_name}</td>
                <td>${t.to_station_name}</td>
                <td>${t.train_date}</td>
                <td>${t.start_time}</td>
            </tr>
        </c:if>
        </tbody>
        <thead>
        <tr>
            <th>座位类型</th>
            <th>价格</th>
            <th>购票</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty _PRICE_}">
        <c:forEach items="${_PRICE_}" var="p" >
        <tr>
            <td>${p.key}</td>
            <td>${p.value}</td>
            <td><button class = "btn btn-success" type="button" onclick="buy('${p.key}','${p.value}')">订票</button></td>
        </tr>
        </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>