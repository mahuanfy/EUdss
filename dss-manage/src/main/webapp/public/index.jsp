<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../public/tag.jsp" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>欧亚决策支持系统后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${baseurl}/public/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/public/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${baseurl}/public/js/jquery.js"></script>
    <script type="text/javascript" src="${baseurl}/public/plugins/layui/layui.js"></script>
    <script class="nav_script" type="text/javascript"></script>
    <script src="${baseurl}/public/js/index.js"></script>
    <script type="text/javascript">
        //---------------------权限设置----------------------------------------
        var rank = 0;
        $(function () {
            $.post("${pageContext.request.contextPath}/login/rank",
                function (data) {
                    rank = data.rank;
                    var src = "/public/rank/nav" + rank + ".js"
                    $(".nav_script").attr({src: src});
                }
            )
        });
        function out() {
            $.post("${pageContext.request.contextPath}/login/out",
                function (data) {
                    layer.msg(data.msg, {
                        time: 1000
                    }, function(){
                        window.location.href="${baseurl}";
                    });

                }
            )
        }
        function userInfo() {
            $.post("${pageContext.request.contextPath}/login/userInfo",
                function (data) {
                    layer.open({
                        type: 1,
                        title: "用户信息",
                        area: ["100%", "100%"],
                        closeBtn: 1,
                        content: $("#userInfo"),
                        cancel: function () {
                            //点击关闭按钮刷新列表
//                        location.reload();
                        }
                    })

                }
            )
        }
    </script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="http://beginner.zhengjinfan.cn/demo/beginner_admin/">
                    <span style="font-size: 22px;">欧亚决策系统后台</span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="${baseurl}/public/images/0.jpg"/>
                        ${sessionScope.user.nickname}
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a onclick="userInfo()"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a onclick="out()"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-television" aria-hidden="true"></i>
                    <cite>简介</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe src="${baseurl}/public/main.html"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2017 &copy;
                <a href="http://www.mycodes.net/" target="_blank">欧亚决策支持系统后台</a> Eurasia Decision Support System
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd"/>
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
</div>
</body>
<div id="userInfo" style="display: none">
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
