<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<div class="section-title">
	<div class="container">
		<h2>주문 내역</h2>
	</div>
</div>
	<div class="sideContainer d-md-flex align-items-stretch">
		<div id="content" class="p-4 p-md-5 pt-5">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>주문일시</th>
						<th>주문번호</th>
						<th>총가격</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="order" items="${myOrderList}">
					<tr>
						<fmt:parseDate var="orderDate" value="${order.orderDate}" pattern="yy-MM-dd" /> 
						<td><fmt:formatDate value="${orderDate}" pattern="yy-MM-dd" /></td>
						<td>${order.orderNum}</td>
						<td>${order.price}₩</td>
						<td><a href="<c:url value="/myOrderDetail">
						<c:param name="orderNum" value="${order.orderNum}"/>
						</c:url>">상세보기 ▷ </a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="pagination-row" style="text-align: center;">
			<ul class="custom-pagination list-unstyled">
				<c:if test="${boardSearch.prev}">
					<li>
					<a onClick="fn_pagination('${boardSearch.getStartPage() - 1}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}');">
							<i class="fa fa-long-arrow-left"></i> Previous
					</a>
					</li>
				</c:if>

				<c:if test="${boardSearch.totalCount ne 0}">
					<c:forEach begin="${boardSearch.getStartPage()}"
						end="${boardSearch.getEndPage()}" var="idx">
						<li
							${boardSearch.pageNum == idx - 1 ? 'class=active' : ''}>
							<a id="page"
							onClick="fn_pagination('${idx}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}');">${idx}</a>
						</li>
					</c:forEach>
				</c:if>

				<c:if test="${boardSearch.next}">
					<li><a
						onClick="fn_pagination('${boardSearch.getEndPage() + 1}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}');">
							Next <i class="fa fa-long-arrow-right"></i>
					</a></li>
				</c:if>
			</ul>
		</div>
		</div>
		<nav id="sidebar">
			<div class="p-4 pt-5">
				<!-- <span style="color:black"><h5>Categories</h5></span> -->
				<ul class="list-unstyled components mb-5">
					<li><a href="#" data-toggle="modal" data-target="#myModal">회원 정보 수정</a></li>
					<li>
			            <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내가 쓴 글</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu2">
			                <li><a href="mypageInfo"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="mypageInquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="mypageGpurchase"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="mypageSecondhand"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
							<c:if test="${petsitterChk == 0}">
								<li><a href="mypagePetsitter"><span class="fa fa-chevron-right mr-2"></span>구인 게시판</a></li>
							</c:if>
							<c:if test="${petsitterChk == 1}">
								<li><a href="mypageReview"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
							</c:if>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내가 쓴 댓글</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu3">
			                <li><a href="myReplyInquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="myReplyInfo"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="myReplyGpurchase"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="myReplySecondhand"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
			                <li><a href="myReplyPetsitter"><span class="fa fa-chevron-right mr-2"></span>구인 게시판</a></li>
			                <li><a href="myReplyReview"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">북마크</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu4">
			                <li><a href="myInfoLike"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="myInquiryLike"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="myReviewLike"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			                <li><a href="myPetsitterLike"><span class="fa fa-chevron-right mr-2"></span>구인 게시판</a></li>
			            </ul>
	          		<li>
			            <a href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장바구니</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu5">
			                <li><a href="gpurchaseCart"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="secondhandCart"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
			            </ul>
	          		</li>
	          		<li><a href="myOrderList">내 주문 내역</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">비밀번호 확인</h4>
			</div>
			<div class="modal-body">
				<form method="post"
				class="login100-form validate-form flex-sb flex-w">
					<!-- <span class="login100-form-title p-b-32"> Account Login </span>  -->
					<span class="txt1 p-b-11"> 
						비밀번호 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input type="password" id="pwd" name="pwd" class="input100"/>
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11"> 
						비밀번호 확인
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input type="password" id="confirmPwd" name="confirmPwd" class="input100"/>
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<button type="submit" value="확인"
								class="login100-form-btn" id="btnConfirm" name="btnConfirm">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>  
<script>
	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/myOrderList";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		location.href = url;
	}
	
	$("#btnConfirm").on("click", function(){
		var pass1 = $("#pwd").val();
		var pass2 = $("#confirmPwd").val();
		alert(pass1);
		alert(pass2);
		if(pass1 != pass2) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#confirmPwd").focus();
			return false;
		}
		var confirmPwd = $("#pwd").val();
		$.ajax({
	        url : '${pageContext.request.contextPath}/confirmPwd',
	        type : 'post',
	        data : {'confirmPwd' : confirmPwd},
	        success : function(data){
	        	if (data == 1) {
	        		location.href="${pageContext.request.contextPath}/signUp";
	        	}
	        	else {
	        		alert('비밀번호가 틀렸습니다.');
		        }
	        }
	    });
	});

</script>