<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../page/tag.jsp" %>
<!--西安欧亚学院各分院创课平均访问总量统计-->
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>西安欧亚学院各分院创课平均访问总量统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../css/global.css" media="all">

    <link href="../css/mycss/eurisia_echar.css" rel="stylesheet" type="text/css"/>
    <script src="../js/myjs/jquery.min.js"></script>
    <script src="../js/myjs/echarts.min.js"></script>
</head>
<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>图表</legend>

        <div class="main_his">
            <div id="main_Histogram"></div>
            <script type="text/javascript">
                var dateOne = new Array(11);
                let yearOne = "";
                let yearTwo = "";
                let subtext = "";
                $.post("${pageContext.request.contextPath}/TronClassFront/tronClass", function (data) {
                    console.log(data);
                    let valueOne = data.TronClass[1];
                    let valueTwo = data.TronClass[0];
                        dateOne[0] = valueOne.eu_ad;
                    subtext =valueOne.tron_month+"、"+valueTwo.tron_month+"月份统计量(学院)";
                    yearOne = valueOne.year+"年 "+valueOne.tron_month+"月份";
                    yearTwo = valueTwo.year+"年 "+valueTwo.tron_month+"月份";
                // 树状图
                var myChart = echarts.init(document.getElementById("main_Histogram"));
                var option = {
                    title: {
                        text: '西安欧亚学院各分院创课平均访问总量统计',
                        subtext: subtext
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: [yearOne, yearTwo]
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
//                                        data: ['人居环境', '信息工程', '人文教育', '通识教育', '休闲管理', '高职', '会计', '艾德艺术', '文化传媒', '物流贸易', '金融']
                            data: ['人居环境\n学院', '信息工程\n学院', '人文教育\n学院', '通识教育\n学院', '休闲管理\n学院', '高职\n学院', '会计\n学院', '艾德艺术\n设计学院', '文化传媒\n学院', '物流贸易\n学院', '金融\n学院']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: yearOne,
                            type: 'bar',
                            //  data: [20, 49, 70, 232, 256, 767, 1356, 1622, 326, 200, 64, 33],
                            data: dateOne,
                            markPoint: {
                                data: [
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: yearTwo,
                            type: 'bar',
                            data: [2303, 1394, 1654, 1561, 1712, 1706, 966, 866, 1133, 1127, 755],
                            markPoint: {
                                data: [
//                                    {name: '年最高', value: 1822, xAxis: 7, yAxis: 1822},
//                                    {name: '年最低', value: 23, xAxis: 11, yAxis: 23}
                                    {type: 'max', name: '最大值'},
                                    {type: 'min', name: '最小值'}
                                ]
                            },
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
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