<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>创课各分院每月点击次数数据统计</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/eu_manage.css" media="all">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	</head>
	<script type="text/javascript">
		$(document).ready(function () {
			$.post("/TronClassServlet",
				function (data,status) {
			    $(".tr_1").html("<td>"+data+"</td><td>"+data+"</td><td>"+data+"</td><td>1</td><td>2</td><td>3</td><td>1</td><td>2</td><td>3</td>");
                }
			);
        });
	</script>

	<body>

		<div style="margin: 15px;">
			<fieldset class="layui-elem-field site-demo-button">
				<legend>创课各分院每月点击次数数据统计</legend>
				<div>
						<table class="layui-table">
							<colgroup>
								<col width="50">
								<col width="50">
							</colgroup>
									<thead>
									<tr>
										<th><input type="checkbox" id="selected-all"></th>
										<th>ID</th>
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
							<tbody>
							<tr class="tr_1">
								<td><input type="checkbox"></td>
								<%--<td><%=tron.getId()%></td>--%>
								<%--<td><%= tron.getTron_month()%></td>--%>
								<%--<td><%= tron.getEu_rj()%></td>--%>
								<%--<td><%=tron.getEu_xin() %></td>--%>
								<%--<td><%= tron.getEu_rw()%></td>--%>
								<%--<td><%= tron.getEu_ts()%></td>--%>
								<%--<td><%= tron.getEu_xiu()%></td>--%>
								<%--<td><%=tron.getEu_gz() %></td>--%>
								<%--<td><%=tron.getEu_kuai() %></td>--%>
								<%--<td><%=tron.getEu_ad() %></td>--%>
								<%--<td><%= tron.getEu_wc()%></td>--%>
								<%--<td><%= tron.getEu_wu()%></td>--%>
								<%--<td><%= tron.getEu_jr()%></td>--%>
								<td>
									<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
									<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a>
									<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
								</td>
							</tr>
									</tbody>
								</table>
							</div>
			</fieldset>
		</div>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
	</body>

</html>