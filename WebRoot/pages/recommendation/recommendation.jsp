<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>推荐算法-ALS</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="pages/assets2.7.2/css/amazeui.min.css?v=1.1">
    <link rel="stylesheet" href="pages/assets2.7.2/css/app.css">
    
    <script src="pages/assets2.7.2/js/jquery.min.js"></script>
	<script src="pages/assets2.7.2/js/amazeui.min.js"></script>
		
	<style type="text/css">
	body {
		margin: 0 0 0 0;
		background-image: url('pages/images/6.jpg');
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-size: cover;
		-moz-background-size: cover;
		-webkit-background-size: cover;
	}
	.tabs-add {
    	width:222px;
    	float:left;
    	font-size: 13px;
    	margin: 5px 10px;
    }
    .tabs-add2 {
    	width:222px;
    	float:left;
    	font-size: 13px;
    	margin: 0px 10px;
    }
    .am-panel-add {
    	width: 220px;
    	height: 264px;
    	float: left;
    	margin-top: 5px;
    	margin-left: 18px;
    }
    .am-panel-add2 {
    	width: 220px;
    	height: 262px;
    	float: left;
    	margin-top: 18px;
    	margin-left: 18px;
    }
    .am-panel-title-add {
    	
    }
    .am-panel-title-add2 {
    	height: 42px;
    	padding-top: 8px;
    }
    .am-panel-content-add {
    	padding: 3px 26px;
    }
    .am-panel-content-add2 {
    	padding: 3px 3px;
    }
    .am-panel-extends {
	  margin-bottom: 20px;
	  border: 1px solid #f5f5f5;
	  border-radius: 0;
	  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	}
	.am-tabs-bd-add {
  		border: 1px solid #10a0ea;
	}
	.marginTop {
	}
	</style>

  </head>
  
  <body>
  	
    <script type="text/javascript">
    /**
     * 根据用户推荐的电影
     */
    function changeUserInfo(tab) {
    	var recoid = $(tab).attr("recoid");
    	$.get({url: "common/machineLearning_getRecommendationItem",data: {userid: recoid}}).done(function(data) {
    		var index = 1;
    		putdata(data, index);
    	});
    }
    
    /**
     * 根据电影推荐的用户
     */
    function changeItemInfo(tab) {
    	var recoid = $(tab).attr("recoid");
    	$.get({url:"common/machineLearning_getRecommendationUser",data: {movieid: recoid}}).done(function(data) {
    		var index = 5;
    		putdata(data, index);
    	});
    }
    
    /**
     * 填充推荐的数据
     */
    function putdata(data,index) {
    	var type = "movie";
		if(index >= 5) {
			type = "user";
		}
    	data.map(function(item) {
    		var id = item.id;
        	var name = item.name;
        	var image = item.image;
        	
        	$("#title" + index).html(name);
        	document.getElementById("content" + index).src = "pages/recommendation/images/" + type + "/" + image;
        	index++;
		})
    }
  	
    function ajaxQuery() {
		/**
		 * 推荐 用户信息
		 */
		$.get({url:"common/machineLearning_getCfUser"}).done(function(data) {
			initData(data, 1);
		});
		
		/**
		 * 推荐 物品(电影)信息
		 */
		$.get({url:"common/machineLearning_getCfItem"}).done(function(data) {
			initData(data, 6);
		});
		
		/**
		 * 初始化信息
		 */
		function initData(data,index) {
			var first = true;
			var type = "user";
			if(index >= 6) {
				type = "movie";
			}
			data.map(function(item) {
	        	var id = item.id;
	        	var name = item.name;
	        	var image = item.image;
	        	
	        	var tabs = $("#tab" + index);
	        	tabs.html(name);
	        	tabs.attr("recoid",id);
	        	tabs.attr("info",name);
	        	tabs.attr("image",image);
	        	
	        	var imgs = document.getElementById("img" + index);
	        	imgs.src = "pages/recommendation/images/" + type + "/" + image;
	        	
	        	if(first) {
	        		if(index == 1) {
	        			changeUserInfo("#tab" + index);
	        		} else {
	        			changeItemInfo("#tab" + index);
	        		}
	        	}
	        	index++;
	        	first = false;
	    	})
		}
	}
	ajaxQuery();
    </script>
    
    <div class="marginTop"></div>
    <script type="text/javascript">
    var height = $(window).height();
    var marginTop = (height - 590) / 2;
    $(".marginTop").css("marginTop",marginTop);
    </script>
    <div data-am-widget="tabs" class="am-tabs am-tabs-default tabs-add">
      <ul class="am-tabs-nav am-cf">
          <li class="am-active">
          	<a href="[data-tab-panel-0]"><div id="tab1" onclick="changeUserInfo(this);">用户1</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-1]"><div id="tab2" onclick="changeUserInfo(this);">用户2</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-2]"><div id="tab3" onclick="changeUserInfo(this);">用户3</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-3]"><div id="tab4" onclick="changeUserInfo(this);">用户4</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-4]"><div id="tab5" onclick="changeUserInfo(this);">用户5</div></a>
          </li>
      </ul>
      <div class="am-tabs-bd am-tabs-bd-add">
          <div data-tab-panel-0 class="am-tab-panel am-active" style="padding: 3px 3px;">
          	<img id="img1" src="" width=214 />
          </div>
          <div data-tab-panel-1 class="am-tab-panel" style="padding: 3px 3px;">
          	<img id="img2" src="" width=214 />
          </div>
          <div data-tab-panel-2 class="am-tab-panel" style="padding: 3px 3px;">
            <img id="img3" src="" width=214 />
          </div>
          <div data-tab-panel-3 class="am-tab-panel" style="padding: 3px 3px;">
          	<img id="img4" src="" width=214 />
          </div>
          <div data-tab-panel-4 class="am-tab-panel" style="padding: 3px 3px;">
            <img id="img5" src="" width=214 />
          </div>
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add am-panel-primary" style="margin-left: 50px;">
    <div id="title1" class="am-panel-hd am-panel-title-add">推荐电影1</div>
  	  <div class="am-panel-bd am-panel-content-add">
  	  	<img id="content1" src="" width=167 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add am-panel-primary">
    <div id="title2" class="am-panel-hd am-panel-title-add">推荐电影2</div>
  	  <div class="am-panel-bd am-panel-content-add">
  	  	<img id="content2" src="" width=167 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add am-panel-primary">
    <div id="title3" class="am-panel-hd am-panel-title-add">推荐电影3</div>
  	  <div class="am-panel-bd am-panel-content-add">
  	  	<img id="content3" src="" width=167 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add am-panel-primary">
    <div id="title4" class="am-panel-hd am-panel-title-add">推荐电影4</div>
  	  <div class="am-panel-bd am-panel-content-add">
  	  	<img id="content4" src="" width=167 />
      </div>
  </div>
  
  <div style="clear:both;"></div>
  
  <div data-am-widget="tabs" class="am-tabs am-tabs-default tabs-add2">
      <ul class="am-tabs-nav am-cf">
          <li class="am-active">
          	<a href="[data-tab-panel-0]"><div id="tab6" onclick="changeItemInfo(this);">电影1</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-1]"><div id="tab7" onclick="changeItemInfo(this);">电影2</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-2]"><div id="tab8" onclick="changeItemInfo(this);">电影3</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-3]"><div id="tab9" onclick="changeItemInfo(this);">电影4</div></a>
          </li>
          <li class="">
          	<a href="[data-tab-panel-4]"><div id="tab10" onclick="changeItemInfo(this);">电影5</div></a>
          </li>
      </ul>
      <div class="am-tabs-bd am-tabs-bd-add">
          <div data-tab-panel-0 class="am-tab-panel am-active" style="padding: 3px 16px;">
          	<img id="img6" src="" width=186 />
          </div>
          <div data-tab-panel-1 class="am-tab-panel" style="padding: 3px 16px;">
          	<img id="img7" src="" width=186 />
          </div>
          <div data-tab-panel-2 class="am-tab-panel" style="padding: 3px 16px;">
            <img id="img8" src="" width=186 />
          </div>
          <div data-tab-panel-3 class="am-tab-panel" style="padding: 3px 16px;">
          	<img id="img9" src="" width=186 />
          </div>
          <div data-tab-panel-4 class="am-tab-panel" style="padding: 3px 16px;">
            <img id="img10" src="" width=186 />
          </div>
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add2 am-panel-primary" style="margin-left: 50px;">
    <div id="title5" class="am-panel-hd am-panel-title-add2">推荐用户1</div>
  	  <div class="am-panel-bd am-panel-content-add2">
  	  	<img id="content5" src="" width=212 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add2 am-panel-primary">
    <div id="title6" class="am-panel-hd am-panel-title-add2">推荐用户2</div>
  	  <div class="am-panel-bd am-panel-content-add2">
  	  	<img id="content6" src="" width=212 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add2 am-panel-primary">
    <div id="title7" class="am-panel-hd am-panel-title-add2">推荐用户3</div>
  	  <div class="am-panel-bd am-panel-content-add2">
  	  	<img id="content7" src="" width=212 />
      </div>
  </div>
  
  <div class="am-panel am-panel-default am-panel-add2 am-panel-primary">
    <div id="title8" class="am-panel-hd am-panel-title-add2">推荐用户4</div>
  	  <div class="am-panel-bd am-panel-content-add2">
  	  	<img id="content8" src="" width=212 />
      </div>
  </div>
  
  <div style="clear:both;"></div>
  </body>
</html>