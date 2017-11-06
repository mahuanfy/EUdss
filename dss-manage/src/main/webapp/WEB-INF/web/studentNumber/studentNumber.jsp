<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../public/tag.jsp" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${baseurl}/public/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/public/css/eu_manage.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${baseurl}/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="${baseurl}/public/js/layui.js" charset="utf-8"></script>
</head>
<style>
    .layui-table td , .layui-table th{
        padding: 4px 5px;
        text-align: center;
    }
</style>
<body>
<div style="margin: 15px;">
    <blockquote class="layui-elem-quote  mylog-info-tit layui-form">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <select name="year" id="searchYear" lay-filter="aihao">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <a class="layui-btn" onclick="cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
        <span class="refer layui-btn " onclick="cl.add()">
                    <i class="layui-icon">&#xe61f;</i>&nbsp;添加
                </span>
    </blockquote>
    <fieldset class="layui-elem-field site-demo-button">
        <legend>年级学生人数统计</legend>
        <table class="layui-table">
            <colgroup>
                <col width="100">
                <col width="350">
                <col width="350">
                <col width="350">
                <col width="160">
            </colgroup>
            <thead>
            <tr style="text-align: center;">
                <th>编号</th>
                <th>年级</th>
                <th>本科生人数</th>
                <th>专科生人数</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="tr_1">.
            </tbody>
        </table>
        <div id="demo1"></div>
    </fieldset>
</div>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.studentInfo, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{item.grade+"级"}}</td>
        <td>{{item.ndergraduate+"人"}}</td>
        <td>{{item.specialty+"人"}}</td>
        <td>
            <button onclick="cl.update('{{ item.id }}')" class='layui-btn layui-btn-small layui-icon'>&#xe642;编辑
            </button>
            <button onclick="cl.delete('{{ item.id }}')" class='layui-btn layui-btn-danger layui-btn-small layui-icon'>
                &#xe640;删除
            </button>
        </td>
    </tr>
    {{# }); }}
</script>
<script type="text/javascript" src="${baseurl}/public/plugins/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let cl;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'layedit', 'laydate'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        cl = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            cl.list();
                        }
                    }
                });
            },
            list: function () {
                $.post("${pageContext.request.contextPath}/studentNumber/list", {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        grade: $("#searchYear").val()
                    },
                    function (data) {
                        console.log(data)
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            cl.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $(".tr_1").html(html);
                            });
                            form.render();
                        }
                    },
                    "json"
                );
            },
            add: function () {
                layer.open({
                    type: 1,
                    title: '添加年级学生人数',
                    area: ['400px', '350px'],
                    skin: 'yourclass',
                    content: $('#refer_div')
                });
            },
            addAjax: function () {
                let studentNumber = $("#beanInfo").serialize();
                $.post("${baseurl}/studentNumber/add", studentNumber, function (data) {
                    if (data.result) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    }
                });
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post("${baseurl}/studentNumber/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    });

                });
            },
            update: function (id) {
                $.post("${baseurl}/studentNumber/queryById", {id: id}, function (data) {
                    $("#updateId").val(data.studentInfo[0].id);
                    $("#ndergraduate").val(data.studentInfo[0].ndergraduate);
                    $("#specialty").val(data.studentInfo[0].specialty);
                    layer.open({
                        type: 1,
                        title: '修改年级学生人数',
                        area: ['400px', '350px'],
                        content: $('#update')
                    });
                });
            },
            updateAjax: function () {
                let studentNumber = $("#beanInfoUpdate").serialize();
                $.post("${baseurl}/studentNumber/update", studentNumber, function (data) {
                    if (data.result) {
                        console.log(data)
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    }
                });
            },
            year: function () {
                //年份显示
                var now = new Date();
                var year = now.getFullYear();
                $("#addYear").html("");
                $("#updateYear").html("");
                $("#searchYear").html("<option value=''>请选择年级</option>");
                for (var i = 1; i < 10; i++) {
                    $("#updateYear").append("<option value='" + year + "'>" + (year) + "级</option>");
                    $("#addYear").append("<option value='" + year + "'>" + (year) + "级</option>");
                    $("#searchYear").append("<option value='" + year + "'>" + (year--) + "级</option>");
                }
            }

        }
        $(function () {
            cl.list();
            cl.year();
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (valu0e) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>

</body>
<div id="refer_div" style="display: none">
    <form class="layui-form" id="beanInfo">
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-inline">
                <select name="grade" id="addYear" lay-filter="aihao">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">本科生人数</label>
                <div class="layui-input-inline">
                    <input type="number" name="ndergraduate" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">专科生人数</label>
                <div class="layui-input-inline">
                    <input type="number" name="specialty" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="huan_a"></div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" onclick="cl.addAjax()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<div id="update" style="display: none">
    <form class="layui-form" id="beanInfoUpdate">
        <input id="updateId" name="id" style="display: none"/>
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级</label>
            <div class="layui-input-inline">
                <select name="grade" id="updateYear" lay-filter="aihao">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">本科生人数</label>
                <div class="layui-input-inline">
                    <input type="number" name="ndergraduate" id="ndergraduate" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">专科生人数</label>
                <div class="layui-input-inline">
                    <input type="number" name="specialty" id="specialty" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="huan_a"></div>
            <div class="layui-input-block huan_center">
                <button class="layui-btn" onclick="cl.updateAjax()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
    </form>
</div>
</html>
