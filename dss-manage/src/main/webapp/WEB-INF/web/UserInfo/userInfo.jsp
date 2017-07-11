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
        <a class="refer layui-btn layui-btn-normal " id="add">
            <i class="layui-icon">&#xe61f;</i>添加
        </a>
        <a class="layui-btn ">
            <i class="layui-icon ">&#xe642;</i> 编辑
        </a>
        <button class="layui-btn  layui-btn-danger">
            <i class="layui-icon ">&#xe640;</i> 删除
        </button>
        <a class="layui-btn ">
            <i class="layui-icon">&#xe615;</i> 搜索
        </a>
        <a class="layui-btn ">
            <i class="layui-icon">&#xe60a;</i> 预览
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>超级管理员</legend>
        <div>

            <table class="site-table table-hover ">
                <thead>
                <tr>
                    <%--<th><input type="checkbox" lay-skin="primary" onclick="check(this)" lay-filter="checkedAll"></th>--%>
                    <th>编号</th>
                    <th>管理级别</th>
                    <th>用户ID</th>
                    <th>用户昵称</th>
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
        <td>{{ "超级管理员"}}</td>
        <th>{{item.username}}</th>
        <th>{{item.nickname}}</th>
        <th>{{item.sex}}</th>
        <th>{{item.date}}</th>
        <td>
            <a class="layui-btn layui-btn-small layui-icon ">
                &#xe60a; 预览
            </a>
            <button class='layui-btn layui-btn-small layui-icon'>&#xe642;编辑</button>
            <button data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-small layui-icon'>
                &#xe640;删除
            </button>
        </td>
    </tr>
    {{# }); }}
</script>
<script type="text/javascript" src="../../../public/plugins/layui/layui.js"></script>
<script>
    var cl;
    var pageCurrent = 0;//当前页数
    var totalPage=0;//总页数
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
                    , curr:pageCurrent
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
                $.post("${pageContext.request.contextPath}/UserInfo/findUser",{ pageCurrent:pageCurrent},
                    function (data) {
                        totalPage=data.totalPage;//总页数

                        cl.page();
                        laytpl($("#list-tpl").text()).render(data.UserInfo, function (html) {
                            $(".tr_1").html(html);
                        });
                        form.render();
                    }
                );
            }
        }
        $(function () {
            cl.list();
        });


        $("#add").click(function () {

                layer.open({
                    type: 1,
                    title: '角色权限分配'
                    , content: $("#refer_div"),
                    area: ['40%', '70%']
            });
        });

    });

</script>
<script >
    $(function () {

    });
</script>
</body>
<div id="refer_div" style="display: none">
    <form class="layui-form" action="${pageContext.request.contextPath}/TronClassServlet?method=save" method="post">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户昵称</label>
                <div class="layui-input-inline">
                    <input type="text" name="eu_rj"  autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-inline">
                    <input type="text" name="eu_xin"  autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="text" name="eu_rw"  autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">账户权限</label>
            <div class="layui-input-inline">
                <select name="tron_month" >
                    <option value="0">超级管理员</option>
                    <option value="1">一级管理员</option>
                    <option value="2">二级管理员</option>
                    <option value="3">三级管理员</option>
                </select>
            </div>
        </div>
        <div class="layui-input-block huan_center">
            <button class="layui-btn" lay-submit="" type="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </form>
</div>
</html>