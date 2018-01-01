<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>交互式查询-Impala,Kudu</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<style type="text/css">
	#main {
		width: 100%;
		height: 584px;
	}
	body {
		margin: 0 0 0 0;
		background-image: url('pages/images/6.jpg');
		background-attachment:fixed;
		background-repeat:no-repeat;
		background-size:cover;
		-moz-background-size:cover;
		-webkit-background-size:cover;
	}
	.liquidFillGaugeText {
    	font-family: Helvetica;
    	font-weight: bold;
    }
    .chart {
    	color: #ffffff;
    	font-size: 20px;
    	width: 215px;
    	height: 230px;
    	float: left;
    }
	.border {
		border: 1px solid #ffffff;
	}
	.marginTop {
	}
	</style>
	
	<script type="text/javascript" src="pages/jquery2/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="pages/d3/wordcloud/d3.min.js"></script>
	<script type="text/javascript" src="pages/d3/liquidFillGauge/liquidFillGauge.js"></script>

  </head>
  
  <body>
    <div id="vis" style="width: 46%;float: left;margin-left: 5px;" class="border marginTop"></div>
    <div id="liquid" style="width: 52%;float: right;margin-right: 5px;" class="border marginTop">
    	<div class="chart" style="margin-left: 110px;margin-top: 5px;">
    		<div id="child1"></div>
			<svg id="chart1" width="220" height="200"></svg>
		</div>
		<div class="chart" style="margin-top: 5px;">
			<div id="child2"></div>
			<svg id="chart2" width="220" height="200"></svg>
		</div>
		<div class="chart" style="clear: left;margin-left: 6px;margin-bottom: 2px;">
			<div id="child3"></div>
			<svg id="chart3" width="220" height="200"></svg>
		</div>
		<div class="chart" style="margin-bottom: 2px;">
			<div id="child4"></div>
			<svg id="chart4" width="220" height="200"></svg>
		</div>
		<div class="chart" style="margin-bottom: 2px;">
			<div id="child5"></div>
			<svg id="chart5" width="220" height="200"></svg>
		</div>
    </div>
  	
  	<script type="text/javascript">
	var wordContent = "";
	var wordWidth =  600;
	var wordHeight = 464;
	</script>
  	
  	<script type="text/javascript">
  	var height = $(window).height();
  	var marginTop = (height - 460) / 2;
  	$(".marginTop").css("marginTop",marginTop);
  	$.get({url:"common/interactive_getKeywordList"}).done(function(data) {
  		data.map(function(item) {
  			if(item.keyword && item.keyword.length <= 10) {
	   			wordContent += item.keyword + " ";
	   		}
	   	})
  		var _script = document.createElement("script");
  		_script.setAttribute("type", "text/javascript");
  		_script.setAttribute("src", "pages/d3/wordcloud/cloud.js?v=6");
  		document.body.appendChild(_script);
  		_script.onload = _script.onreadystatechange = function(){
			var state = this.readyState;
	        if (!state || state == "loaded" || state == "interactive" || state == "complete") {
	        	setInterval(generate, 8000);
	        }
	    }
  		
  	});
  	</script>

	<form id="form" style="display: none">
	  <p>
	  	<input type="number" value="250" min="1" id="max">
	  </p>
	  <p>
	  	<input type="checkbox" id="per-line"> One word per line
	  </p>
	
	  <p>
	    <input type="radio" name="spiral" id="archimedean" value="archimedean" checked="checked"> Archimedean
	    <input type="radio" name="spiral" id="rectangular" value="rectangular"> Rectangular
	  </p>
	  <p>
	    <input type="radio" name="scale" id="scale-log" value="log" checked="checked"> log n</label>
	    <input type="radio" name="scale" id="scale-sqrt" value="sqrt"> √n</label>
	    <input type="radio" name="scale" id="scale-linear" value="linear"> n</label>
	  </p>
	  <p>
	  	<input type="text" id="font" value="Impact">
	  </p>
	  <p>
	  	<input type="number" id="angle-count" value="5" min="1">
	    <input type="number" id="angle-from" value="-60" min="-90" max="90"> °
	    <input type="number" id="angle-to" value="60" min="-90" max="90"> °
	  </p>
	  <p>
	  	<input type="button" value="刷新" onclick="generate()">
	  </p>
	</form>
	
	
	
	<script language="JavaScript">
	function getFillGaugeConfig(conf) {
		var config = liquidFillGaugeDefaultSettings();
	    config.circleThickness = 0.1; // 外圈厚度
	    config.textVertPosition = 0.5; // 文字位置
	    config.circleFillGap = 0.05; // 内圈直径
	    
	    config.waveAnimateTime = 3000; // 水流速度
	    config.waveHeight = 0.1; // 水流坡度
	    config.waveCount = 1; // 水波数量
	    config.minValue = 0;
	    config.textSize = 1.0; // 文字尺寸
	    
	    config.displayPercent = false;
	    if(conf) {
	    	for(var i in conf) {
	    		config[i] = conf[i];
	    	}
	    }
	    return config;
	}
	function getLiquidConfig(index, value, rateIndex) {
		var conf;
		switch(index) {
			case 1:
			conf = {
				waveCount: 1,
				waveHeight: 0.1,
				waveAnimateTime: 5000,
				maxValue: value * 2
			}
			break;
			case 2:
			conf = {
				circleColor: "#D4AB6A",textColor: "#553300",waveTextColor: "#eed5af", waveColor: "#AA7D39",
				circleThickness: 0.03,circleFillGap: 0.03,
				waveCount: 2,waveHeight: 0.1,waveAnimateTime: 8000,
				minValue: 0,maxValue: value * 2,
				textSize: 1.2
			}
			break;
			case 3:
			conf = {
				circleColor: "#808015",textColor: "#555500",waveTextColor: "#FFFFAA", waveColor: "#AAAA39",
				circleThickness: 0.2,circleFillGap: 0.05,
				waveCount: 1,waveHeight: 0.05,waveAnimateTime: 800,
				minValue: 0,maxValue: value * 2,
				textSize: 1.2
			}
			break;
			case 4:
			var conf = {
				circleColor: "#6DA398",textColor: "#0E5144",waveTextColor: "#6DA398", waveColor: "#246D5F",
				circleThickness: 0.05,circleFillGap: 0.2,
				waveCount: 1,waveHeight: 0.3,waveAnimateTime: 3000,
				minValue: 0,maxValue: value * 2.1,
				textSize: 1.2
			}
			break;
			case 5: 
			conf = {
				circleColor: "#b6a2de",textColor: "#6f3dd3",waveTextColor: "#dbcef5", waveColor: "#9a7bd6",
				circleThickness: 0.02,circleFillGap: 0.00,
				waveCount: 5,waveHeight: 0.05,waveAnimateTime: 2000,
				minValue: 0,maxValue: value * 2,
				textSize: 1.2
			}
			break;
			default:
			conf = {
				waveAnimateTime: 5000,
				maxValue: 300
			}
		}
		switch(rateIndex) {
			case 1:
			conf.waveCount = 1;
			conf.waveHeight = 0.1;
			conf.waveAnimateTime = 5000;
			break;
			case 2:
			conf.waveCount = 2;
			conf.waveHeight = 0.1;
			conf.waveAnimateTime = 8000;
			break;
			case 3:
			conf.waveCount = 1;
			conf.waveHeight = 0.05;
			conf.waveAnimateTime = 800;
			break;
			case 4:
			conf.waveCount = 1;
			conf.waveHeight = 0.3;
			conf.waveAnimateTime = 3000;
			break;
			case 5: 
			conf.waveCount = 5;
			conf.waveHeight = 0.05;
			conf.waveAnimateTime = 2000;
			break;
			default:
			conf.waveCount = 1;
			conf.waveHeight = 0.1;
			conf.waveAnimateTime = 5000;
		}
		return conf;
	}
	$.get({url:"common/interactive_getPortalList"}).done(function(data) {
		var index = 0;
  		data.map(function(item) {
  			index++;
	   		var chart = "chart" + index;
	   		var child = "child" + index;
	   		document.getElementById(child).innerHTML = item.name;
	   		loadLiquidFillGauge(chart, item.count, getFillGaugeConfig(getLiquidConfig(index, item.count, item.index)));
	   	})
  		
  	});

	// loadLiquidFillGauge("chart1", 128, getFillGaugeConfig(getLiquidConfig(1, 128)));
	// loadLiquidFillGauge("chart2", 211, getFillGaugeConfig(getLiquidConfig(2, 211)));
	// loadLiquidFillGauge("chart3", 230, getFillGaugeConfig(getLiquidConfig(3, 230)));  
	// loadLiquidFillGauge("chart4", 245, getFillGaugeConfig(getLiquidConfig(4, 245)));
	// loadLiquidFillGauge("chart5", 220, getFillGaugeConfig(getLiquidConfig(5, 220)));
	</script>
  </body>
</html>