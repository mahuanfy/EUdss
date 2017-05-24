<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eurasia DSS后台管理系统</title>
    <link rel="stylesheet" href="Admin/css/site.css" id="siteStyle">
    <%--<script src="/public/vendor/media-match/media.match.min.js"></script>--%>
    <%--<script src="/public/vendor/respond/respond.min.js"></script>--%>
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
                    <li>
                        Eurasia Decision Support System 是帮助管理人员在教学管理上做出合理的判断与决策，在整个开发过程中起到引导的作用，以及给读者提供简要的说明。
                    </li>
                    <li>涵盖学生全生命周期各环节教学数据，从新生入校、在校生、毕业生等数据，为学校招生计划、专业计划调整、日常教学业务、毕业生就业等提供全方位的数据支撑。</li>
                    <li>提供分院、专业教学日常业务数据并可视化展示，为分院业务发展提供数据支撑。
                    </li>
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
                    <form action="UserAction?method=login"
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
                            <button id="register" type="button" class="btn btn-outline btn-success btn-block margin-top-10">
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

        <div style="display: none" id="register_login" class="page-login-main animation-fade">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h1 class="hidden-xs">注册页面</h1>
                    <p class="hidden-xs">Eurasia Decision Support System </p>
                    <form action="UserAction?method=register"
                          class="login-form fv-form fv-form-bootstrap" method="post"
                          novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户名</label>
                           <input type="text" class="form-control" id="username1" name="register_username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password_" name="register_password"
                                   placeholder="请输入密码" data-fv-field="password1">
                            <i class="form-control-feedback" data-fv-icon-for="password1" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                            <small class="help-block" data-fv-validator="stringLength" data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于30个字符
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">确认密码</label>
                            <input type="password" class="form-control" id="password_verify" name="register_passwordVerify"
                                   placeholder="请确认输入密码" data-fv-field="password_verify">
                            <i class="form-control-feedback" data-fv-icon-for="password1" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                            <small class="help-block" data-fv-validator="stringLength" data-fv-for="password1"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于30个字符
                            </small>
                        </div>
                        <div class="col-sm-7">
                            <button type="button" id ="button_register" class="btn btn-primary btn-block margin-top-10">立即注册</button>
                        </div>
                        <div class="col-sm-5">
                            <button id="login_go" type="button" class="btn btn-outline btn-success btn-block margin-top-10">
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
        $(":input[name='register_username']").change(function () {
            var name = $(this).val();
            name = $.trim(name);//取出前后空格
            if (name != "") {
                var url = "/UserAction?method=check";
                var args = {"username": name, "time": new Date()};
                $.get(url, args, function (data) {
                    $(".message").html(data)
                });
            }
        });
        //注册信息跳转
        $("#button_register").click(function(){
            alert(111);
            alert($("input[name='register_username'] ").val());
            alert($("input[ name='register_password'] ").val());
            $.post("UserAction?method=register",
                {username:$("input[name='register_username'] ").val(),
                 password:$("input[ name='register_password'] ").val()
                },
                function (data,status) {
                    alert(222);
                }
            );
        });
    });
</script>

</html>