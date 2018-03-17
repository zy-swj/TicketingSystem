<%--
  Created by IntelliJ IDEA.
  User: Zhoum
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
    <link href="${pageContext.request.contextPath}/content/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/content/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/content/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".form_datetime").datetimepicker({
                format: "yyyy-mm-dd",
                todayBtn: true,
                todayHighlight:true,
                minuteStep: 10,
                minView: "month",
                language: 'zh-CN'
            });
        });
    </script>
</head>
<body>
<div class="input-group date form_datetime"></div>
</body>
</html>