<%@ page import="net.sf.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>创课各分院每月点击次数数据统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../../Admin/css/global.css" media="all">
    <link rel="stylesheet" href="../../Admin/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../Admin/css/eu_manage.css" media="all">
    <link rel="stylesheet" href="../../Admin/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="../../Admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../Admin/js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../Admin/js/button_js.js" charset="utf-8"></script>
</head>


<body>
<%
    JSONArray jsonArray = (JSONArray) session.getAttribute("user");
    if (jsonArray == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>创课各分院每月点击次数数据统计</legend>
        <div style="">
            <blockquote class="layui-elem-quote ">
                <button id="refer" class="refer layui-btn layui-btn-normal "><i class="layui-icon">&#xe61f;</i>&nbsp;增加
                </button>
            </blockquote>
        </div>
        <div>
            <table class="layui-table">
                <colgroup>
                    <col width="60">
                    <col width="">
                    <col width="100">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="160">
                </colgroup>
                <thead>
                <tr>
                    <th>编号</th>
                    <th>年份</th>
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
        <td>{{item.year}}</td>
        <td>{{item.tron_month}}</td>
        <td>{{item.eu_rj}}</td>
        <td>{{item.eu_xin}}</td>
        <td>{{item.eu_rw}}</td>
        <td>{{item.eu_ts}}</td>
        <td>{{item.eu_xiu}}</td>
        <td>{{item.eu_gz}}</td>
        <td>{{item.eu_kuai}}</td>
        <td>{{item.eu_ad}}</td>
        <td>{{item.eu_wc}}</td>
        <td>{{item.eu_wu}}</td>
        <td>{{item.eu_jr}}</td>
        <td>
            <button  class='layui-btn layui-btn-small layui-icon'>&#xe642;编辑</button>
            <button  data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-small layui-icon'>&#xe640;删除</button>
        </td>
    </tr>
    {{# }); }}
</script>
<script type="text/javascript" src="../../Admin/plugins/layui/layui.js"></script>
<script type="text/javascript">
    var cl;
    var pageCurrent = 0;//当前页数
    var totalPage=10;//总页数
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
                $.post("${pageContext.request.contextPath}/TronClassServlet?method=pool", { curr:pageCurrent}, function (data) {
                        totalPage=data[1]["totalPage"];//总页数
                        cl.page();
                        laytpl($("#list-tpl").text()).render(data[0], function (html) {
                            $(".tr_1").html(html);
                        });
                        form.render();
                    },
                    "json"
                );
            },
        }
        $(function () {
            cl.list();
        });
    });
</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

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
    <form class="layui-form" action="${pageContext.request.contextPath}/TronClassServlet?method=save" method="post">
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">年份</label>
            <div class="layui-input-inline">
                <select name="year" lay-filter="aihao" id="year_ten">
                </select>
            </div>
            <label class="layui-form-label">月份</label>
            <div class="layui-input-inline">
                <select name="tron_month" lay-filter="aihao">
                    <%--<option value=""></option>--%>
                    <option value="一月份" selected="">一月份</option>
                    <option value="二月份">二月份</option>
                    <option value="三月份">三月份</option>
                    <option value="四月份">四月份</option>
                    <option value="五月份">五月份</option>
                    <option value="六月份">六月份</option>
                    <option value="七月份">七月份</option>
                    <option value="八月份">八月份</option>
                    <option value="九月份">九月份</option>
                    <option value="十月份">十月份</option>
                    <option value="十一月份">十一月份</option>
                    <option value="十二月份">十二月份</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">人居环境学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rj" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">信息工程学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xin" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">人文教育学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rw" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">通识学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ts" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">休闲管理学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xiu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">高职学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_gz" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">会计学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_kuai" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">爱德艺术学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ad" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">文化传媒学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wc" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">物流贸易学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">金融学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_jr" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="huan_a"></div>
            <div class="layui-input-block huan_center">
                <button class="layui-btn" lay-submit="" type="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</html>
