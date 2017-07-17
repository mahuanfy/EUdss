<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../public/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="../../../public/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../../public/css/global.css" media="all">
    <link rel="stylesheet" href="../../../public/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../public/css/table.css"/>
    <script type="text/javascript" src="../../../public/js/jquery.min.js"></script>

</head>

<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" name="title" id="name_search" lay-verify="title" autocomplete="off"
                       placeholder="用户姓名" class="layui-input">
            </div>
            <a class="layui-btn" onclick="cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

        </div>
        <a class="refer layui-btn " id="add">
            <i class="layui-icon">&#xe61f;</i>添加
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>三级管理员</legend>
        <div>

            <table class="site-table table-hover ">
                <thead>
                <tr>
                    <%--<th><input type="checkbox" lay-skin="primary" onclick="check(this)" lay-filter="checkedAll"></th>--%>
                    <th>编号</th>
                    <th>管理级别</th>
                    <th>用户姓名</th>
                    <th>用户ID</th>
                    <th>性别</th>
                    <th>创建时间</th>
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
        <td>{{ index+1}}</td>
        <td>{{ item.rankValue}}</td>
        <th>{{item.nickname}}</th>
        <th>{{item.username}}</th>
        <th>{{item.sex}}</th>
        <th>{{item.phone}}</th>
        <td>
            <a class="layui-btn layui-btn-small layui-btn-normal  layui-icon " onclick="cl.preview('{{item.id}}')">
                &#xe60a; 预览
            </a>
            <button class='layui-btn layui-btn-small layui-icon'>&#xe642;编辑</button>
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
                <label class="layui-form-label">用户姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="nickname" autocomplete="off" class="layui-input" placeholder="用户姓名">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户ID：</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" autocomplete="off" class="layui-input" placeholder="登录账号">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" autocomplete="off" class="layui-input" placeholder="登录密码">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账户权限：</label>
            <div class="layui-input-inline">
                <select name="rank">
                    <option value="0">超级管理员</option>
                    <option value="1">一级管理员</option>
                    <option value="2">二级管理员</option>
                    <option value="3" selected="">三级管理员</option>
                </select>
            </div>
        </div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" lay-submit="" type="submit" onclick="cl.updateAjax()">立即提交</button>
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
<div id="preview_div" style="display: none">
    <div style="margin: 0 10%;">
        <fieldset class="layui-elem-field site-demo-button" style="padding:40px;">
            <legend>一级管理员详情信息</legend>
            <table class="site-table table-hover ">
                <thead>
                <tr>
                    <th>信息</th>
                    <th>详情</th>

                </tr>
                </thead>
                <tbody id="userInfo">

                </tbody>
            </table>
        </fieldset>
    </div>
</div>
<script type="text/javascript" src="../../../public/plugins/layui/layui.js"></script>
<script>
    var cl;
    var pageCurrent = 0;//当前页数
    var totalPage = 0;//总页数
    layui.use(['laypage', 'layer', 'laytpl', 'form'], function () {
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
                let username = $("#name_search").val();
                $.post("${pageContext.request.contextPath}/UserInfo/findThirdUser",
                    {pageCurrent: pageCurrent, rank: 3, username: username},
                    function (data) {
                        layer.msg('查询成功',{time:500});
                        totalPage = data.totalPage;//总页数

                        cl.page();
                        laytpl($("#list-tpl").text()).render(data.UserInfo, function (html) {
                            $(".tr_1").html(html);
                        });
                        form.render();
                    }
                );
            },
            preview: function (id) {
                cl.findById(id);
                layer.open({
                    type: 1,
                    title: '管理员信息'
                    , content: $("#preview_div"),
                    area: ['100%', '100%']
                });

            },
            findById: function (id) {
                $.post("${pageContext.request.contextPath}/UserInfo/findById", {id: id},
                    function (data) {
                        laytpl($("#list-userInfo").text()).render(data.user, function (html) {
                            $("#userInfo").html(html);
                        });
                        form.render();
                        layer.msg(data.msg, {time: 500});
                    }
                );

            },
            updateAjax: function () {
                let data = $("#update-form").serialize();
                $.post(baseUrl + "/UserInfo/insertUser", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }

                })
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/UserInfo/deleteById", {id: id},
                        function (data) {
                            layer.msg(data.msg, {time: 500});
                            if (data.result) {
                                setTimeout("location.reload()", 500);
                            }
                        });
                });
            }
        }
        $(function () {
            cl.list();
        });


        $("#add").click(function () {

            layer.open({
                type: 1,
                title: '添加用户'
                , content: $("#refer_div"),
                area: ['40%', '70%']
            });
        });


    });

</script>
</html>