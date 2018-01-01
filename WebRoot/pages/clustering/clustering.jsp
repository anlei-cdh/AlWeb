<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>聚类算法-Kmeans</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="pages/jquery2/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="pages/echarts-3.8.4/echarts.min.js"></script>
	<script type="text/javascript" src="pages/js/echarts3-basic.js?v=2.25"></script>
	
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/dark.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/infographic.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/macarons.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/roma.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/shine.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/theme/vintage.js"></script>
		
	<style type="text/css">
	#main {
		width: 100%;
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
	</style>

  </head>
  
  <body>
    <div id="main" class="addstyle"></div>
  	
    <script type="text/javascript">
    var main_height = $(window).height();
    $(".addstyle").css("height", main_height);
  	
    function ajaxQuery() {
		/**
		 * 聚类统计
		 */
		$.get({url:"common/machineLearning_getClustering"}).done(function(data) {
			var jsonList = [];
	        
	        data.map(function(item) {
	        	var id = item.id;
	        	var channelId = item.channelId;
	        	var clusteringId = item.clusteringId;
	        	var pv = item.pv;
	        	
	        	if(channelId == 0) {
	        		var categorie = {
	        			id: id,
            	        name: "聚类" + clusteringId,
            	        count: pv,
            	        category: clusteringId,
            	        depth: 1,
            	        children: []
            	    }
	        		jsonList.push(categorie);
	        	}
	    	})
	    	
	    	data.map(function(item) {
	        	var id = item.id;
	        	var name = item.name;
	        	var channelId = item.channelId;
	        	var clusteringId = item.clusteringId;
	        	var pv = item.pv;
	        	
	        	if(channelId != 0) {
	        		var node = {name: name,count: pv};
	        		for(var i=0;i<jsonList.length;i++) {
	        			if(jsonList[i].category == clusteringId) {
	        				jsonList[i].children.push(node);
	        			}
	        		}
	        	}
	    	})
	       	
	       	var jsonConfig = {
       	   		name: 'name',
       	   		children: 'children',
       	   		value: 'count',
       	   		symbolStyle: true,
       	   		size: 50,
       	   		minSize: 0.4,
       	   		c: {
       	   			width: main_height - main_height * 0.07,
       	   			height: main_height - main_height * 0.07,
       		        force: {
       		        	repulsion: main_height - main_height * 0.3,
       		            edgeLength: 70
       		        }
       	   		}
       	   	};
       	   	
       	   	var x = new TerrenCharts.echarts.graphCharts({
       	   		render: 'main',
       	   		// theme: 'macarons', // dark infographic macarons roma shine vintage
       	   		jsonList: jsonList,
       		    jsonConfig: jsonConfig
       	   	});

       	   	window.setTimeout(function() {x.setLayoutOption()}, 5000)
		});
	}
	ajaxQuery();
    </script>
  </body>
</html>