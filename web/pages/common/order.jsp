<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.Date"%>
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
        .order table{
            text-align:left;
            border-collapse:collapse;
        }
        .order td{
            width:150px;
            height:35px;
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
    <div align="center" class="order">
        <label>订单</label>
        <c:if test="${empty _ORDER_}">
            <p style="color: #66665f;font-size:30px;">您没有任何订单！！！</p>
        </c:if>
        <c:if test="${not empty _ORDER_}">
            <table>
                <c:forEach items="${_ORDER_}" var="o">
                    <tr style="font-size:25px;background-color: #79cfff;text-align:center;">
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
                        <td>
                            <fmt:parseDate value="${o.train_date}" pattern="yyyy-MM-dd" var = "traindate" />
                            <fmt:parseDate value="${o.start_time}" pattern="HH:mm" var = "starttime" />
                            <c:set var="trainDate"><fmt:formatDate value="${traindate}" pattern="yyyy-MM-dd" type="date"/></c:set>
                            <c:set var="startTime"><fmt:formatDate value="${starttime}" pattern="HH:mm" type="date"/></c:set>
                            <c:set var="nowDate"><fmt:formatDate value="<%= new Date() %>" pattern="yyyy-MM-dd" type="date"/></c:set>
                            <c:set var="nowTime"><fmt:formatDate value="<%= new Date() %>" pattern="HH:mm" type="date"/></c:set>

                            <c:choose>

                                <c:when test="${trainDate > nowDate || (trainDate == nowDate && nowTime <= startTime)}">
                                    <c:choose>
                                        <c:when test="${o.canendorse == true && o.isendorse == false}">
                                            <c:if test="${trainDate == nowDate && nowTime < startTime}">
                                                <p style="color: #66665f">今日出行</br>请注意乘车时间！</p>
                                            </c:if>
                                                <a href="#" onclick="endorse_load('${o.tickets_id}');">改签</a>
                                                |<a href="#" onclick="cancel_ticket('${o.tickets_id}')">退票</a>
                                            <%--<c:if test="${trainDate == nowDate && nowTime >= startTime}">
                                                <p style="color: #66665f">该次列车已经出发!</p>
                                                <label style="color: #66665f">已出行</label>
                                                |<a href="#" onclick="deleteInfo('${o.tickets_id}')">删除</a>
                                            </c:if>--%>
                                        </c:when>
                                        <c:when test="${o.canendorse == false && o.isendorse == false}">
                                            <label style="color: #66665f">已改签</label>
                                            |<a href="#" onclick="deleteInfo('${o.tickets_id}')">删除</a>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${trainDate == nowDate && nowTime < startTime}">
                                                <p style="color: #66665f">今日出行</br>请注意乘车时间！</p>
                                            </c:if>
                                            <label style="color: #66665f">改签票</label>
                                            |<a href="#" onclick="cancel_ticket('${o.tickets_id}')">退票</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>

                                <c:otherwise>
                                    <c:if test="${trainDate == nowDate && nowTime > startTime}">
                                        <p style="color: #66665f">今日出行!</p>
                                    </c:if>
                                    <label style="color: #66665f">已出行</label>
                                    |<a href="#" onclick="deleteInfo('${o.tickets_id}')">删除</a>
                                </c:otherwise>

                            </c:choose>
                        </td>
                        <td></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</body>
</html>
