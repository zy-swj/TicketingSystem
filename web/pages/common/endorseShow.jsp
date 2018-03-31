<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib   prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        #table{
            text-align:center;
            border-collapse:collapse;
        }
        td{
            width:150px;
            height:25px;
        }
    </style>

    <script type="text/javascript">
        var train_date = document.getElementById("train_date").value;
        var from_station = document.getElementById("from_station").value;
        var to_station = document.getElementById("to_station").value;
        document.getElementById("date").innerHTML=train_date;
        document.getElementById("station").innerHTML=from_station+"----"+to_station;

    </script>
</head>
<body>
<c:if test="${not empty _LIST_}">
    <table id="table">
        <tr style="background-color: #87ceeb;">
            <td></td>
            <td colspan="2" style="font-size: 20px;color:#ffffff;" id="station">station</td>
            <td></td>
        </tr>
        <tr style="background-color: #87ceeb;color:#ffffff;vertical-align:bottom;">
            <td></td>
            <td colspan="2" id ="date">date</td>
            <td></td>
        </tr>
        <c:forEach items="${_LIST_}" var="e" varStatus="vs">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td style="font-size: 20px;color:#1e90ff;">${e.start_time}</td>
                <td>
                    <c:set var ="LS" value="${e.lishi}" />
                    <c:set var = "time" value='${fn:split(LS,":")}'/>
                    <c:out value="${time[0]}"/>时<c:out value="${time[1]}"/>分
                </td>
                <td style="font-size: 20px;color:#696969;">${e.arrive_time}</td>
                <td style="color: red"></td>
            </tr>

            <tr style="font-size: 15px;vertical-align:top;color:#000000;">
                <td id="from_station_name">${e.from_station_name}</td>
                <td style="font-size: 15px;color:#808080;" id="station_train_code"><p>${e.station_train_code}<span class="glyphicon glyphicon-credit-card "></span></p></td>
                <td id="to_station_name">${e.to_station_name}</td>
                    <%--查票价--%>
                <td><button type="button" class="btn btn-success btn-xs" onclick="endorse_Tickets('${e.train_no}','${e.from_station_no}','${e.to_station_no}','${e.seat_types}','${e.station_train_code}','${e.from_station_name}','${e.to_station_name}','${e.start_time}');">改签</button></td>
            </tr>


            <tr style="font-size:12px;vertical-align:bottom;color:#a9a9a9">
                <c:set var="code" value="${e.station_train_code}"/>
                <c:choose>
                    <c:when test='${ fn:startsWith(code,"G") or fn:startsWith(code,"D") }'>
                        <td>二等座:${(e.ed == '') ? '--': e.ed}</td>
                        <td>一等座:${(e.yd == '') ? '--': e.yd}</td>
                        <c:if test='${ fn:startsWith(code,"G")}'><td>商务座:${(e.td == '') ? '--': e.td}</td></c:if>
                        <td>无座:${(e.wz == '') ? '--': e.wz}</td>
                    </c:when>

                    <c:otherwise>
                        <td>软卧:${(e.rw == '') ? '--': e.rw}</td>
                        <td>硬卧:${(e.yw == '') ? '--': e.yw}</td>
                        <td>硬座:${(e.yz == '') ? '--': e.yz}</td>
                        <td>无座:${(e.wz == '') ? '--': e.wz}</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>

    </table>
</c:if>
<c:if test="${empty _LIST_}">
    <p style="color:#ff0000;font-size:20px;" align="center">对不起，系统繁忙，请稍后再试！！！</p>
</c:if>
</body>
</html>

