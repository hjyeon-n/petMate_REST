<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>petMate</title>
<style>
ul.dropdown-menu {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=B612+Mono|Cabin:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/jquery.fancybox.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/aos.css">
<link href="${pageContext.request.contextPath}/resources/css/meranda/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meranda/style.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-datepicker.standalone.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-datepicker.standalone.min.css">

<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js?new"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.mb.YTPlayer.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.ko.js"></script> 

</head>
<body>
 	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
