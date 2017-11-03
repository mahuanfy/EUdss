<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../page/tag.jsp" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>年级学生人数</title>
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
				<legend>年级学生人数统计</legend>

					<div class="main_his">
						<div id="main_Histogram1" ></div>
						<script type="text/javascript">
                            var grade = [];
                            var ndergraduate = [];
                            var specialty = [];
                            $.post("${pageContext.request.contextPath}/studentNumberFront/queryStudentInfo", function (data) {
								for(let i = 0;i<data.studentInfo.length;i++){
                                    grade.push(data.studentInfo[i].grade+"级");
                                    ndergraduate.push(data.studentInfo[i].ndergraduate);
                                    specialty.push(data.studentInfo[i].specialty);
								}
                                var myChart = echarts.init(document.getElementById("main_Histogram1"));

                                var option = {

                                    tooltip: {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data: ['本科生学生人数', '专科生学生人数']
                                    },
                                    toolbox: {
                                        feature: {
                                            saveAsImage: {}
                                        }
                                    },
                                    xAxis: {
                                        type: 'category',
                                        boundaryGap: false,
                                        data: grade
                                    },
                                    yAxis: {
                                        type: 'value',
                                        name: '比例',
                                        axisLabel: {
                                            formatter: '{value}人'
                                        }
                                    },
                                    series: [
                                        {
                                            name: '本科生学生人数',
                                            type: 'line',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'top'
                                                }
                                            },
                                            data: ndergraduate
                                        },
                                        {
                                            name: '专科生学生人数',
                                            type: 'line',
                                            label: {
                                                normal: {
                                                    show: true,
                                                    position: 'top'
                                                }
                                            },
                                            data: specialty
                                        }
                                    ]
                                };

                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            });
						</script>
					</div>

			</fieldset>

		</div>
	</body>

</html>