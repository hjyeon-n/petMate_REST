<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<div class="section-title">
	<div class="container">
		<h2>${boardName}</h2>
	</div>
</div>
	<div class="sideContainer d-md-flex align-items-stretch">
		<div id="content" class="p-4 p-md-5 pt-5">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>댓글수</th>
						<th>
							<c:if test="${boardName eq '중고게시판' || '공구게시판'}">
								담은수
							</c:if>
							<c:if test="${boardName ne '중고게시판' || '공구게시판'}">
								추천수
							</c:if>
						</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach var="boardList" items="${myboardList}">
					<tr>
						<td>${boardList.boardNum}</td>
						<td><a href="javascript:urlCheck(${boardList.boardNum})">${boardList.boardTitle}</a></td>
						<td>${boardList.userID}</td>
						<td>
							<c:if test="${boardName eq '질문게시판'}">
								${boardList.answerCnt}
							</c:if>
							<c:if test="${boardName ne '질문게시판'}">
								${boardList.replyCnt}
							</c:if>
						</td>
						<td>
							<c:if test="${boardName eq '공구게시판' || boardName eq '중고게시판'}">
								${boardList.cartAdded}
							</c:if>
							<c:if test="${boardName ne '공구게시판' && boardName ne '중고게시판'}">
								${boardList.boardLike}
							</c:if>
						</td>
						<td>${boardList.boardHit}</td>
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
		<!-- 검색  -->
		<div class="d-flex justify-content-center" >
			<select class="form-control form-control-sm" name="searchType" id="searchType" style="width : 15%">
				<option value="boardTitle">글 제목</option>
				<option value="boardContent">글 내용</option>
			</select>
	        <input type="text" class="form-control" placeholder="Search..." id="keyword" name="keyword" style="width : 25%">
	        <button type="submit" class="btn btn-secondary" id="btnSearch" name="btnSearch" onClick="fn_search('${writerID}');"><span class="icon-search"></span></button>
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
								<li><a href="mypagePetsitter"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
							</c:if>
							<c:if test="${petsitterChk == 1}">
								<li><a href="mypageReview"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
							</c:if>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">내가 쓴 댓글</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu3">
			                <li><a href="myReplyInfo"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="myReplyInquiry"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="myReplyGpurchase"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="myReplySecondhand"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
			                <li><a href="myReplyPetsitter"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
			                <li><a href="myReplyReview"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			            </ul>
	          		</li>
	          		<li>
			            <a href="#pageSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">북마크</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu4">
			                <li><a href="myInfoLike"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="myInquiryLike"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="myReviewLike"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
			                <li><a href="myPetsitterLike"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
			            </ul>
	          		</li>
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
				<form id="checkPW"
				class="login100-form validate-form flex-sb flex-w">
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
	function fn_search(writerID) {
		var name = '${boardName}';
		var url = "${pageContext.request.contextPath}/";
		if (name == '정보게시판')
			url = url + "myReplyInfo";
		if (name == '질문게시판')
			url = url + "myReplyInquiry";
		if (name == '중고게시판')
			url = url + "myReplySecondhand";
		if (name == '공구게시판')
			url = url + "myReplyGpurchase";
		if (name == '매칭게시판')
			url = url + "myReplyPetsitter";
		if (name == '리뷰게시판')
			url = url + "myReplyReview";
		url = url + "?userID=" + writerID;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
	}

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword) {
		var name = '${boardName}';
		var url = "${pageContext.request.contextPath}/";
		if (name == '정보게시판')
			url = url + "myReplyInfo";
		if (name == '질문게시판')
			url = url + "myReplyInquiry";
		if (name == '중고게시판')
			url = url + "myReplySecondhand";
		if (name == '공구게시판')
			url = url + "myReplyGpurchase";
		if (name == '매칭게시판')
			url = url + "myReplyPetsitter";
		if (name == '리뷰게시판')
			url = url + "myReplyReview";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}

	function urlCheck(boardNum) {
		var name = '${boardName}';
		var url = "${pageContext.request.contextPath}/";
		if (name == '정보게시판')
			url = url + "infoDetail?boardNum=" + boardNum;
		if (name == '질문게시판')
			url = url + "inquiryDetail?boardNum=" + boardNum;
		if (name == '공구게시판')
			url = url + "gpurchaseDetail?boardNum=" + boardNum;
		if (name == '중고게시판')
			url = url + "secondhandDetail?boardNum=" + boardNum;
		if (name == '매칭게시판')
			url = url + "petsitterDetail?boardNum=" + boardNum;
		if (name == '후기게시판')
			url = url + "reviewDetail?boardNum=" + boardNum;
		location.href = url;
	}
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
	        url : '${pageContext.request.contextPath}/confirmPwd',
	        type : 'post',
	        data : {'confirmPwd' : pass2},
	        success : function(data){
	        	if (data == 1) {
	        		location.href="${pageContext.request.contextPath}/signUp";
	        	}
	        	else {
	        		alert('비밀번호가 틀렸습니다.');
	        		return false;
		        }
	        }
	    });
	});

	$("#checkPW").submit(function(e){
	    e.preventDefault();
	});
</script>