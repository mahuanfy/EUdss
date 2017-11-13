<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../page/tag.jsp" %>
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
                    var option = {
                        title: {
                            text: '2017年退学人数',
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
                            data : ['欠学分强制退学', '参加校外培训','违反国家法律','休学超期未复学','工作实践', '逾期未注册', '学习成绩差', '生活不适应', '志趣不合', '家庭原因','经济原因','出国','生病身体原因','入伍','复读'],
                        },
                        series: [
                            {
                                name: '访问来源',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: [
                                    {value: 0, name: '欠学分强制退学'},
                                    {value: 1, name: '参加校外培训'},
                                    {value: 1, name: '违反国家法律'},
                                    {value: 1, name: '休学超期未复学'},
                                    {value: 14, name: '工作实践'},
                                    {value: 70, name: '逾期未注册'},
                                    {value: 3, name: '学习成绩差'},
                                    {value: 0, name: '生活不适应'},
                                    {value: 8, name: '志趣不合'},
                                    {value: 11, name: '家庭原因'},
                                    {value: 0, name: '经济原因'},
                                    {value: 3, name: '出国'},
                                    {value: 4, name: '生病身体原因'},
                                    {value: 1, name: '入伍'},
                                    {value: 14, name: '复读'}
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
                </script>
            </div>
        </div>
    </fieldset>

</div>
</body>

</html>