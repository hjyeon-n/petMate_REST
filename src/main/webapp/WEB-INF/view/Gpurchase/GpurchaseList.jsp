<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="site-section">
	<div class="container">
		<div class="section-title">
			<h2>공구 게시판</h2>
		</div>
		<div class="table-wrapper">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>덧글수</th>
						<th>담은수</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="gpurchaseList" items="${gpurchaseList}">
					<tr>
						<td width=100 style="word-break:break-all">${gpurchaseList.boardNum}</td>
						<td width=500 style="word-break:break-all"><a href="<c:url value="/gpurchaseDetail">
						<c:param name="boardNum" value="${gpurchaseList.boardNum}"/>
						</c:url>">${gpurchaseList.boardTitle}</a></td>
						<td width=150 style="word-break:break-all">${gpurchaseList.userID}</td>
						<td>${gpurchaseList.replyCnt}</td>
						<td>${gpurchaseList.cartAdded}</td>
						<td width=60 style="word-break:break-all">${gpurchaseList.boardHit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<table class="text-right" align="right">
				<tr>
					<td>
						<c:if test="${sessionScope.userID ne null}">
							<a href="gpurchaseForm"><input type="submit" class="btn" value="글 작성" /></a>
						</c:if>
						<c:if test="${sessionScope.userID eq null}" >
							<a href="signIn" onclick="alert('로그인이 필요합니다.')"><input type="submit" class="btn" value="글 작성" /></a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		   
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
			<select class="form-control form-control-sm" name="searchType" id="searchType" style="width : 10%">
				<option value="boardTitle">글 제목</option>
				<option value="boardContent">글 내용</option>
				<option value="userID">작성자</option>
			</select>
	        <input type="text" class="form-control" placeholder="Search..." id="keyword" name="keyword" style="width : 25%">
	        <button type="submit" class="btn btn-secondary" id="btnSearch" name="btnSearch"><span class="icon-search"></span></button>
       </div>
	</div>
</div>

<script>
	/* 검색을 수행하기 위하여 키워드와 타입을 정한 후 검색 버튼을 클릭하면 링크로 이동 -> 컨트롤러에서 이후의 일을 처리하도록 함 */
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/gpurchase";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
	});

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/gpurchase";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
</script>
