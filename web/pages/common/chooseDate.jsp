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
        Date.prototype.Format = function(fmt) {
            var o = {
                "M+" : this.getMonth() + 1, //月份
                "d+" : this.getDate(), //日
                "h+" : this.getHours(), //小时
                "m+" : this.getMinutes(), //分
                "s+" : this.getSeconds(), //秒
                "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
                "S" : this.getMilliseconds()
                //毫秒
            };
            if (/(y+)/.test(fmt))
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for ( var k in o)
                if (new RegExp("(" + k + ")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]):(("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        $(document).ready(function() {
            var today = new Date().Format("yyyy-MM-dd");
            var sDate = today.toLocaleString();
            $(".form_datetime").datetimepicker({
                format : "yyyy-mm-dd",
                autoclose : true,
                todayHighlight : true,
                startDate : sDate,
                minuteStep : 10,
                minView : "month",
                language : 'zh-CN'
            });
        });
    </script>
</head>

<body>
<div class="input-group date form_datetime">
    <input class="form-control" type="text" placeholder="请选择出发日期"
           readonly="true" style="background-color:#ffffff" id="train_date" />
    <span class="input-group-addon"> <span   class="glyphicon glyphicon-calendar"></span></span>
</div>
</body>
</html>
