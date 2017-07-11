<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
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
        <a  class="refer layui-btn layui-btn-normal ">
            <i class="layui-icon">&#xe61f;</i>&nbsp;添加
        </a>
        <a  class="layui-btn " >
            <i class="layui-icon ">&#xe642;</i> 编辑
        </a>
        <button  class="layui-btn  layui-btn-danger" >
            <i class="layui-icon ">&#xe640;</i> 删除
        </button>
        <a  class="layui-btn " >
            <i class="layui-icon">&#xe615;</i> 搜索
        </a>
        <a  class="layui-btn " >
            <i class="layui-icon">&#xe60a;</i> 预览
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div >

            <table class="site-table table-hover ">
                <thead>
                <tr>
                    <th><input type="checkbox" lay-skin="primary" onclick="check(this)" lay-filter="checkedAll" ></th>
                    <th>编号</th>
                    <th>用户ID</th>
                    <th>用户昵称</th>
                    <th>用户权限是否启用</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" lay-skin="primary" class="checked"></td>
                    <td>001</td>
                    <td>
                        15478541253
                    </td>
                    <td>Beginner</td>

                    <td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
                    <td>2016-11-16 11:50</td>
                    <td>
                        <a  class="layui-btn layui-btn-small" >
                            <i class="layui-icon">&#xe60a;</i> 预览
                        </a>
                        <a class="layui-btn layui-btn-small" >
                            <i class="layui-icon ">&#xe642;</i> 编辑
                        </a>
                        <button  class="layui-btn  layui-btn-danger layui-btn-small" >
                            <i class="layui-icon ">&#xe640;</i> 删除
                        </button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"  lay-skin="primary"class="checked"></td>
                    <td>002</td>
                    <td>
                        <a href="/manage/article_edit_6">15362452365</a>
                    </td>
                    <td>Beginner</td>

                    <td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
                    <td>2016-11-17 14:17</td>
                    <td>
                        <a  class="layui-btn layui-btn-small" >
                            <i class="layui-icon">&#xe60a;</i> 预览
                        </a>
                        <a class="layui-btn layui-btn-small" >
                            <i class="layui-icon ">&#xe642;</i> 编辑
                        </a>
                        <button  class="layui-btn  layui-btn-danger layui-btn-small" >
                            <i class="layui-icon ">&#xe640;</i> 删除
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="demo1"></div>
        <ul id="biuuu_city_list"></ul>
    </fieldset>
</div>
<script type="text/javascript" src="../../../public/plugins/layui/layui.js"></script>
<script type="text/javascript">

</script>

<script>
    layui.use(['laypage', 'layer','element', 'form'], function () {
        var laypage = layui.laypage,
            form = layui.form(),
            element = layui.element()
            , layer = layui.layer;

        laypage({
            cont: 'demo1'
            , pages: 100 //总页数
            , groups: 5 //连续显示分页数
        });


    });
    function check(t) {
        $(".checked").prop({checked: $(t).prop("checked")});
    }
</script>
</body>

</html>