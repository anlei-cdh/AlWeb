<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分类算法-Decision Tree</title>
    
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
    <div id="chart2" style="width: 100%;" class="bubbleChart marginTop"></div>

  	<script type="text/javascript">
  	var height = $(window).height();
  	var marginTop = (height - 560) / 2;
  	$(".marginTop").css("marginTop",marginTop);
	</script>

	<script type="text/javascript">
	$.get({url:"common/machineLearning_getDecisionTree"}).done(function(data) {
		data.map(function(item) {
	   		item.count = item.uv;
	   		item.text = item.name;
	   	})
	 	var bubbleChart = new d3.svg.BubbleChart({
		    supportResponsive: true,
		    size: 600,
		    innerRadius: 600 / 3.5,
		    radiusMin: 50,
		    data: {
		      items: data,
		      eval: function (item) {return item.count;},
		      classed: function (item) {return item.text.split(" ").join("");}
		    },
		    plugins: [
		      {
		        name: "central-click",
		        options: {
		          text: "(See more detail)",
		          style: {
		            "font-size": "12px",
		            "font-style": "italic",
		            "font-family": "Source Sans Pro, sans-serif",
		            //"font-weight": "700",
		            "text-anchor": "middle",
		            "fill": "white"
		          },
		          attr: {dy: "65px"},
		          centralClick: function() {
		            // alert("Here is more details!!");
		          }
		        }
		      },
		      {
		        name: "lines",
		        options: {
		          format: [
		            {// Line #0
		              textField: "count",
		              classed: {count: true},
		              style: {
		                "font-size": "28px",
		                "font-family": "Source Sans Pro, sans-serif",
		                "text-anchor": "middle",
		                fill: "white"
		              },
		              attr: {
		                dy: "0px",
		                x: function (d) {return d.cx;},
		                y: function (d) {return d.cy;}
		              }
		            },
		            {// Line #1
		              textField: "text",
		              classed: {text: true},
		              style: {
		                "font-size": "14px",
		                "font-family": "Source Sans Pro, sans-serif",
		                "text-anchor": "middle",
		                fill: "white"
		              },
		              attr: {
		                dy: "20px",
		                x: function (d) {return d.cx;},
		                y: function (d) {return d.cy;}
		              }
		            }
		          ],
		          centralFormat: [
		            {// Line #0
		              style: {"font-size": "50px"},
		              attr: {}
		            },
		            {// Line #1
		              style: {"font-size": "30px"},
		              attr: {dy: "40px"}
		            }
		          ]
		        }
	      	}]
	  	});
	});
	</script>
  </body>
</html>