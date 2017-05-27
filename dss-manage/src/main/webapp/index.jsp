<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eurasia DSS后台管理系统</title>
    <link rel="stylesheet" href="Admin/css/site.css" id="siteStyle">
    <link rel="stylesheet" href="Admin/css/login.css">
    <link rel="stylesheet" href="Admin/css/web-icons.css">
    <script type="text/javascript" src="Admin/js/jquery.min.js"></script>
</head>
<body class="page-login  layout-full page-dark  " id="page_background">
<div class="page  height-full">
    <div class="page-content height-full">
        <div class="page-brand-info vertical-align animation-slide-left hidden-xs">
            <div class="page-brand vertical-align-middle">
                <div class="brand">
                    <img class="brand-img" src="Admin/images/LOGO.png" height="50" alt="Eurasia DSS">
                    <span class="logo">Eurasia DSS</span>
                </div>
                <h3>Eurasia Decision Support System后台管理系统</h3>
                <ul class="list-icons">
                    <li>Eurasia Decision Support System 帮助管理人员在教学管理上做出合理的判断与决策。</li>
                    <li>涵盖学生全生命周期各环节教学数据，从新生入校、在校生、毕业生等数据，为学校招生计划、专业计划调整、日常教学业务、毕业生就业等提供全方位的数据支撑。</li>
                    <li>提供分院、专业教学日常业务数据并可视化展示，为分院业务发展提供数据支撑。</li>
                </ul>
                <div>
                    <a href="#" class="btn btn-primary btn-outline">
                        返回前端页面</a>
                    <a href="#" class="btn btn-primary btn-outline margin-left-5">联系我们</a>
                </div>
            </div>
        </div>
        <div id="login" class="page-login-main animation-fade">

            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h1 class="hidden-xs">Eurasia DSS 登陆页面</h1>
                    <p class="hidden-xs">Eurasia Decision Support System 后台系统</p>
                    <form action="${pageContext.request.contextPath}/UserAction?method=login"
                          class="login-form fv-form fv-form-bootstrap" method="post" id="loginForm"
                          novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入密码" data-fv-field="password">
                            <i class="form-control-feedback" data-fv-icon-for="password" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                            <small class="help-block" data-fv-validator="stringLength" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于30个字符
                            </small>
                        </div>
                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10">登 录</button>
                        </div>
                        <div class="col-sm-5">
                            <button id="register" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                注册账号
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>
        <%--注册页面--%>
        <div style="display: none" id="register_login" class="page-login-main animation-fade">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h1 class="hidden-xs">注册信息</h1>
                    <p class="hidden-xs">Eurasia Decision Support System </p>
                    <form action="UserAction?method=register"
                          class="login-form fv-form fv-form-bootstrap" method="post"
                          novalidate="novalidate" onsubmit="return validate_form(this)">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户ID </label>
                            <input id="username1" name="register_username" type="text" class="form-control"
                                   placeholder="请输入6-20位ID"
                                   data-fv-field="loginName">
                            <small id="username1_verify" class="help-block" data-fv-validator="notEmpty"
                                   data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户ID必须大于6且小于20个字符
                            </small>
                            <small id="username1_verify2" class="help-block" data-fv-validator="notEmpty"
                                   data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none; color: red">用户ID已经存在
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <input id="nickname" name="nickname" type="text" class="form-control" placeholder="请输入昵称"
                                   data-fv-field="loginName">
                            <small id="nickname_verify" class="help-block" data-fv-validator="notEmpty"
                                   data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">昵称不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback ">
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;性别：&nbsp;</span>
                            <label class="demo--label">
                                <input class="demo--radio" type="radio" name="sex" value="男" checked>
                                <span class="demo--radioInput"></span>男
                            </label>
                            <label class="demo--label">
                                <input class="demo--radio" type="radio" name="sex" value="女">
                                <span class="demo--radioInput"></span>女
                            </label>
                        </div>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input id="password_" name="register_password" type="password" class="form-control"
                                   placeholder="请输入6-20位密码" data-fv-field="password1">
                            <i class="form-control-feedback" data-fv-icon-for="password1" style="display: none;"></i>
                            <small id="password1_verify" class="help-block" data-fv-validator="notEmpty"
                                   data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于20个字符
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">确认密码</label>
                            <input id="password_verify"
                                   name="register_passwordVerify" type="password" class="form-control"
                                   placeholder="请确认输入密码" data-fv-field="password_verify">
                            <i class="form-control-feedback" data-fv-icon-for="password2" style="display: none;"></i>
                            <small id="password2_verify" class="help-block" data-fv-validator="notEmpty"
                                   data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于20个字符
                            </small>

                        </div>
                        <div class="col-sm-7">
                            <button type="button" id="button_register" class="btn btn-primary btn-block margin-top-10">
                                立即注册
                            </button>
                        </div>
                        <div class="col-sm-5">
                            <button id="login_go" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                已有账号
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>
    </div>
