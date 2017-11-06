<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../public/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="${baseurl}/public/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/public/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${baseurl}/public/css/table.css"/>
    <%--<link rel="stylesheet" href="${baseurl}/public/utils/showTimePlugin.js">--%>
    <script type="text/javascript" src="${baseurl}/public/js/jquery.min.js"></script>

</head>

<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote layui-form">
        <div class="layui-inline">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: auto">教学空间类型</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="" id="roomType">
                        <option value="">直接选择或搜索选择</option>
                        <option value="教室利用率">教室利用率</option>
                        <option value="工作室利用率">工作室利用率</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label" style="width: auto">统计时间</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="" id="showTheLastFiveYear">
                        <option value="">直接选择或搜索选择</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="" id="showTheLastFiveMonth">
                        <option value="">直接选择或搜索选择</option>
                    </select>
                </div>
            </div>
        </div>

        <a class="layui-btn" onclick="pageCurrent = 1;cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

        <a class="refer layui-btn " id="add">
            <i class="layui-icon">&#xe61f;</i>添加
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>教学空间利用率</legend>
        <div>

            <table class="site-table table-hover ">
                <thead>
                <tr>
                    <%--<th><input type="checkbox" lay-skin="primary" onclick="check(this)" lay-filter="checkedAll"></th>--%>
                    <th>编号</th>
                    <th>类型</th>
                    <th>统计时间</th>
                    <th>利用率</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="tr_1">

                </tbody>
            </table>
        </div>

        <div id="demo1"></div>
        <ul id="biuuu_city_list"></ul>
    </fieldset>
