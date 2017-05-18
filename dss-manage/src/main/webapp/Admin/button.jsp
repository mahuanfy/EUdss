<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>创课各分院每月点击次数数据统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="css/eu_manage.css" media="all">
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        var tronClasstype = [];
        $.post("/TronClassServlet",
            function (data, status) {
                for (var i = 0; i < data.length; i++) {
                    tronClasstype = data[i];
                    $(".tr_1").append("<tr> <td><input type='checkbox'></td>" +
                        "<td>" + tronClasstype['id'] + "</td>" +
                        "<td>" + tronClasstype['tron_month'] + "</td>" +
                        "<td>" + tronClasstype['eu_rj'] + "</td>" +
                        "<td>" + tronClasstype['eu_xin'] + "</td>" +
                        "<td>" + tronClasstype['eu_rw'] + "</td>" +
                        "<td>" + tronClasstype['eu_ts'] + "</td>" +
                        "<td>" + tronClasstype['eu_xiu'] + "</td>" +
                        "<td>" + tronClasstype['eu_gz'] + "</td>" +
                        "<td>" + tronClasstype['eu_kuai'] + "</td>" +
                        "<td>" + tronClasstype['eu_ad'] + "</td>" +
                        "<td>" + tronClasstype['eu_wc'] + "</td>" +
                        "<td>" + tronClasstype['eu_wu'] + "</td>" +
                        "<td>" + tronClasstype['eu_jr'] + "</td>" +
                        "<td><a href='/detail-1' target='_blank' class='layui-btn layui-btn-normal layui-btn-mini'>预览</a>" +
                        "<a href='/manage/article_edit_1' class='layui-btn layui-btn-mini'>编辑</a>" +
                        "<a href='javascript:;' data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>删除</a>" +
                        "</td> </tr>"
                    );
                }
            },
            "json"
        );
    });
</script>

<body>

<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>创课各分院每月点击次数数据统计</legend>
        <div>
            <table class="layui-table">
                <colgroup>
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th><input type="checkbox" id="selected-all"></th>
                    <th>ID</th>
                    <th>月份</th>
                    <th>人居环境学院</th>
                    <th>信息工程学院</th>
                    <th>人文教育学院</th>
                    <th>通识学院</th>
                    <th>休闲管理学院</th>
                    <th>高职学院</th>
                    <th>会计学院</th>
                    <th>爱德艺术学院</th>
                    <th>文化传媒学院</th>
                    <th>物流贸易学院</th>
                    <th>金融学院</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="tr_1">

                    <%--<td><input type="checkbox"></td>--%>



                </tbody>
            </table>
        </div>
    </fieldset>
</div>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
</body>

</html>