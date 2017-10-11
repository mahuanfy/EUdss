<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../page/tag.jsp" %>
<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>欧亚决策中心</title>
		
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-com.eu.dss.web-app-status-bar-style" content="black">
		<meta name="apple-mobile-com.eu.dss.web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" href="${baseurl}/css/mycss/layui1.css" media="all" />
		<link rel="stylesheet" href="${baseurl}/css/global.css" media="all">
		<link rel="stylesheet" href="${baseurl}/plugins/font-awesome/css/font-awesome.min.css">
		<script type="text/javascript" src="${baseurl}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${baseurl}/datas/nav.js"></script>
		<script src="${baseurl}/js/index.js"></script>

	</head>
	<body>
		<div class="layui-layout layui-layout-admin" style="border-bottom: solid 1px #1aa094;">
			<div class="layui-header header header-demo">
				<div class="layui-main" style=" background-color: #3A445C;height: 60px;">
					<div class="admin-login-box">
						<a class="logo" href="#">
							<img src="${baseurl}/img/eurasia.png" alt="西安欧亚学院">
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-side layui-bg-black" id="admin-side">
				<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side" style="background-color: #F2F2F2"></div>
			</div>
			<div class="layui-body" style="bottom: 0;border-left: solid 2px #F2F2F2;" id="admin-body">
				<div class="layui-tab admin-nav-card layui-tab-brief"style="margin-top: 1px" lay-filter="admin-tab">
					<ul class="layui-tab-title">
						<li class="layui-this">
							<i class="fa fa-bank" aria-hidden="true"></i>
							<cite>决策中心概况</cite>
						</li>
					</ul>
					<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show">
							<iframe src="${baseurl}/page/main.html"></iframe>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-footer footer footer-demo" style="background-color: #F2F2F2">
				<div class="layui-main">
					<p><a href="index.jsp">eurasia.edu</a>Eurasia © 2017</p>
					<p>
						<a href="http://www.eurasia.edu/" target="_blank">西安欧亚学院</a>
						<a href="#">联系我们</a>
						<a href="http://jpkc.eurasia.edu/xxgc/" target="_blank">信息工程学院</a>
						<a href="http://home.eurasia.edu/" target="_blank">校园内网</a>
					</p>
				</div>
			</div>
			<div class="site-tree-mobile layui-hide">
				<i class="layui-icon">&#xe602;</i>
			</div>
			<div class="site-mobile-shade"></div>
		</div>
	</body>

</html>