</div>
<script id="list-tpl" type="text/html">
    {{# layui.each(d, function(index, item){ }}
    <tr>
        <td>{{ index+1 }}</td>
        <td>{{ item.type }}</td>
        <th>{{ item.year + "年" + item.month + "月" }}</th>
        <th>{{ item.utilizationRate }}</th>
        <td>
            <button class='layui-btn layui-btn-small layui-icon' onclick="cl.updateUser('{{item.id}}')">&#xe642;编辑
            </button>
            <button data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-small layui-icon'
                    onclick="cl.delete('{{item.id}}')">
                &#xe640;删除
            </button>
        </td>
    </tr>
    {{# }); }}
</script>

</body>
<div id="refer_div" style="display: none">
    <form class="layui-form layui-form-pane" id="update-form" style="padding-left: 25%;padding-top: 10%;">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">教学空间类型：</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="" id="typeByAdd">
                        <option value="">直接选择或搜索选择</option>
                        <option value="教室利用率">教室</option>
                        <option value="工作室利用率">工作室</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">录入时间：</label>
                <div class="layui-input-inline">
                    <input class="layui-input" name="dateByAdd" placeholder="选择录入时间"
                           onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">利用率：</label>
                <div class="layui-input-inline">
                    <input type="text" name="utilizationRateByAdd" autocomplete="off" class="layui-input"
                           placeholder="利用率">
                </div>
            </div>
        </div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" lay-submit="" type="submit" onclick="cl.addAjax()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </form>
</div>
<script id="list-userInfo" type="text/html">
    {{# layui.each(d, function(index, item){ }}
    <tr>
        <th>管理级别</th>
        <th>{{item.rankValue}}</th>
    </tr>
    <tr>
        <th>用户ID</th>
        <th>{{item.username}}</th>
    </tr>
    <tr>
        <th>用户姓名</th>
        <th>{{item.nickname}}</th>
    </tr>
    <tr>
        <th>性别</th>
        <th>{{item.sex}}</th>
    </tr>
    <tr>
        <th>年龄</th>
        <th>{{item.age}}</th>
    </tr>
    <tr>
        <th>手机号</th>
        <th>{{item.phone}}</th>
    </tr>
    <tr>
        <th>级别代码</th>
        <th>eudss:{{item.rank}}</th>
    </tr>
    <tr>
        <th>账号创建日期</th>
        <th>{{item.date}}</th>
    </tr>
    {{# }); }}
</script>

<div id="update_div" style="display: none">
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">教学空间类型：</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="" id="typeByUpdate">
                        <option value="">直接选择或搜索选择</option>
                        <option value="教室利用率">教室</option>
                        <option value="工作室利用率">工作室</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">录入时间：</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="dataByUpdate" placeholder="" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM'})">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">利用率：</label>
                <div class="layui-input-inline">
                    <input type="text" id="utilizationRateByUpdate" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" lay-submit="" type="submit" onclick="cl.updateAjax()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </form>
</div>
<script type="text/javascript" src="${baseurl}/public/plugins/layui/layui.js"></script>
<script>
    var pageCurrent = 1;//当前页数
    var totalPage = 0;//总页数
    let pageSize = 10;
    let cl;
    let getUpdateId;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'layedit', 'laydate'], function () {
        var laypage = layui.laypage
            , layer = layui.layer,
            form = layui.form(),
            laytpl = layui.laytpl;

        cl = {
            page: function () {
                laypage({
                    cont: 'demo1'
                    , pages: totalPage //总页数
                    , groups: 5 //连续显示分页数
                    , curr: pageCurrent
                    , jump: function (obj, first) {
                        //得到了当前页，用于向服务端请求对应数据
                        pageCurrent = obj.curr;
                        if (!first) {
                            cl.list();
                        }
                    }
                });
            },
            list: function () {
                let type = $("#roomType").val();
                let year = $("#showTheLastFiveYear").val();
                let month = $("#showTheLastFiveMonth").val();

                $.post(baseUrl + "/roomutilization/list", {
                        type: type,
                        year: year,
                        month: month,
                        currentIndex: pageCurrent,
                        pageSize: pageSize
                    },
                    function (data) {
                        console.log(data.data.data)
                        layer.msg('查询成功', {time: 500});
                        totalPage = data.data.totalSize;//总页数

                        cl.page();
                        laytpl($("#list-tpl").text()).render(data.data.data, function (html) {
                            $(".tr_1").html(html);
                        });

                        form.render();
                    }
                );
            },

            updateUser: function (id) {
                $.post(baseUrl + "/roomutilization/findRoomutilizationById", {id: id},
                    function (data) {
                        getUpdateId = id;
                        let dataInfo = data.data[0];
                        if (dataInfo.type == "教室利用率") {
                            $("#typeByUpdate").find("option[value='教室利用率']").attr("selected", true);
                        }else if (dataInfo.type == "工作室利用率"){
                            $("#typeByUpdate").find("option[value='工作室利用率']").attr("selected", true);
                        }
                        form.render();
                        $("#dataByUpdate").val(dataInfo.year + "-" + dataInfo.month);
                        $("#utilizationRateByUpdate").val(dataInfo.utilizationRate);
                        layer.open({
                            type: 1,
                            title: '编辑教学空间利用率'
                            , content: $("#update_div"),
                            area: ['60%', '70%']
                        });
                    }
                );


            },
            addAjax: function () {
//                let data = $("#update-form").serialize();
                let type = $("#typeByAdd").val();
                let year = $("#dateByAdd").val().split("-")[0];
                let month = $("#dateByAdd").val().split("-")[1];
                let utilizationRate = $("input[name='utilizationRateByAdd']").val();
                let data = {
                    type: type,
                    year: year,
                    month: month,
                    utilizationRate: utilizationRate,
                }
                $.post(baseUrl + "/roomutilization/addRoomutilization", data, function (data) {
                    layer.msg(data.msg, {time: 500});
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
            updateAjax: function () {
//                let data = $("#update-form").serialize();
                let id = getUpdateId;
                let type = $("#typeByUpdate").val();
                let year = $("#dataByUpdate").val().split("-")[0];
                let month = $("#dataByUpdate").val().split("-")[1];
                let utilizationRate = $("input[name='utilizationRateByUpdate']").val();
                let data = {
                    id: id,
                    type: type,
                    year: year,
                    month: month,
                    utilizationRate: utilizationRate,
                };
                $.post(baseUrl + "/roomutilization/updateRoomutilization", data, function (data) {
                    layer.msg(data.msg, {time: 500});
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/userInfo/deleteById", {id: id},
                        function (data) {
                            layer.msg(data.msg, {time: 500});
                            if (data.result) {
                                setTimeout("location.reload()", 500);
                            }
                        });
                });
            },
        }

        function showTime() {
            let currentTime = new Date();
            let currentYear = currentTime.getFullYear();
            let currentMonth = currentTime.getMonth() + 1;
            let currentDay = currentTime.getDate();  //获取当前天数
            let detailedsDate = currentYear + "年" + currentMonth + "月" + currentDay + "日";

            let time = {
                currentYear: currentYear,
                currentMonth: currentMonth,
                currentDay: currentDay,
                detailedsDate: detailedsDate
            }

            return time;
        }

        function initializeThePage() {
            let currentYear = showTime().currentYear;
            let currentMonth = showTime().currentMonth;
            $("#showTheLastFiveYear").html(`<option value="">年份</option>`);
            for (let i = 0; i < 5; i++) {
                $("#showTheLastFiveYear").append(`
                <option value="` + currentYear + `"> ` + currentYear + "年" + ` </option>
                `)
                currentYear -= 1;
            }
            $("#showTheLastFiveMonth").html(`<option value="">月份</option>`);
            for (let i = 12; i >= 1; i--) {
                $("#showTheLastFiveMonth").append(`
                <option value="` + i + `"> ` + i + "月" + ` </option>
                `)
            }
        }

        $(function () {
            initializeThePage();
            cl.list();

        });


        $("#add").click(function () {
            layer.open({
                type: 1,
                title: '新增教学空间利用率'
                , content: $("#refer_div"),
                area: ['60%', '70%']
            });
        });

    });

</script>

</html>