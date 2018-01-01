<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>离线计算框架-Hive,MapReduce</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="pages/jquery2/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/echarts.min.js"></script>
	<script type="text/javascript" src="pages/js/echarts3-basic.js?v=1.1"></script>
	
	<style type="text/css">
	#main {
		width: 100%;
		height: 584px;
	}
	body {
		margin: 0 0 0 0;
		background-image: url('pages/images/1.jpg');
		background-attachment:fixed;
		background-repeat:no-repeat;
		background-size:cover;
		-moz-background-size:cover;
		-webkit-background-size:cover;
	}
	.chart {
	
	}
	</style>

  </head>
  
  <body>
    <div id="chart1" style="width: 48%;float: left; margin-top:20px;margin-left:20px;" class="chart"></div>
    <div id="chart2" style="width: 48%;float: right; margin-top:20px;margin-right:20px;" class="chart"></div>
    <div id="chart3" style="width: 48%;float: left;clear: left;margin-top:20px;margin-left:20px;" class="chart"></div>
    <div id="chart4" style="width: 48%;float: right;margin-top:20px;margin-right:20px;" class="chart"></div>
    
    <script type="text/javascript">
    var height = $(window).height() / 2 - 25;
    $("#chart1").height(height);
    $("#chart2").height(height);
    $("#chart3").height(height);
    $("#chart4").height(height);
    var chart1 = echarts.init(document.getElementById('chart1'));
    var chart2 = echarts.init(document.getElementById('chart2'));
    var chart3 = echarts.init(document.getElementById('chart3'));
    var chart4 = echarts.init(document.getElementById('chart4'));
    
    function getOption(title, days, data, color) {
    	var option = {
		    title: {
		        text: title,
		        textStyle: {
		        	color: color
		        }
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		    	textStyle: {
		        	color: '#ffffff'
		        },
		        data:[title]
		    },
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    grid: {
		        left: '5%',
		        right: '5%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            splitLine: {show: false},
		            axisLine: {lineStyle: {color: '#ffffff'}},
		            data : days
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            splitLine: {show: false},
		            axisLine: {lineStyle: {color: '#ffffff'}},
		        }
		    ],
		    series : [
		        {
		            name:title,
		            type:'line',
		            stack: '总量',
		            smooth: true,
		            label: {
		            	normal: {
		            		show: true,
		            		textStyle: {
		            			color: '#ffffff'
		            		}
		            	}
		            },
		            itemStyle: {
		            	normal: {
		            		color: '#ffffff'
		            	}
		            },
		            areaStyle: {normal: {color: color}},
		            lineStyle: {normal: {color: '#ffffff'}},
		            data: data
		        }
		    ]
		};
		return option;
    }
    
    
	 
	function ajaxQuery() {
		var getUrl = "common/offline_getOfflineList";
		
	    $.get({url:getUrl}).done(function(data) {
	    	var days = [];
	    	var pvs = [];
	    	var uvs = [];
	    	var ips = [];
	    	var times = [];
	    	data.map(function(item) {
	    		days.push(item.day);
	    		pvs.push(item.pv);
	    		uvs.push(item.uv);
	    		ips.push(item.ip);
	    		times.push(item.time);
	    	})

	    	var option1 = getOption("页面浏览量(pv)", days, pvs, '#C1232B');
			chart1.setOption(option1);
			
			var option2 = getOption("访问者数(uv)", days, uvs, '#FCCE10');
			chart2.setOption(option2);
			
			var option3 = getOption("访问IP数(ip)", days, ips, '#E87C25');
			chart3.setOption(option3);
			
			var option4 = getOption("访问时长(time)", days, times, '#008acd');
			chart4.setOption(option4);
		});
	}
	ajaxQuery();
    </script>
  </body>
</html>