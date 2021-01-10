<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<div class="section-title">
	<div class="container">
		<h2>주문 상세 내역</h2>
	</div>
</div>
	<div class="sideContainer d-md-flex align-items-stretch">
		<div id="content" class="p-4 p-md-5 pt-5">
			<c:choose>
				<c:when test="${gOrder ne null}">
					<a data-toggle="collapse" data-target="#table1"><span style="color:black">구매 상품 ▼</span><span class="caret"></span></a><br />
			          		<br />
			          		<div class="table-wrapper collapse show" id="table1">
								<table class="table table-striped">
									<c:forEach var="gLineItem" items="${gOrder.gLineItems}">
									<tr>
										<td ><a href="<c:url value="/gpurchaseDetail">
											<c:param name="boardNum" value="${gLineItem.boardNum}"/></c:url>">
											<img src="resources/img/dog-food.png" border="0"> &nbsp;
											${gLineItem.boardTitle}</a>
										</td>
										<td>수량 : 1</td>
										<td>${gLineItem.price}</td>
									</tr>
								</c:forEach>
								</table>
							</div>
						<br />
				
					<a data-toggle="collapse" data-target="#table2"><span style="color:black">결제 정보 ▼</span><span class="caret"></span></a><br />
		          		<br />
		          		<div class="table-wrapper collapse show" id="table2">
							<table class="table table-striped">
								<tr>
									<td>주소 : ${gOrder.address}</td>
								</tr>
								<tr>
									<td>총상품금액 : ${gOrder.productPrice}</td>
								</tr>
								<tr>
									<td>카드 : ${gOrder.bank}</td>
								</tr>
								<tr>
									<td>총결제금액 : ${gOrder.price} </td>
								</tr>
						</table>
						</div>
					<br />
				</c:when>
				
				<c:when test="${sOrder ne null}">
					<a data-toggle="collapse" data-target="#table1"><span style="color:black">구매 상품 ▼</span><span class="caret"></span></a><br />
				          		<br />
				          		<div class="table-wrapper collapse show" id="table1">
									<table class="table table-striped">
										<c:forEach var="sLineItem" items="${sOrder.sLineItems}">
										<tr>
											<td ><a href="<c:url value="/secondhandDetail">
												<c:param name="boardNum" value="${sLineItem.boardNum}"/></c:url>">
												<img src="resources/img/dog-food.png" border="0"> &nbsp;
												${sLineItem.boardTitle}</a>
											</td>
											<td>수량 : 1</td>
											<td>${sLineItem.price}</td>
										</tr>
									</c:forEach>
									</table>
								</div>
							<br />
					
						<a data-toggle="collapse" data-target="#table2"><span style="color:black">결제 정보 ▼</span><span class="caret"></span></a><br />
			          		<br />
			          		<div class="table-wrapper collapse show" id="table2">
								<table class="table table-striped">
									<tr>
										<td>주소 : ${sOrder.address}</td>
									</tr>
									<tr>
										<td>총상품금액 : ${sOrder.productPrice}</td>
									</tr>
									<tr>
										<td>카드 : ${sOrder.bank}</td>
									</tr>
									<tr>
										<td>총결제금액 : ${sOrder.price} </td>
									</tr>
							</table>
							</div>
						<br />
				</c:when>
				</c:choose>
				
				<div class="pt-5" align="center">
					<a href="myOrderList"><input type="button" value="목록" class="btn" /></a>
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
	/* 검색을 수행하기 위하여 키워드와 타입을 정한 후 검색 버튼을 클릭하면 링크로 이동 -> 컨트롤러에서 이후의 일을 처리하도록 함 */
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/myCommentGpurchase";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
	});

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/myCommentGpurchase";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
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