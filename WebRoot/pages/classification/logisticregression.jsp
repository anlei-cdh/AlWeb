<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分类算法-Logistic Regression</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="pages/jquery2/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="pages/d3/d3.min.js"></script>
	<script type="text/javascript" src="pages/d3/d3pie.min.js"></script>

	<script type="text/javascript" src="pages/d3/bubble/d3-transform.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/extarray.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/misc.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/micro-observer.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/microplugin.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/bubble-chart.js"></script>
	<script type="text/javascript" src="pages/d3/bubble/central-click.js?v=1.11"></script>
	<script type="text/javascript" src="pages/d3/bubble/lines.js"></script>
	
	<style type="text/css">
	#main {
		width: 100%;
		height: 584px;
	}
	body {
		margin: 0 0 0 0;
		background-image: url('pages/images/5.jpg');
		background-attachment:fixed;
		background-repeat:no-repeat;
		background-size:cover;
		-moz-background-size:cover;
		-webkit-background-size:cover;
	}
	.chart {
		border: 1px solid #ffffff;
	}
	.bubbleChart {
		height: 563px;
    }
    .marginTop {
	}
	</style>

  </head>
  
  <body>
    <div id="chart1" style="width: 99%;" align="center" class="marginTop"></div>
  	<script type="text/javascript">
  	var height = $(window).height();
  	var marginTop = (height - 560) / 2;
  	$(".marginTop").css("marginTop",marginTop);
  	
  	$.get({url:"common/machineLearning_getLogisticRegression"}).done(function(data) {
  		data.map(function(item) {
	   		item.value = item.uv;
	   		item.label = item.name;
	   	})
	   	var pie = new d3pie("chart1", {
		  header: {
		    title: {
		      text: "男女比例",
		      fontSize: 20,
		      color: "#ffffff"
		    },
		    location: "pie-center"
		  },
		  size: {
		    pieInnerRadius: "80%",
		    canvasHeight: 570,
			canvasWidth: 570
		  },
		  labels: {
			inner: {
				format: "percentage"
			},
			outer: {
				format: "label-value2"
			},
			mainLabel: {
				color: "#ffffff",
				fontSize: 18
			},
			value: {
				color: "#ffffff",
				fontSize: 16
			},
			percentage: {
				color: "#ffffff",
				fontSize: 16
			}
		},
		  data: {
		    sortOrder: "label-asc",
		    content: data
		  }
		});
  	});
	</script>
  </body>
</html>