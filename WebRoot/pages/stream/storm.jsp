<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>流式计算框架-Storm</title>
    
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="pages/jquery2/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/echarts.min.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/china.js"></script>
	<script type="text/javascript" src="pages/echarts-3.2.1/world.js"></script>
	
	<style type="text/css">
	#main {
		width: 100%;
		height: 584px;
	}
	body {
		margin: 0 0 0 0;
		background-image: url('pages/images/2.jpg');
		background-attachment:fixed;
		background-repeat:no-repeat;
		background-size:cover;
		-moz-background-size:cover;
		-webkit-background-size:cover;
	}
	</style>

  </head>
  
  <body>
    <div id="main"></div>
    
    <script type="text/javascript">
    $("#main").height($(window).height());
    var myChart = echarts.init(document.getElementById('main'));
    
    var latlong = [
    	{'code':'AF', 'name':'阿富汗', 'color':'#eea638', 'latitude':33, 'longitude':65},
		{'code':'AL', 'name':'阿尔巴尼亚', 'color':'#d8854f', 'latitude':41, 'longitude':20},
		{'code':'DZ', 'name':'阿尔及利亚', 'color':'#de4c4f', 'latitude':28, 'longitude':3},
		{'code':'AO', 'name':'安哥拉', 'color':'#de4c4f', 'latitude':-12.5, 'longitude':18.5},
		{'code':'AR', 'name':'阿根廷', 'color':'#86a965', 'latitude':-34, 'longitude':-64},
		{'code':'AM', 'name':'亚美尼亚', 'color':'#d8854f', 'latitude':40, 'longitude':45},
		{'code':'AU', 'name':'澳大利亚', 'color':'#8aabb0', 'latitude':-27, 'longitude':133},
		{'code':'AT', 'name':'奥地利', 'color':'#d8854f', 'latitude':47.3333, 'longitude':13.3333},
		{'code':'AZ', 'name':'阿塞拜疆', 'color':'#d8854f', 'latitude':40.5, 'longitude':47.5},
		{'code':'BH', 'name':'巴林', 'color':'#eea638', 'latitude':26, 'longitude':50.55},
		{'code':'BD', 'name':'孟加拉国', 'color':'#eea638', 'latitude':24, 'longitude':90},
		{'code':'BY', 'name':'白俄罗斯', 'color':'#d8854f', 'latitude':53, 'longitude':28},
		{'code':'BE', 'name':'比利时', 'color':'#d8854f', 'latitude':50.8333, 'longitude':4},
		{'code':'BJ', 'name':'贝宁', 'color':'#de4c4f', 'latitude':9.5, 'longitude':2.25},
		{'code':'BT', 'name':'不丹', 'color':'#eea638', 'latitude':27.5, 'longitude':90.5},
		{'code':'BO', 'name':'玻利维亚', 'color':'#86a965', 'latitude':-17, 'longitude':-65},
		{'code':'BA', 'name':'波斯尼亚和黑塞哥维那', 'color':'#d8854f', 'latitude':44, 'longitude':18},
		{'code':'BW', 'name':'博茨瓦纳', 'color':'#de4c4f', 'latitude':-22, 'longitude':24},
		{'code':'BR', 'name':'巴西', 'color':'#86a965', 'latitude':-10, 'longitude':-55},
		{'code':'BN', 'name':'文莱', 'color':'#eea638', 'latitude':4.5, 'longitude':114.6667},
		{'code':'BG', 'name':'保加利亚', 'color':'#d8854f', 'latitude':43, 'longitude':25},
		{'code':'BF', 'name':'布基纳法索', 'color':'#de4c4f', 'latitude':13, 'longitude':-2},
		{'code':'BI', 'name':'布隆迪', 'color':'#de4c4f', 'latitude':-3.5, 'longitude':30},
		{'code':'KH', 'name':'柬埔寨', 'color':'#eea638', 'latitude':13, 'longitude':105},
		{'code':'CM', 'name':'喀麦隆', 'color':'#de4c4f', 'latitude':6, 'longitude':12},
		{'code':'CA', 'name':'加拿大', 'color':'#a7a737', 'latitude':54, 'longitude':-100},
		{'code':'CV', 'name':'佛得角', 'color':'#de4c4f', 'latitude':16, 'longitude':-24},
		{'code':'CF', 'name':'中非共和国', 'color':'#de4c4f', 'latitude':7, 'longitude':21},
		{'code':'TD', 'name':'乍得', 'color':'#de4c4f', 'latitude':15, 'longitude':19},
		{'code':'CL', 'name':'智利', 'color':'#86a965', 'latitude':-30, 'longitude':-71},
		{'code':'CN', 'name':'中国', 'color':'#eea638', 'latitude':35, 'longitude':105},
		{'code':'CO', 'name':'哥伦比亚', 'color':'#86a965', 'latitude':4, 'longitude':-72},
		{'code':'KM', 'name':'科摩罗', 'color':'#de4c4f', 'latitude':-12.1667, 'longitude':44.25},
		{'code':'CD', 'name':'刚果民主共和国', 'color':'#de4c4f', 'latitude':0, 'longitude':25},
		{'code':'CG', 'name':'刚果共和国', 'color':'#de4c4f', 'latitude':-1, 'longitude':15},
		{'code':'CR', 'name':'哥斯达黎加', 'color':'#a7a737', 'latitude':10, 'longitude':-84},
		{'code':'CI', 'name':'科特迪瓦', 'color':'#de4c4f', 'latitude':8, 'longitude':-5},
		{'code':'HR', 'name':'克罗地亚', 'color':'#d8854f', 'latitude':45.1667, 'longitude':15.5},
		{'code':'CU', 'name':'古巴', 'color':'#a7a737', 'latitude':21.5, 'longitude':-80},
		{'code':'CY', 'name':'塞浦路斯', 'color':'#d8854f', 'latitude':35, 'longitude':33},
		{'code':'CZ', 'name':'捷克共和国', 'color':'#d8854f', 'latitude':49.75, 'longitude':15.5},
		{'code':'DK', 'name':'丹麦', 'color':'#d8854f', 'latitude':56, 'longitude':10},
		{'code':'DJ', 'name':'吉布提', 'color':'#de4c4f', 'latitude':11.5, 'longitude':43},
		{'code':'DO', 'name':'多米尼加共和国', 'color':'#a7a737', 'latitude':19, 'longitude':-70.6667},
		{'code':'EC', 'name':'厄瓜多尔', 'color':'#86a965', 'latitude':-2, 'longitude':-77.5},
		{'code':'EG', 'name':'埃及', 'color':'#de4c4f', 'latitude':27, 'longitude':30},
		{'code':'SV', 'name':'萨尔瓦多', 'color':'#a7a737', 'latitude':13.8333, 'longitude':-88.9167},
		{'code':'GQ', 'name':'赤道几内亚', 'color':'#de4c4f', 'latitude':2, 'longitude':10},
		{'code':'ER', 'name':'厄立特里亚', 'color':'#de4c4f', 'latitude':15, 'longitude':39},
		{'code':'EE', 'name':'爱沙尼亚', 'color':'#d8854f', 'latitude':59, 'longitude':26},
		{'code':'ET', 'name':'埃塞俄比亚', 'color':'#de4c4f', 'latitude':8, 'longitude':38},
		{'code':'FJ', 'name':'斐济', 'color':'#8aabb0', 'latitude':-18, 'longitude':175},
		{'code':'FI', 'name':'芬兰', 'color':'#d8854f', 'latitude':62, 'longitude':26},
		{'code':'FR', 'name':'法国', 'color':'#d8854f', 'latitude':46, 'longitude':2,'position':'left'},
		{'code':'GA', 'name':'加蓬', 'color':'#de4c4f', 'latitude':-1, 'longitude':11.75},
		{'code':'GM', 'name':'冈比亚', 'color':'#de4c4f', 'latitude':13.4667, 'longitude':-16.5667},
		{'code':'GE', 'name':'格鲁吉亚', 'color':'#d8854f', 'latitude':42, 'longitude':43.5},
		{'code':'DE', 'name':'德国', 'color':'#d8854f', 'latitude':51, 'longitude':9,'position':'right'},
		{'code':'GH', 'name':'加纳', 'color':'#de4c4f', 'latitude':8, 'longitude':-2},
		{'code':'GR', 'name':'希腊', 'color':'#d8854f', 'latitude':39, 'longitude':22},
		{'code':'GT', 'name':'危地马拉', 'color':'#a7a737', 'latitude':15.5, 'longitude':-90.25},
		{'code':'GN', 'name':'几内亚', 'color':'#de4c4f', 'latitude':11, 'longitude':-10},
		{'code':'GW', 'name':'几内亚比索', 'color':'#de4c4f', 'latitude':12, 'longitude':-15},
		{'code':'GY', 'name':'圭亚那', 'color':'#86a965', 'latitude':5, 'longitude':-59},
		{'code':'HT', 'name':'海地', 'color':'#a7a737', 'latitude':19, 'longitude':-72.4167},
		{'code':'HN', 'name':'洪都拉斯', 'color':'#a7a737', 'latitude':15, 'longitude':-86.5},
		{'code':'HK', 'name':'中国香港', 'color':'#eea638', 'latitude':22.25, 'longitude':114.1667},
		{'code':'HU', 'name':'匈牙利', 'color':'#d8854f', 'latitude':47, 'longitude':20},
		{'code':'IS', 'name':'冰岛', 'color':'#d8854f', 'latitude':65, 'longitude':-18},
		{'code':'IN', 'name':'印度', 'color':'#eea638', 'latitude':20, 'longitude':77},
		{'code':'ID', 'name':'印度尼西亚', 'color':'#eea638', 'latitude':-5, 'longitude':120},
		{'code':'IR', 'name':'伊朗', 'color':'#eea638', 'latitude':32, 'longitude':53},
		{'code':'IQ', 'name':'伊拉克', 'color':'#eea638', 'latitude':33, 'longitude':44},
		{'code':'IE', 'name':'爱尔兰', 'color':'#d8854f', 'latitude':53, 'longitude':-8},
		{'code':'IL', 'name':'以色列', 'color':'#eea638', 'latitude':31.5, 'longitude':34.75},
		{'code':'IT', 'name':'意大利', 'color':'#d8854f', 'latitude':42.8333, 'longitude':12.8333},
		{'code':'JM', 'name':'牙买加', 'color':'#a7a737', 'latitude':18.25, 'longitude':-77.5},
		{'code':'JP', 'name':'日本', 'color':'#eea638', 'latitude':36, 'longitude':138, 'position':'right'},
		{'code':'JO', 'name':'约旦', 'color':'#eea638', 'latitude':31, 'longitude':36},
		{'code':'KZ', 'name':'哈萨克斯坦', 'color':'#eea638', 'latitude':48, 'longitude':68},
		{'code':'KE', 'name':'肯尼亚', 'color':'#de4c4f', 'latitude':1, 'longitude':38},
		{'code':'KP', 'name':'朝鲜', 'color':'#eea638', 'latitude':40, 'longitude':127},
		{'code':'KR', 'name':'韩国', 'color':'#eea638', 'latitude':37, 'longitude':127.5},
		{'code':'KW', 'name':'科威特', 'color':'#eea638', 'latitude':29.3375, 'longitude':47.6581},
		{'code':'KG', 'name':'吉尔吉斯斯坦', 'color':'#eea638', 'latitude':41, 'longitude':75},
		{'code':'LA', 'name':'老挝', 'color':'#eea638', 'latitude':18, 'longitude':105},
		{'code':'LV', 'name':'拉脱维亚', 'color':'#d8854f', 'latitude':57, 'longitude':25},
		{'code':'LB', 'name':'黎巴嫩', 'color':'#eea638', 'latitude':33.8333, 'longitude':35.8333},
		{'code':'LS', 'name':'莱索托', 'color':'#de4c4f', 'latitude':-29.5, 'longitude':28.5},
		{'code':'LR', 'name':'利比里亚', 'color':'#de4c4f', 'latitude':6.5, 'longitude':-9.5},
		{'code':'LY', 'name':'利比亚', 'color':'#de4c4f', 'latitude':25, 'longitude':17},
		{'code':'LT', 'name':'立陶宛', 'color':'#d8854f', 'latitude':55, 'longitude':24},
		{'code':'LU', 'name':'卢森堡', 'color':'#d8854f', 'latitude':49.75, 'longitude':6},
		{'code':'MK', 'name':'马其顿', 'color':'#d8854f', 'latitude':41.8333, 'longitude':22},
		{'code':'MG', 'name':'马达加斯加', 'color':'#de4c4f', 'latitude':-20, 'longitude':47},
		{'code':'MW', 'name':'马拉维', 'color':'#de4c4f', 'latitude':-13.5, 'longitude':34},
		{'code':'MY', 'name':'马来西亚', 'color':'#eea638', 'latitude':2.5, 'longitude':112.5},
		{'code':'ML', 'name':'马里', 'color':'#de4c4f', 'latitude':17, 'longitude':-4},
		{'code':'MR', 'name':'毛里塔尼亚', 'color':'#de4c4f', 'latitude':20, 'longitude':-12},
		{'code':'MU', 'name':'毛里求斯', 'color':'#de4c4f', 'latitude':-20.2833, 'longitude':57.55},
		{'code':'MX', 'name':'墨西哥', 'color':'#a7a737', 'latitude':23, 'longitude':-102},
		{'code':'MD', 'name':'摩尔多瓦', 'color':'#d8854f', 'latitude':47, 'longitude':29},
		{'code':'MN', 'name':'蒙古', 'color':'#eea638', 'latitude':46, 'longitude':105},
		{'code':'ME', 'name':'黑山', 'color':'#d8854f', 'latitude':42.5, 'longitude':19.4},
		{'code':'MA', 'name':'摩洛哥', 'color':'#de4c4f', 'latitude':32, 'longitude':-5},
		{'code':'MZ', 'name':'莫桑比克', 'color':'#de4c4f', 'latitude':-18.25, 'longitude':35},
		{'code':'MM', 'name':'缅甸', 'color':'#eea638', 'latitude':22, 'longitude':98},
		{'code':'NA', 'name':'纳米比亚', 'color':'#de4c4f', 'latitude':-22, 'longitude':17},
		{'code':'NP', 'name':'尼泊尔', 'color':'#eea638', 'latitude':28, 'longitude':84},
		{'code':'NL', 'name':'荷兰', 'color':'#d8854f', 'latitude':52.5, 'longitude':5.75},
		{'code':'NZ', 'name':'新西兰', 'color':'#8aabb0', 'latitude':-41, 'longitude':174},
		{'code':'NI', 'name':'尼加拉瓜', 'color':'#a7a737', 'latitude':13, 'longitude':-85},
		{'code':'NE', 'name':'尼日尔', 'color':'#de4c4f', 'latitude':16, 'longitude':8},
		{'code':'NG', 'name':'尼日利亚', 'color':'#de4c4f', 'latitude':10, 'longitude':8},
		{'code':'NO', 'name':'挪威', 'color':'#d8854f', 'latitude':62, 'longitude':10},
		{'code':'OM', 'name':'阿曼', 'color':'#eea638', 'latitude':21, 'longitude':57},
		{'code':'PK', 'name':'巴基斯坦', 'color':'#eea638', 'latitude':30, 'longitude':70},
		{'code':'PA', 'name':'巴拿马', 'color':'#a7a737', 'latitude':9, 'longitude':-80},
		{'code':'PG', 'name':'巴布亚新几内亚', 'color':'#8aabb0', 'latitude':-6, 'longitude':147},
		{'code':'PY', 'name':'巴拉圭', 'color':'#86a965', 'latitude':-23, 'longitude':-58},
		{'code':'PE', 'name':'秘鲁', 'color':'#86a965', 'latitude':-10, 'longitude':-76},
		{'code':'PH', 'name':'菲律宾', 'color':'#eea638', 'latitude':13, 'longitude':122},
		{'code':'PL', 'name':'波兰', 'color':'#d8854f', 'latitude':52, 'longitude':20},
		{'code':'PT', 'name':'葡萄牙', 'color':'#d8854f', 'latitude':39.5, 'longitude':-8},
		{'code':'PR', 'name':'波多黎各', 'color':'#a7a737', 'latitude':18.25, 'longitude':-66.5},
		{'code':'QA', 'name':'卡塔尔', 'color':'#eea638', 'latitude':25.5, 'longitude':51.25},
		{'code':'RO', 'name':'罗马尼亚', 'color':'#d8854f', 'latitude':46, 'longitude':25},
		{'code':'RU', 'name':'俄罗斯', 'color':'#d8854f', 'latitude':60, 'longitude':100},
		{'code':'RW', 'name':'卢旺达', 'color':'#de4c4f', 'latitude':-2, 'longitude':30},
		{'code':'SA', 'name':'沙特阿拉伯', 'color':'#eea638', 'latitude':25, 'longitude':45},
		{'code':'SN', 'name':'塞内加尔', 'color':'#de4c4f', 'latitude':14, 'longitude':-14},
		{'code':'RS', 'name':'塞尔维亚', 'color':'#d8854f', 'latitude':44, 'longitude':21},
		{'code':'SL', 'name':'塞拉利昂', 'color':'#de4c4f', 'latitude':8.5, 'longitude':-11.5},
		{'code':'SG', 'name':'新加坡', 'color':'#eea638', 'latitude':1.3667, 'longitude':103.8, 'position':'left'},
		{'code':'SK', 'name':'斯洛伐克共和国', 'color':'#d8854f', 'latitude':48.6667, 'longitude':19.5},
		{'code':'SI', 'name':'斯洛文尼亚', 'color':'#d8854f', 'latitude':46, 'longitude':15},
		{'code':'SB', 'name':'所罗门群岛', 'color':'#8aabb0', 'latitude':-8, 'longitude':159},
		{'code':'SO', 'name':'索马里', 'color':'#de4c4f', 'latitude':10, 'longitude':49},
		{'code':'ZA', 'name':'南非', 'color':'#de4c4f', 'latitude':-29, 'longitude':24},
		{'code':'ES', 'name':'西班牙', 'color':'#d8854f', 'latitude':40, 'longitude':-4},
		{'code':'LK', 'name':'斯里兰卡', 'color':'#eea638', 'latitude':7, 'longitude':81},
		{'code':'SD', 'name':'苏丹', 'color':'#de4c4f', 'latitude':15, 'longitude':30},
		{'code':'SR', 'name':'苏里南', 'color':'#86a965', 'latitude':4, 'longitude':-56},
		{'code':'SZ', 'name':'斯威士兰', 'color':'#de4c4f', 'latitude':-26.5, 'longitude':31.5},
		{'code':'SE', 'name':'瑞典', 'color':'#d8854f', 'latitude':62, 'longitude':15},
		{'code':'CH', 'name':'瑞士', 'color':'#d8854f', 'latitude':47, 'longitude':8},
		{'code':'SY', 'name':'叙利亚', 'color':'#eea638', 'latitude':35, 'longitude':38},
		{'code':'TW', 'name':'台湾', 'color':'#eea638', 'latitude':23.5, 'longitude':121},
		{'code':'TJ', 'name':'塔吉克', 'color':'#eea638', 'latitude':39, 'longitude':71},
		{'code':'TZ', 'name':'坦桑尼亚', 'color':'#de4c4f', 'latitude':-6, 'longitude':35},
		{'code':'TH', 'name':'泰国', 'color':'#eea638', 'latitude':15, 'longitude':100},
		{'code':'TG', 'name':'多哥', 'color':'#de4c4f', 'latitude':8, 'longitude':1.1667},
		{'code':'TT', 'name':'特立尼达和多巴哥', 'color':'#a7a737', 'latitude':11, 'longitude':-61},
		{'code':'TN', 'name':'突尼斯', 'color':'#de4c4f', 'latitude':34, 'longitude':9},
		{'code':'TR', 'name':'火鸡', 'color':'#d8854f', 'latitude':39, 'longitude':35},
		{'code':'TM', 'name':'土库曼斯坦', 'color':'#eea638', 'latitude':40, 'longitude':60},
		{'code':'UG', 'name':'乌干达', 'color':'#de4c4f', 'latitude':1, 'longitude':32},
		{'code':'UA', 'name':'乌克兰', 'color':'#d8854f', 'latitude':49, 'longitude':32},
		{'code':'AE', 'name':'阿拉伯联合酋长国', 'color':'#eea638', 'latitude':24, 'longitude':54},
		{'code':'GB', 'name':'英国', 'color':'#d8854f', 'latitude':54, 'longitude':-2},
		{'code':'US', 'name':'美国', 'color':'#a7a737', 'latitude':38, 'longitude':-97, 'position':'left'},
		{'code':'UY', 'name':'乌拉圭', 'color':'#86a965', 'latitude':-33, 'longitude':-56},
		{'code':'UZ', 'name':'乌兹别克斯坦', 'color':'#eea638', 'latitude':41, 'longitude':64},
		{'code':'VE', 'name':'委内瑞拉', 'color':'#86a965', 'latitude':8, 'longitude':-66},
		{'code':'PS', 'name':'西岸和加沙', 'color':'#eea638', 'latitude':32, 'longitude':35.25},
		{'code':'VN', 'name':'越南', 'color':'#eea638', 'latitude':16, 'longitude':106},
		{'code':'YE', 'name':'也门', 'color':'#eea638', 'latitude':15, 'longitude':48},
		{'code':'ZM', 'name':'赞比亚', 'color':'#de4c4f', 'latitude':-15, 'longitude':30},
		{'code':'ZW', 'name':'津巴布韦', 'color':'#de4c4f', 'latitude':-20, 'longitude':30}
    ];
    
    var getLatlongItem = function(name) {
    	var result = undefined;
    	latlong.forEach(function (item) {
    		if(name == item.name) {
    			result = item;
    		}
		});
		return result;
    }
    
    /**
     * [{title:"xxx",url:"http://xxx",value:20}] -> 
     * ["xxx:20","xxx1:30","xxx2:40"] or [{url:"http://xxx",value:20},{url:"http://xxx1",value:30},{url:"http://xxx2",value:40}]
     */
    var convertData = function (data,column) {
    	data = data.sort(function (a, b) {
	        return a.value - b.value;
	    })
	    
	    var res = [];
	    for (var i = 0; i < data.length; i++) {
	    	if(column[0] == 'title') {
	    		var title = data[i][column[0]];
	    		var value = data[i][column[1]];
	    		res.push(title + " : " + value);
	    	} else {
	    		var url = data[i][column[0]];
	    		var value = data[i][column[1]];
            	res.push({url: url, value: value});
            }
	    }
	    return res;
	};
	
	var areaColor = '#323c48';
	var borderColor = '#111';
	
	var option = {
	    // backgroundColor: '#404a59',
	    title : {
	        text: '访客国家分布',
	        subtext: '访问热度',
	        left: 'center',
	        top: 'top',
	        textStyle: {
	            color: '#fff'
	        }
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter : function (params) {
	        	var type = typeof params.value;
	        	var value = params.value;
	        	if(type == 'object') {
	        		return params.name + ' : ' + value[2];
	        	}
	            return params.name;
	        }
	    },
	    visualMap: {
	        show: false,
	        min: 0,
	        inRange: {
	            symbolSize: [6, 60]
	        }
	    },
	    geo: {
	        name: '外国人看中国',
	        type: 'map',
	        map: 'world',
	        left: '3',
	        right: '32%',
	        roam: true,
	        label: {
	            emphasis: {
	                show: false
	            }
	        },
	        itemStyle: {
	            normal: {
	                areaColor: areaColor,
	                borderColor: borderColor
	            },
	            emphasis: {
	                areaColor: '#2a333d'
	            }
	        }
	    },
	    grid: {
	        right: 20,
	        top: 25,
	        bottom: '50%',
	        width: '30%'
	    },
	    xAxis: {
	        type: 'value',
	        min: 0,
	        scale: true,
	        position: 'top',
	        boundaryGap: false,
	        splitLine: {show: false},
	        axisLine: {show: false},
	        axisTick: {show: false},
	        axisLabel: {show: false, margin: 2, textStyle: {color: '#aaa'}}
	    },
	    yAxis: {
	        type: 'category',
	        axisLine: {show: false, lineStyle: {color: '#ddd'}},
	        axisTick: {show: false, lineStyle: {color: '#ddd'}},
	        axisLabel: {inside: true,interval: 0, textStyle: {fontSize: 16,color: '#ffffff'}},
	        zlevel: 3,
	        data: []
	    },
	    series : [
	        {
	            type: 'scatter',
	            name: 'main',
	            coordinateSystem: 'geo'
	        },
	        {
	            name: 'content',
	            zlevel: 2,
	            type: 'bar',
	            symbol: 'none',
	            itemStyle: {
	                normal: {
	                    color: '#3B6C88', // #356aa0
	                    barBorderWidth: 0,
				        shadowBlur: 10,
				        shadowOffsetX: 3,
				        shadowOffsetY: 3,
				        shadowColor: '#000000'
	                }
	            }
	        },{
	            name: 'slave',
	            type: 'pie',
	            radius : '36%',
	            center: ['84%', '73%'],
	            roseType: 'angle',
	            label: {
	                normal: {
	                    textStyle: {
	                    	fontSize: 16,
	                        color: '#ffffff'
	                    }
	                }
	            },
	            itemStyle: {
	                normal: {
	                    color: '#c23531',
	                    shadowBlur: 200,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
	
	var interval = 1;
	var time = 60633;
	
	function ajaxQuery() {
		var getUrl = "common/stream_getCountryList?time=" + time;
		time++;
		
	    $.get({url:getUrl}).done(function(data) {
			var country = data.country;
			var content = data.content;
			
			var max = 0;
			country.forEach(function (itemOpt) {
			    if (itemOpt.value > max) {
			        max = itemOpt.value;
			    }
			});
			
			if(max == 0) {
				return ;
			}
			
			/*
			myChart.setOption({
		        series: [{
		        	name: 'main',
		            data: []
		        },{
		            name: 'slave',
		            data: []
		        },{
		            name: 'content',
		            data: []
		        }]
		    })*/
			
		    myChart.setOption({
		    	visualMap: {
			        max: max,
			    },
		    	yAxis: {
		    		data: convertData(content,['title','value'])
	    		},
		        series: [{
		            name: 'main',
		            data: country.map(function (itemOpt) {
		            	var itemCountry = getLatlongItem(itemOpt.name);
		            	if(itemCountry == undefined) {
		            		return ;
		            	}
		            	var position = itemCountry.position == undefined ? 'top' : itemCountry.position;
		                return {
		                    name: itemOpt.name,
		                    symbol: "pin",
		                    value: [
		                        itemCountry.longitude,
		                        itemCountry.latitude,
		                        itemOpt.value
		                    ],
		                    dimeId: itemOpt.dimeId,
		                    label: {
		                    	normal: {
		                    		show: true,
		                    		position:position,
		                    		formatter: function (param) {
					                    return param.data['name'] + ":" + param.data['value'][2];
					                },
					                textStyle: {
					                	fontSize: 16
					                }
		                        },
		                        emphasis: {
		                            show: true,
		                    		position:position,
		                    		formatter: function (param) {
					                    return param.data['name'] + ":" + param.data['value'][2];
					                },
					                textStyle: {
					                	fontSize: 20
					                }
		                        }
		                    },
		                    itemStyle: {
		                        normal: {
		                            color: itemCountry.color
		                        }
		                    }
		                };
		            })
		        },{
		            name: 'slave',
		            data: country.map(function (itemOpt) {
		            	return {name:itemOpt.name,value:itemOpt.value,dimeId:itemOpt.dimeId};
		            })
		        },{
		            name: 'content',
		            data: convertData(content,['url','value'])
		        }]
		    });
		});
	}
	
	ajaxQuery();
	setInterval(ajaxQuery, interval * 1000);
    
	myChart.setOption(option);
	
	myChart.on('click', function (params) {
		var seriesType = params.seriesType;
		if(seriesType == 'bar') {
			var url = params.data.url;
			window.open(url);
		}
	});
    </script>
  </body>
</html>