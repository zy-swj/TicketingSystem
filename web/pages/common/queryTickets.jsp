<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>

<script>
	function query() {
		var train_date = document.getElementById("train_date").value;
		var from_station = document.getElementById("from_station").value;
		var to_station = document.getElementById("to_station").value;
		var inputs = document.getElementsByName("purpose_codes");
		var purpose_codes ="";
		for(var i = 0; i<inputs.length;i++){
		    if(inputs[i].checked)
		        purpose_codes = inputs[i].value;
		}
        $('#show').load("${pageContext.request.contextPath}/pages/common/progress.jsp");
		$.ajax({
			url : "${pageContext.request.contextPath}/tickets/queryTickets.action",
			data : {
				train_date:train_date,
			    from_station_name:from_station,
				to_station_name:to_station,
				purpose_codes:purpose_codes
			},
			type : 'post',
			success : function(responseText) {
			    $('#show').html(responseText);
			}
		});
	}
	function change() {
		var val1 = document.getElementById("from_station").value;
		var val2 = document.getElementById("to_station").value;
		document.getElementById("from_station").value = val2;
		document.getElementById("to_station").value = val1;
	}
    function buyTickets(train_no,from_station_no,to_station_no,seat_types,station_train_code,from_station_name,to_station_name,start_time){
	    if(${sessionScope._USER_.user_name == null}){
	        alert('请先登录用户！');
            $.ajax($('#content').load("${pageContext.request.contextPath}/pages/common/login.jsp"));
	    }
	    else{
	    var train_date = document.getElementById("train_date").value;
        var tickets = {
            station_train_code:station_train_code,
			from_station_name:from_station_name,
			to_station_name:to_station_name,
			start_time:start_time,
            train_date:train_date,
            train_no:train_no,
            from_station_no:from_station_no,
            to_station_no:to_station_no,
            seat_types:seat_types
        };
        $.ajax({
            url:"${pageContext.request.contextPath}/tickets/buyTickets.action",
            data:tickets,
            type:'post',
            success:function(response){
                $('#content').html(response);
            }
        });
		}
    }
</script>
</head>

<body>
    <div align="center">
		<label>余票查询</label>
		<from role="form">
			<div style="width:250px;">
			    <div style="margin-top: 15px;"><%@ include file="/pages/common/chooseDate.jsp"%></div>
			    <div class="input-group form-group" style="margin-top: 10px;">
				    <input class="form-control" type="text" placeholder="出发站" id="from_station"/>
				    <span class="input-group-btn"><button class="btn btn-default form-control" onclick="change();"><span class=" glyphicon glyphicon-refresh"></span></button></span>
				    <input class="form-control" type="text" placeholder="到达站" id="to_station"/>
			    </div>
				<div class="radio" style="margin-top: 10px;">
					<label class="form-control"><input type="radio" name="purpose_codes" id="ADULT" value="ADULT" checked />成人票</label>
					<label class="form-control"><input type="radio" name="purpose_codes" id="STUDENT" value="0X00" />学生票</label>
				</div>
				<button class="btn btn-default btn-block form-control" type="button"
						style="background-color: #ff8c00;color:#ffffff" onclick="query();">查询</button>
			</div>

		</from>
		</br></br>
		<div id="show"></div>
	</div>
</body>
</html>
