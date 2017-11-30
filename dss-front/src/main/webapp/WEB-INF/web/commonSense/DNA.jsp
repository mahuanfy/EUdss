<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../page/tag.jsp" %>
<!--西安欧亚学院创课师生点击量统计-->
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<title>西安欧亚学院创课师生点击量统计</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" href="${baseurl}/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${baseurl}/css/global.css" media="all">

	<link href="${baseurl}/css/mycss/eurisia_echar.css" rel="stylesheet" type="text/css"/>
	<script src="${baseurl}/js/myjs/jquery.min.js"></script>
	<script src="${baseurl}/js/myjs/echarts.min.js"></script>
</head>

<body>
<div style="margin: 15px;">
	<fieldset class="layui-elem-field site-demo-button">
		<legend>图表</legend>
		<div>
			<div class="main_his">
				<div id="main_Histogram"></div>
				<script type="text/javascript">
                    var myChart = echarts.init(document.getElementById("main_Histogram"));
                    option = {
                        title : {
                            text: 'DNA课程成绩分析（2016级）',
                            subtext: '数据统计'
                        },
                        color: ['#3398DB'],
                        tooltip : {
                            trigger: 'axis',
                            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis : [
                            {
                                type : 'category',
                                data : ['科学素养', 'office高校办公', '结构化写作', '批判性思维', '人文素养', '商务统计数据分析'],
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis : [
                            {
                                type: 'value',
                                name: '分值',
                                min: 70.00,
                                max: 77.00,
                                interval: 1.00,
                                axisLabel: {
                                    formatter: '{value} .00'
                                }
                            }
                        ],
                        series : [
                            {
                                name:'平均分值',
                                type:'bar',
                                barWidth: '60%',
                                data:[75.34, 73.63, 72.05, 71.97, 71.36, 70.64]
                            }
                        ]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
				</script>
			</div>
		</div>
	</fieldset>

</div>
</body>

</html>