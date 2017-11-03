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

    <link rel="stylesheet" href="${baseurl}/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/css/global.css" media="all">

    <link href="${baseurl}/css/mycss/eurisia_echar.css" rel="stylesheet" type="text/css"/>
    <script src="${baseurl}/js/myjs/jquery.min.js"></script>
    <script src="${baseurl}/js/myjs/echarts.min.js"></script>
</head>
<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>图表</legend>

        <div class="main_his">
            <div id="main_Histogram"></div>
            <script type="text/javascript">
                var dateOne = new Array(11);
                var dateTwo = new Array(11);
                let yearOne = "";
                let yearTwo = "";
                let subtext = "";
                $.post("${pageContext.request.contextPath}/TronClassFront/tronClass", function (data) {
                    let valueOne = data.TronClass[1];
                    let valueTwo = data.TronClass[0];
                    dateOne[0] = valueOne.eu_rj;
                    dateOne[1] = valueOne.eu_xin;
                    dateOne[2] = valueOne.eu_rw;
                    dateOne[3] = valueOne.eu_ts;
                    dateOne[4] = valueOne.eu_xiu;
                    dateOne[5] = valueOne.eu_gz;
                    dateOne[6] = valueOne.eu_kuai;
                    dateOne[7] = valueOne.eu_ad;
                    dateOne[8] = valueOne.eu_wc;
                    dateOne[9] = valueOne.eu_wu;
                    dateOne[10] = valueOne.eu_jr;
                    dateTwo[0] = valueTwo.eu_rj;
                    dateTwo[1] = valueTwo.eu_xin;
                    dateTwo[2] = valueTwo.eu_rw;
                    dateTwo[3] = valueTwo.eu_ts;
                    dateTwo[4] = valueTwo.eu_xiu;
                    dateTwo[5] = valueTwo.eu_gz;
                    dateTwo[6] = valueTwo.eu_kuai;
                    dateTwo[7] = valueTwo.eu_ad;
                    dateTwo[8] = valueTwo.eu_wc;
                    dateTwo[9] = valueTwo.eu_wu;
                    dateTwo[10] = valueTwo.eu_jr;

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
                            data: dateTwo,
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