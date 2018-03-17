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
        table{
            text-align:center;
            border-collapse:collapse;
        }
    </style>
</head>
<body>
    <div align="center">
        <label>订单</label>
        <form role="form">
            <table>
                <tr>
                    <td id="station">杭州--南京</td>
                </tr>
                <tr>
                    <td id="time">时间</td>
                </tr>
                <tr>
                    <td id="train">车次/座位</td>
                </tr>
                <tr>
                    <td>改签</td>
                    <td>退票</td>
                    <td></td>
                    <td>删除</td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