</div>
<!-- JS -->
<script src="Admin/js/jquery.js"></script>
<script src="Admin/js/bootstrap.js"></script>
<script src="Admin/js/bootstrap-select.min.js"></script>
<script src="Admin/js/formValidation.min.js" data-name="formValidation"></script>
<script src="Admin/js/bootstrap.min.js" data-deps="formValidation"></script>
</body>
<script type="text/javascript">
//取消键盘回车事件
    $(function () {
        $("*").each(function () {
            $(this).keypress(function (e) {
                var key = window.event ? e.keyCode : e.which;
                if (key.toString() == "13") {
                    return false;
                }
            });
        });
    });
//切换登录和注册
    $("#register_login").hide();
    $(document).ready(function () {
        $("#register").click(function () {
            $("#login").hide();
            $("#register_login").fadeIn("slow");

        });
        $("#login_go").click(function () {
            $("#register_login").hide();
            $("#login").fadeIn("slow");
        });
//验证用户是否存在
        $("input[name='register_username'] ").change(function () {
            var name = $(this).val();
//            name = $.trim(name);//取出前后空格
            if (name != "") {
                $.post("${pageContext.request.contextPath}/UserAction?method=check",
                    {"username": name, "time": new Date()},
                    function (data, status) {

                    if(data == 1){
                        $("#username1_verify2").show();
                    }else {
                        $("#username1_verify2").hide();
                    }

                    }
                );
            }
        });
        /*//注册信息跳转*/

//填写正确隐藏提示
        $("#username1").blur(function () {
            if ($("input[name='register_username'] ").val() !== null &&
                $("input[name='register_username'] ").val() !== "" &&
                $("input[name='register_username'] ").val().length >=6 &&
                $("input[name='register_username'] ").val().length <=20) {
                $("#username1_verify").hide();
            }
        });
        $("#nickname").blur(function () {
            if ($("input[name='nickname'] ").val() !== null &&
                $("input[name='nickname'] ").val() !== "") {
                $("#nickname_verify").hide();
            }
        });
        $("#password_").blur(function () {
            if ($("input[name='register_password'] ").val() !== null &&
                $("input[name='register_password'] ").val() !== "" &&
                $("input[name='register_password'] ").val().length >=6 &&
                $("input[name='register_password'] ").val().length <=20) {
                $("#password1_verify").hide();
            }
        });
        $("#password_verify").blur(function () {
            if ($("input[name='register_passwordVerify'] ").val() !== null &&
                $("input[name='register_passwordVerify'] ").val() !== "" &&
                $("input[name='register_passwordVerify'] ").val().length >=6 &&
                $("input[name='register_passwordVerify'] ").val().length <=20) {
                $("#password2_verify").hide();
            }
        });

        //判断用户ID是否为空
        $("#button_register").click(function () {
                if ($("input[name='register_username'] ").val() === null ||
                    $("input[name='register_username'] ").val() === "" ||
                    $("input[name='register_username'] ").val().length <6 ||
                    $("input[name='register_username'] ").val().length >20) {
                    $("#username1_verify").show();
                    $("#username1").focus();
                }else
            if ($("input[name='nickname'] ").val() === null ||
                $("input[name='nickname'] ").val() === "") {
                $("#nickname_verify").show();
                $("#nickname").focus();
            }else
            if ($("input[name='register_password'] ").val() === null ||
                $("input[name='register_password'] ").val() === "" ||
                $("input[name='register_password'] ").val().length <6 ||
                $("input[name='register_password'] ").val().length >20) {
                $("#password1_verify").show();
                $("#password_").focus();
            }else
            if ($("input[name='register_passwordVerify'] ").val() === null ||
                $("input[name='register_passwordVerify'] ").val().length <6 ||
                $("input[name='register_passwordVerify'] ").val().length >20||
                $("input[name='register_passwordVerify'] ").val() === "") {
                $("#password2_verify").show();
                $("#password_verify").focus();
            }else {
                $.post("${pageContext.request.contextPath}/UserAction?method=register",
                    {
                        username: $("input[name='register_username'] ").val(),
                        password: $("input[ name='register_password'] ").val(),
                        nickname: $("input[ name='nickname'] ").val(),
                        passwordVerify: $("input[ name='register_passwordVerify'] ").val(),
                        sex: $("input[ name='sex'] ").val()
                    },
                    function (data, status) {
                    alert("恭喜注册成功");
                    window.location.reload();
                    }
                );
            }
        });
    });
</script>
<script type="text/javascript">


</script>

</html>