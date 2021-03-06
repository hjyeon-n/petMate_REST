<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
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
										<td ><a href="<c:url value="/gpurchase/${gLineItem.boardNum}"></c:url>">
											<img src="${pageContext.request.contextPath}/resources/img/dog-food.png" border="0"> &nbsp;
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
											<td ><a href="<c:url value="/secondhand/${sLineItem.boardNum}"></c:url>">
												<img src="${pageContext.request.contextPath}/resources/img/dog-food.png" border="0"> &nbsp;
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
					<a href="${pageContext.request.contextPath}/myorder"><input type="button" value="목록" class="btn" /></a>
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
			                <li><a href="${pageContext.request.contextPath}/mypage-info"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mypage-inquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mypage-gpurchase"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mypage-secondhand"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
							<c:if test="${petsitterChk == 0}">
								<li><a href="${pageContext.request.contextPath}/mypage-petsitter"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
							</c:if>
							<c:if test="${petsitterChk == 1}">
								<li><a href="${pageContext.request.contextPath}/mypage-review"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
							</c:if>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내가 쓴 댓글</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu3">
			            	<li><a href="${pageContext.request.contextPath}/myreply-info"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/myreply-inquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/myreply-gpurchase"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/myreply-secondhand"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/myreply-petsitter"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/myreply-review"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">북마크</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu4">
			                 <li><a href="${pageContext.request.contextPath}/mylike-info"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mylike-inquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mylike-review"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/mylike-petsitter"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
			            </ul>
	          		<li>
			            <a href="#pageSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장바구니</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu5">
			                <li><a href="${pageContext.request.contextPath}/gpurchase-cart"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="${pageContext.request.contextPath}/secondhand-cart"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
			            </ul>
	          		</li>
	          		<li><a href="${pageContext.request.contextPath}/myorder">내 주문 내역</a></li>
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
	$(document).on('click', '#btnConfirm', function(e){
		var pass1 = $("#pwd").val();
		var pass2 = $("#confirmPwd").val();
		if (pass1 == "" || pass2 == "") {
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			return false;
		}
		if(pass1 != pass2) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#confirmPwd").focus();
			return false;
		}
		$.ajax({
	        url : '${pageContext.request.contextPath}/confirm/'+pass2,
	        type : 'post',
	        success : function(data){
	        	if (data == 1) {
	        		location.href="${pageContext.request.contextPath}/sign-up";
	        	}
	        	else {
	        		alert('비밀번호가 틀렸습니다.');
	        		return false;
		        }
	        }
	    });
	});
</script>