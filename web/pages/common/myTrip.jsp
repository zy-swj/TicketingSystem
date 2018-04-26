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
    <style type="text/css">
      #trip table td {
          text-align: center;
          width:300px;
          height: 60px;
          font-size:25px;
          font-family: 华文行楷;
      }
    </style>
</head>
<body>
<div id="trip" align="center">
    <label>我的行程</label>
    <table>
        <c:forEach items="${_TRIP_}" var="e">
            <tr>
                <td>${e.train_date}</td>
                <td>${e.from_station}</td>
                <td>${e.to_station}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
