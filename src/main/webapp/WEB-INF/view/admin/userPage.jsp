<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="section-title">
	<div class="container">
		<span class="caption d-block small">Categories</span>
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
						<th>덧글수</th>
						<th>추천수</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="boardList" items="${userBoardList}">
					<tr>
						<td width=80 style="word-break:break-all">${boardList.boardNum}</td>
						<td width=400 style="word-break:break-all"><a href="javascript:urlCheck(${boardList.boardNum})">${boardList.boardTitle}</a></td>
						<td width=120 style="word-break:break-all">${boardList.userID}</td>
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
						<td width=60 style="word-break:break-all">${boardList.boardHit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="pagination-row" style="text-align: center;">
			<ul class="custom-pagination list-unstyled">
				<c:if test="${boardSearch.prev}">
					<li>
					<a onClick="fn_pagination('${boardSearch.getStartPage() - 1}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}', '${writerID}');">
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
							onClick="fn_pagination('${idx}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}', '${writerID}');">${idx}</a>
						</li>
					</c:forEach>
				</c:if>

				<c:if test="${boardSearch.next}">
					<li><a
						onClick="fn_pagination('${boardSearch.getEndPage() + 1}', '${boardSearch.getContentNum()}', '${boardSearch.getSearchType()}', '${boardSearch.getKeyword()}', '${writerID}');">
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
          			<li>
			            <a href="#pageSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">사용자가 쓴 글</a>
			            <ul class="collapse list-unstyled" id="pageSubmenu2">
			                <li><a href="<c:url value="/userInfo"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>정보 게시판</a></li>
			                <li><a href="<c:url value="/userInquiry"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>질문 게시판</a></li>
			                <li><a href="<c:url value="/userGpurchase"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>공구 게시판</a></li>
			                <li><a href="<c:url value="/userSecondhand"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>중고 게시판</a></li>
							<c:if test="${petsitterChk == 0}">
								<li><a href="<c:url value="/userPetsitter"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>매칭 게시판</a></li>
							</c:if>
							<c:if test="${petsitterChk == 1}">
								<li><a href="<c:url value="/userReview"><c:param name="userID" value="${writerID}"/>
							</c:url>"><span class="fa fa-chevron-right mr-2"></span>리뷰 게시판</a></li>
							</c:if>
			            </ul>
	          		</li>
				</ul>
			</div>
		</nav>
	</div>
	
<script>
	/* 검색을 수행하기 위하여 키워드와 타입을 정한 후 검색 버튼을 클릭하면 링크로 이동 -> 컨트롤러에서 이후의 일을 처리하도록 함 */
	function fn_search(writerID) {
		var url = "${pageContext.request.contextPath}/";
		var name = '${boardName}';
		if (name == '정보게시판')
			url = url + "userInfo";
		if (name == '질문게시판')
			url = url + "userInquiry";
		if (name == '중고게시판')
			url = url + "userSecondhand";
		if (name == '공구게시판')
			url = url + "userGpurchase";
		if (name == '매칭게시판')
			url = url + "userPetsitter";
		if (name == '리뷰게시판')
			url = url + "userReview";
		url = url + "?userID=" + writerID;
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

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
		if (name == '리뷰게시판')
			url = url + "reviewDetail?boardNum=" + boardNum;
		location.href = url;
	}

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword, writerID) {
		var url = "${pageContext.request.contextPath}/";
		var writerID = "${writerID}";
		var name = '${boardName}';
		if (name == '정보게시판')
			url = url + "userInfo";
		if (name == '질문게시판')
			url = url + "userInquiry";
		if (name == '중고게시판')
			url = url + "userSecondhand";
		if (name == '공구게시판')
			url = url + "userGpurchase";
		if (name == '매칭게시판')
			url = url + "userPetsitter";
		if (name == '리뷰게시판')
			url = url + "userReview";
		url = url + "?userID=" + writerID;
		url = url + "&pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
</script>