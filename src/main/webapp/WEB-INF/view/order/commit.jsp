<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sideContainer d-md-flex align-items-stretch">
	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5" align="center">
		 <img src="${pageContext.request.contextPath}/resources/img/order.png" border="0">
		 <p>결제가 완료되었습니다.</p>
		 <br>
		 <br>
		 <br>
		 <form>
		 	<button type="submit" class="btn" formaction="${pageContext.request.contextPath}/myorder">주문내역</button>
		 </form>
	</div>

	
</div>