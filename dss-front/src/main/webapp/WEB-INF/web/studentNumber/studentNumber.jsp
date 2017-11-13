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
                    var grade = '';
                    var ndergraduate = 0;
                    var specialty = 0;
                    var upgraded = 0;
                    $.post("${pageContext.request.contextPath}/studentNumberFront/queryStudentInfo", function (data) {
                        grade = data.studentInfo[0].grade + "级学生统计";
                        ndergraduate = data.studentInfo[0].ndergraduate;
                        specialty = data.studentInfo[0].specialty;
                        upgraded = data.studentInfo[0].upgraded;

                        var myChart = echarts.init(document.getElementById("main_Histogram"));
                        var option = {
                            title: {
                                text: grade,
                                subtext: '(单位/人)',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: ['本科生', '专科生', '专升本']
                            },
                            series: [
                                {
                                    name: '访问来源',
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: [
                                        {value: ndergraduate, name: '本科生'},
                                        {value: specialty, name: '专科生'},
                                        {value: upgraded, name: '专升本'},
                                    ],
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                    });
				</script>
			</div>
		</div>
	</fieldset>

</div>
</body>

</html>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@page isELIgnored="false" %>--%>
<%--<%@ include file="../../../page/tag.jsp" %>--%>
<%--<!doctype html>--%>
<%--<html>--%>

	<%--<head>--%>
		<%--<meta charset="utf-8">--%>
		<%--<title>年级学生人数</title>--%>
		<%--<meta name="renderer" content="webkit">--%>
		<%--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
		<%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>

		<%--<link rel="stylesheet" href="${baseurl}/plugins/layui/css/layui.css" media="all" />--%>
		<%--<link rel="stylesheet" href="${baseurl}/css/global.css" media="all">--%>

		<%--<link href="${baseurl}/css/mycss/eurisia_echar.css" rel="stylesheet" type="text/css"/>--%>
		<%--<script src="${baseurl}/js/myjs/jquery.min.js"></script>--%>
		<%--<script src="${baseurl}/js/myjs/echarts.min.js"></script>--%>
	<%--</head>--%>
	<%--<body>--%>
	<%--<div style="margin: 15px;">--%>
			<%--<fieldset class="layui-elem-field site-demo-button">--%>
				<%--<legend>年级学生人数统计</legend>--%>

					<%--<div class="main_his">--%>
						<%--<div id="main_Histogram1" ></div>--%>
						<%--<script type="text/javascript">--%>
                            <%--var grade = '';--%>
                            <%--var ndergraduate = 0;--%>
                            <%--var specialty = 0;--%>
                            <%--var upgraded = 0;--%>
                            <%--$.post("${pageContext.request.contextPath}/studentNumberFront/queryStudentInfo", function (data) {--%>
                                    <%--grade = data.studentInfo[0].grade+"级学生统计";--%>
                                    <%--ndergraduate = data.studentInfo[0].ndergraduate;--%>
                                    <%--specialty = data.studentInfo[0].specialty;--%>
                                    <%--upgraded = data.studentInfo[0].upgraded;--%>

                                <%--&lt;%&ndash;console.log(ndergraduate)&ndash;%&gt;--%>
                                <%--var myChart = echarts.init(document.getElementById("main_Histogram"));--%>
                                <%--var option = {--%>
                                    <%--title: {--%>
                                        <%--text: '专业与学科情况分析',--%>
                                        <%--subtext: '每月统计量(单位/次)',--%>
                                        <%--x: 'center'--%>
                                    <%--},--%>
                                    <%--tooltip: {--%>
                                        <%--trigger: 'item',--%>
                                        <%--formatter: "{a} <br/>{b} : {c} ({d}%)"--%>
                                    <%--},--%>
                                    <%--legend: {--%>
                                        <%--orient: 'vertical',--%>
                                        <%--left: 'left',--%>
                                        <%--data: ['大一学生', '大二学生', '大三学生', '大四学生', '代课老师']--%>
                                    <%--},--%>
                                    <%--series: [--%>
                                        <%--{--%>
                                            <%--name: '访问来源',--%>
                                            <%--type: 'pie',--%>
                                            <%--radius: '55%',--%>
                                            <%--center: ['50%', '60%'],--%>
                                            <%--data: [--%>
                                                <%--{value: 335, name: '大一学生'},--%>
                                                <%--{value: 310, name: '大二学生'},--%>
                                                <%--{value: 234, name: '大三学生'},--%>
                                                <%--{value: 135, name: '大四学生'},--%>
                                                <%--{value: 1548, name: '代课老师'}--%>
                                            <%--],--%>
                                            <%--itemStyle: {--%>
                                                <%--emphasis: {--%>
                                                    <%--shadowBlur: 10,--%>
                                                    <%--shadowOffsetX: 0,--%>
                                                    <%--shadowColor: 'rgba(0, 0, 0, 0.5)'--%>
                                                <%--}--%>
                                            <%--}--%>
                                        <%--}--%>
                                    <%--]--%>
                                <%--};--%>
                                <%--// 使用刚指定的配置项和数据显示图表。--%>
                                <%--myChart.setOption(option);--%>
<%--//                            });--%>
						<%--</script>--%>
					<%--</div>--%>

			<%--</fieldset>--%>

		<%--</div>--%>
	<%--</body>--%>

<%--</html>--%>