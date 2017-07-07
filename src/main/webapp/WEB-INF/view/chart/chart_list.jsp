<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- 引入easyui组件 -->
	<%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/default/easyui.css" />--%>
	<%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/icon.css" />--%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/Highcharts-5.0.12/code/highcharts.js"></script>
	<%--<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/jquery.easyui.min.js"></script>--%>
	<%--<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/locale/easyui-lang-zh_CN.js"></script>--%>

</head>
<body>
<div>
	<div style="width: 50%; height: 50%; float: left">
		<div id="container" style="width:100%;height:100%"></div>
	</div>
	<div style="width: 50%; height: 50%; float: right">
		<div id="container2" style="width:100%;height:100%"></div>
	</div>
</div>
<script type="text/javascript">
	var data_array = [];
	var user_count_array = [];
	$(function () {
		//发送ajax从后台获取数据
//			var data_array = ['06-01', '06-02', '06-03', '06-04', '06-05', '06-06', '06-07'];
//			var user_count_array = [502, 635, 809, 947, 1402, 3634, 40];
		$.ajax({
			url:"<%=request.getContextPath() %>/bookList.html",
			type:"post",
			dataType:"json",
//			async:false,
			success:function(data) {
			if (null != data) {
			for (var i = 0; i < data.length; i++) {
			alert(data[i].regeditdate)
			data_array[i] = data[i].regeditdate;
			user_count_array[i] = data[i].usernum;
					}
			//调用图表生成
				load_user_area();
				}
			},
			error: function(e){
				alert(e);

			}
		});

	})

	function chart(){
		var chart = new Highcharts.Chart('container2', {
			title: {
				text: '不同城市的月平均气温',
				x: -20
			},
			subtitle: {
				text: '数据来源: WorldClimate.com',
				x: -20
			},
			xAxis: {
				categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
			},
			yAxis: {
				title: {
					text: '温度 (°C)'
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			tooltip: {
				valueSuffix: '°C'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '东京',
				data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
			}, {
				name: '纽约',
				data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
			}, {
				name: '柏林',
				data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
			}, {
				name: '伦敦',
				data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
			}]
		});
	}
		function load_user_area(){
			$('#container').highcharts({
				chart: {
					type: 'area'
				},
				title: {
					text: '全球各大洲人口增长历史及预测'
				},
				subtitle: {
					text: '数据来源: Wikipedia.org'
				},
				xAxis: {
					categories: data_array,
					tickmarkPlacement: 'on',
					title: {
						enabled: false
					}
				},
				yAxis: {
					title: {
						text: '十亿'
					},
					labels: {
						formatter: function () {
							return this.value / 1000;
						}
					}
				},
				tooltip: {
					split: true,
					valueSuffix: ' 百万'
				},
				plotOptions: {
					area: {
						stacking: 'normal',
						lineColor: '#666666',
						lineWidth: 1,
						marker: {
							lineWidth: 1,
							lineColor: '#666666'
						}
					}
				},
				series: [{
					name: '用户',
					data:user_count_array
				}]
			});
		}
</script>
</body>
</html>