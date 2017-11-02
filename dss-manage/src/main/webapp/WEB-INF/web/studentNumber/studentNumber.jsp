<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../public/tag.jsp" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>创课各分院每月点击次数数据统计</title>
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
    .layui-table td {
        padding: 4px 5px;
        text-align: center;
    }
</style>

<body>

<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>创课各分院每月点击次数数据统计</legend>
        <div style="">
            <blockquote class="layui-elem-quote ">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="title" id="customerName" lay-verify="title" autocomplete="off"
                               placeholder="客户姓名" class="layui-input">
                    </div>
                    <a class="layui-btn" onclick="cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

                </div>
                <span class="refer layui-btn layui-btn-normal " onclick="cl.add()">
                    <i class="layui-icon">&#xe61f;</i>&nbsp;添加
                </span>
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
    </fieldset>
</div>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.TronClass, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{item.year+"年"}}</td>
        <td>{{item.tron_month+"月"}}</td>
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
            <button onclick="cl.update('{{ item.id }}')" class='layui-btn layui-btn-small layui-icon'>&#xe642;编辑</button>
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
                $.post("${pageContext.request.contextPath}/tronClass/insertProfession", {
                        currentIndex: currentIndex,
                        pageSize: pageSize
                    },
                    function (data) {
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
                    title: '创客各分院数据填入',
                    area: ['1050px', '500px'],
                    skin: 'yourclass',
                    content: $('#refer_div')
                });
            },
            addAjax: function () {
                let tronClass = $("#beanInfo").serialize();
                $.post("${baseurl}/tronClass/addTronClass", tronClass, function (data) {
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
                    $.post("${baseurl}/tronClass/deleteTronClass", {id: id}, function (data) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    });

                });
            },
            update:function (id) {
                $.post("${baseurl}/tronClass/queryTronClass",{id:id},function (data) {
                    $("#updateId").val(data.info[0].id)
                    $("#eu_ts").val(data.info[0].eu_ts)
                    $("#eu_rw").val(data.info[0].eu_rw)
                    $("#eu_rj").val(data.info[0].eu_rj)
                    $("#eu_xin").val(data.info[0].eu_xin)
                    $("#eu_xiu").val(data.info[0].eu_xiu)
                    $("#eu_gz").val(data.info[0].eu_gz)
                    $("#eu_kuai").val(data.info[0].eu_kuai)
                    $("#eu_ad").val(data.info[0].eu_ad)
                    $("#eu_wc").val(data.info[0].eu_wc)
                    $("#eu_wu").val(data.info[0].eu_wu)
                    $("#eu_jr").val(data.info[0].eu_jr)
                    layer.open({
                        type: 1,
                        title: '创客各分院数据修改',
                        area: ['1050px', '500px'],
                        content: $('#update')
                    });
                });
            },
            updateAjax:function () {
                alert(11)
                let tronClass = $("#beanInfoUpdate").serialize();
                $.post("${baseurl}/tronClass/updateTronClass", tronClass, function (data) {
                    if (data.result) {
                        console.log(data)
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    }
                });
            }
            ,
            year: function () {
                //年份显示
                var now = new Date();
                var year = now.getFullYear();
                $("#addYear").html("");
                $("#updateYear").html("");
                for (var i = 1; i < 10; i++) {
                    $("#updateYear").append("<option value='" + year + "'>" + (year) + "年</option>");
                    $("#addYear").append("<option value='" + year + "'>" + (year--) + "年</option>");
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
            <label class="layui-form-label">年份</label>
            <div class="layui-input-inline">
                <select name="year" id="addYear" lay-filter="aihao" >
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">月份</label>
            <div class="layui-input-inline">
                <select name="tron_month" lay-filter="aihao">
                    <option value="1" selected="">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
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
                <button class="layui-btn" onclick="cl.addAjax()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="update" style="display: none">
    <form class="layui-form" id="beanInfoUpdate">
        <input id="updateId" name="id" style="display: none"/>
        <div class="layui-form-item">
            <label class="layui-form-label">年份</label>
            <div class="layui-input-inline">
                <select name="year" lay-filter="aihao" id="updateYear" >
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">月份</label>
            <div class="layui-input-inline">
                <select name="tron_month" lay-filter="aihao">
                    <option value="1" selected="">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">人居环境学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rj"id="eu_rj" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">信息工程学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xin"id="eu_xin" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">人文教育学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rw"id="eu_rw" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">通识学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ts"id="eu_ts" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">休闲管理学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xiu"id="eu_xiu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">高职学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_gz"id="eu_gz" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">会计学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_kuai"id="eu_kuai" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">爱德艺术学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ad"id="eu_ad" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">文化传媒学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wc"id="eu_wc" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">物流贸易学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wu"id="eu_wu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">金融学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_jr"id="eu_jr" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-input-block huan_center">
                <button class="layui-btn" onclick="cl.updateAjax()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</html>
