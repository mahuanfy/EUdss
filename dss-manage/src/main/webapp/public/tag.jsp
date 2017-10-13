<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
%>
<c:set var="baseurl" value="<%=basePath%>"></c:set>
<c:set var="baseurl1" value="<%=basePath1%>"></c:set>
<script type="text/javascript" src="${baseurl}/public/js/layui.js"></script>
<script>
    var baseUrl = "${baseurl}";
    var baseUrl1 = "${baseurl1}";
    var ADDRESS_SPLIT_FLAG = "-";
    var HEAD_IMAGE_PREFIX = baseUrl+"images/user"
    var HEAD_IMAGE_PREFIX1 = baseUrl+"images/public/cover.png"
</script>