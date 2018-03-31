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

        function buy(seat_types,price){
            var date = new Date();
            var tickets_id = date.getYear()+""+date.getMonth()+""+date.getDay()+""+date.getTime();
            var station_train_code = '${_TRAIN_.station_train_code}';
            var from_station='${_TRAIN_.from_station_name}';
            var to_station ='${_TRAIN_.to_station_name}';
            var train_date = '${_TRAIN_.train_date}';
            var start_time ='${_TRAIN_.start_time}';
            var user_id = ${_USER_.user_id};
            var order={
                tickets_id:tickets_id,
                station_train_code:station_train_code,
                from_station:from_station,
                to_station:to_station,
                train_date:train_date,
                start_time: start_time,
                seat_types:seat_types,
                price:price,
                user_id:user_id
            };
            $.ajax({
                url:"${pageContext.request.contextPath}/order/buyTickets.action",
                type:'post',
                data:order,
                success:function(response){
                    alert("购票成功！");
                    $('#content').html(response);
                },
                error:function () {
                    alert("购票失败！");
                }
            });
        }
    </script>

</head>
<body>
<div align="center">
    <table class="table">
        <label>车次详情</label>
        <thead>
        <tr>
            <th>车次</th>
            <th>出发站</th>
            <th>到达站</th>
            <th>乘车日期</th>
            <th>开车时间</th>
        </tr>
        </thead>
        <tbody  style="font-size:20px;color:#ffa11b;">
         <c:set var="t" value="${_TRAIN_}"/>  <%--因为只有一条数据，所以不能用遍历，会报错--%>
            <tr>
                <td>${t.station_train_code}</td>
                <td>${t.from_station_name}</td>
                <td>${t.to_station_name}</td>
                <td>${t.train_date}</td>
                <td>${t.start_time}</td>
            </tr>
            <tr></tr>
        </tbody>
        <thead>
        <tr>
            <th>座位类型</th>
            <th></th>
            <th>价格</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty _PRICE_}">
        <c:forEach items="${_PRICE_}" var="p" >
        <tr>
            <td>${p.key}</td>
            <td></td>
            <td  style="color: #ff362d">${p.value}</td>
            <td></td>
            <td><button type="button" class="btn btn-success" onclick="buy('${p.key}','${p.value}');">购票</button></td>
        </tr>
        </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>