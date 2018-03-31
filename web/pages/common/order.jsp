<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
    <style>
        #orderInfo{
            text-align:left;
            border-collapse:collapse;
        }
        td{
            width:150px;
            height:25px;
        }
    </style>
    <script>
        function cancel_ticket(tickets_id) {
            var sure=window.confirm("您正在进行退票操作，确认退票吗？");
            if(sure==true){
                $.ajax({
                    url:"${pageContext.request.contextPath}/order/cancelTickets.action",
                    type:'post',
                    data:{
                        tickets_id:tickets_id,
                        user_id:${_USER_.user_id}
                    },
                    success:function(response){
                        $('#content').html(response);
                        alert("退票成功,票价将根据相关手续退回账户！");
                    }
                });
            }
            else{
                return false;
            }
        }
        function deleteInfo(tickets_id){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/cancelTickets.action",
                type:'post',
                data:{
                    tickets_id:tickets_id,
                    user_id:${_USER_.user_id}
                },
                success:function(response){
                    $('#content').html(response);
                }
            });
        }
        function endorse_load(tickets_id){
            var sure=window.confirm("每张票只能改签一次，确认改签吗？");
            if(sure== true){
                $.ajax({
                    url:"${pageContext.request.contextPath}/order/toEndorseTickets.action",
                    type:'post',
                    data:{
                        ticketsId:tickets_id
                    },
                    success:function(response){
                        $('#content').html(response);
                    }
                });
            }
            else{
                return false;
            }
        }
    </script>
</head>
<body>
    <div align="center">
        <label>订单</label>
        <c:if test="${empty _ORDER_}">
            <p style="color: #66665f;font-size:30px;">您没有任何订单！！！</p>
        </c:if>
        <c:if test="${not empty _ORDER_}">
            <table id="orderInfo">
                <c:forEach items="${_ORDER_}" var="o">
                    <tr style="font-size:25px;background-color: #ffe31a;text-align:center;">
                        <td>${o.from_station}</td>
                        <td>&nbsp;&nbsp;<u>${o.station_train_code}</u>&nbsp;&nbsp;</td>
                        <td>${o.to_station}</td>
                    </tr>
                    <tr>
                        <td colspan="2">${o.train_date}&nbsp;${o.start_time}开</td>
                        <td>${o.seat_no}</td>
                    </tr>
                    <tr>
                        <td style="color: #ff0c14;">¥${o.price}</td>
                        <td></td>
                        <td>${o.seat_types}</td>
                    </tr>
                    <tr style="color: #66665f">
                        <td colspan="2">${_USER_.id_card}</td>
                        <td>${_USER_.real_name}</td>
                    </tr>
                    <tr style="text-align: center">
                        <td></td>
                        <td><c:choose>
                            <c:when test="${o.canendorse == true && o.isendorse == false}">
                                <a href="#" onclick="endorse_load('${o.tickets_id}');">改签</a>
                            |<a href="#" onclick="cancel_ticket('${o.tickets_id}')">退票</a></td>
                            </c:when>
                            <c:when test="${o.canendorse == false && o.isendorse == false}">
                                <label style="color: #66665f">已改签</label>
                                |<a href="#" onclick="deleteInfo('${o.tickets_id}')">删除</a></td>
                            </c:when>
                            <c:otherwise>
                                <label style="color: #66665f">改签票</label>
                            |<a href="#" onclick="cancel_ticket('${o.tickets_id}')">退票</a></td>
                            </c:otherwise>
                        </c:choose>

                        <td></td>
                    </tr>
                    <tr style="text-align: center">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</body>
</html>
