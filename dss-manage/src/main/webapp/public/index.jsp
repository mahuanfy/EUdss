<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="tag.jsp" %>

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
    <link rel="shortcut icon" href="${baseurl}/public/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${baseurl}/public/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/public/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="${baseurl}/public/js/jquery.js"></script>
    <script type="text/javascript" src="${baseurl}/public/plugins/layui/layui.js"></script>
    <script class="nav_script" type="text/javascript"></script>
    <script src="${baseurl}/public/js/index.js"></script>
    <script type="text/javascript">
        var rank = 0;
        let imgName;
        $(function () {
            //判断session是否存在
            $.post("${pageContext.request.contextPath}/login/session",
                function (data) {
                    if (!data.haveSession) {
                        window.location.href = "${baseurl}";
                    }
                }
            )
            //显示头像及图片
            $.post("${pageContext.request.contextPath}/login/userInfo",
                function (data) {
                    let user = data.user;
                    $("#Name").html(user.nickname);
                    $("#userNameLocK").html(user.nickname);
                    $("#idName").html(user.username);
                    $("#images").text("").attr("src", HEAD_IMAGE_PREFIX + user.img);
                    $("#imageslockPwd").text("").attr("src", HEAD_IMAGE_PREFIX + user.img);
                }
            )
            //权限设置
            $.post("${pageContext.request.contextPath}/login/rank",
                function (data) {
                    rank = data.rank;
                    var src = "${baseurl}/public/rank/nav" + rank + ".js";
                    $(".nav_script").attr({src: src});
                }
            )
        });
        //退出登录
        function out() {
            $.post("${pageContext.request.contextPath}/login/out",
                function (data) {
                    layer.msg(data.msg, {
                        time: 1000
                    }, function () {
                        window.location.href = "${baseurl}";
                    });

                }
            )
        }
        //用户信息
        function userInfo() {
            $.post("${pageContext.request.contextPath}/login/userInfo",
                function (data) {
                    let user = data.user;
                    $("#imagesInfo").text("").attr("src", HEAD_IMAGE_PREFIX + user.img);
                    $("#nickname").val(user.nickname);
                    $("#username").val(user.username);
                    $("#sex").val(user.sex);
                    $("#age").val(user.age);
                    $("#phone").val(user.phone);
                    $("#date").val(user.date);
                    layer.open({
                        type: 1,
                        title: "用户信息",
                        area: ["100%", "100%"],
                        closeBtn: 1,
                        content: $("#userInfo")
                    })

                }
            )
        }
        //用户信息
        function updateInfo() {
            $.post("${pageContext.request.contextPath}/login/userInfo",
                function (data) {
                    let user = data.user;
                    $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + user.img);
                    imgName = user.img;
                    $("#updateNickname").val(user.nickname);
                    $("#updateUsername").val(user.username);
                    $("#updateSex").val(user.sex);
                    $("#updateAge").val(user.age);
                    $("#updatePhone").val(user.phone);
                    $("#updateDate").val(user.date);
                    layer.open({
                        type: 1,
                        title: "用户信息",
                        area: ["100%", "100%"],
                        closeBtn: 1,
                        content: $("#updateInfo")
                    })

                }
            )
        }
        //用户信息
        function updateInfoAjax() {
            let updateNickname = $("#updateNickname").val();
            let updateUsername = $("#updateUsername").val();
            let updateSex = $("#updateSex").val();
            let updateAge = $("#updateAge").val();
            let updatePhone = $("#updatePhone").val();
            $.post("${pageContext.request.contextPath}/login/updateInfoAjax", {
                    img: imgName,
                    nickname:updateNickname,
                    sex:updateSex,
                    age:updateAge,
                    phone:updatePhone,
                    username:updateUsername,
                },
                function (data) {
                    layer.msg(data.msg);
                }
            )
        }
        //图片上传
        layui.use('upload', function () {
            layui.upload({
                url: '${baseurl}/login/updateImage' //上传接口
                , success: function (res) { //上传成功后的回调
                    if (res.result) {
                        $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + res.data);
                        imgName = res.data;
                    }
                }
            });
        });
    </script>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;">
                    <span style="font-size: 22px;">欧亚决策系统后台</span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img id="images"/>
                       <span id = "Name"></span>
                    </a>
                    <dl
                            class="layui-nav-child">
                        <dd>
                            <a style="cursor:pointer" onclick="userInfo()"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a style="cursor:pointer" onclick="updateInfo()"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a style="cursor:pointer" onclick="out()"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
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
    <div type="text/template" id="lock-temp" style="display: none">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img id="imageslockPwd"/>
            </div>
            <div class="admin-header-lock-name" id="userNameLocK"></div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd"/>
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </div>
</div>
</body>
<div id="userInfo" style="display: none">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>个人信息</legend>
    </fieldset>
    <div style="margin-left: 45%;">
        <div style="width:100px; height: 140px;margin-left: 50px;">
            <img id="imagesInfo" class="site-demo-upload"/>
        </div>
        <div style="margin-top: 100px;">

        </div>
    </div>
    <div style="margin-left: 45%;margin-top: 50px;">
        <form class="layui-form layui-form-pane" action="">

            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名:</label>
                <div class="layui-input-inline">
                    <input readonly="readonly" type="text" id="nickname" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户ID：</label>
                <div class="layui-input-inline">
                    <input readonly="readonly" type="text" id="username" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-inline">
                    <input type="text" id="sex" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input type="text" id="age" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">账号创建日期：</label>
                <div class="layui-input-inline">
                    <input type="text" id="date" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>

        </form>
    </div>
</div>
<div id="updateInfo" style="display: none">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>修改信息</legend>
    </fieldset>
    <div style="margin-left: 45%;">
        <div style="width:100px; height: 140px;margin-left: 50px;">
            <img id="imagesToUpdate" class="site-demo-upload"/>
        </div>
        <div style="margin-top: 100px;">
            <input type="file" name="file" class="layui-upload-file" style="width: auto"
                   lay-title="头像上传">
        </div>
    </div>
    <div style="margin-left: 45%;margin-top: 50px;">
        <form class="layui-form layui-form-pane" action="" enctype="multipart/form-data">

            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名:</label>
                <div class="layui-input-inline">
                    <input  type="text" id="updateNickname" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户ID：</label>
                <div class="layui-input-inline">
                    <input readonly="readonly" type="text" id="updateUsername" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updateSex" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updateAge" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updatePhone" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">账号创建日期：</label>
                <div class="layui-input-inline">
                    <input type="text" id="updateDate" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </div>
            </div>
            <button style="margin-left: 80px; width: 150px;margin-bottom: 50px;" class="layui-btn"
                    onclick="updateInfoAjax()"><i class="layui-icon">&#xe61f;</i>
                完成修改
            </button>
        </form>
    </div>
</div>
</html>
