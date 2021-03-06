<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-section">
	<div class="container">
<div class="section-title">
	<div class="container">
		<h2>관리자 페이지</h2>
	</div>
</div>
	<div class="sideContainer d-md-flex align-items-stretch">
		<div id="content" class="p-4 p-md-5 pt-5">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이메일</th>
						<th>회원 타입</th>
						<th>회원 권한</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userList" items="${userList}">
					<c:if test="${userList.authority eq 'ROLE_USER'}">
						<tr>
							<td width=150 style="word-break:break-all"><a href="<c:url value="/user-page">
							<c:param name="userID" value="${userList.userID}"/>
							</c:url>">${userList.userID}</a></td>
							<td width=300 style="word-break:break-all">${userList.email}</td>
							<td>
								<c:if test="${userList.userType}">
									일반 회원
								</c:if>
								<c:if test="${!userList.userType}">
									펫시터
								</c:if>
							</td>
							<td>${userList.authority}</td>
							
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination-row" style="text-align: center;">
				<ul class="custom-pagination list-unstyled">
					<c:if test="${boardSearch.prev}">
						<li>
						<a onClick="fn_pagination('${boardSearch.getStartPage() - 1}', '${boardSearch.getContentNum()}', '${boardSearch.getKeyword()}');">
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
								onClick="fn_pagination('${idx}', '${boardSearch.getContentNum()}', '${boardSearch.getKeyword()}');">${idx}</a>
							</li>
						</c:forEach>
					</c:if>
	
					<c:if test="${boardSearch.next}">
						<li><a
							onClick="fn_pagination('${boardSearch.getEndPage() + 1}', '${boardSearch.getContentNum()}', '${boardSearch.getKeyword()}');">
								Next <i class="fa fa-long-arrow-right"></i>
						</a></li>
					</c:if>
				</ul>
		</div>
		
		<!-- 검색  -->
		<div class="d-flex justify-content-center" >
	        <input type="text" class="form-control" placeholder="Search..." id="keyword" name="keyword" style="width : 25%">
	        <button type="submit" class="btn btn-secondary" id="btnSearch" name="btnSearch"><span class="icon-search"></span></button>
       	</div>
       
		</div>
		<nav id="sidebar">
			<div class="p-4 pt-5">
				<h5>Categories</h5>
				<ul class="list-unstyled components mb-5">
					<li><a href="#pageSubmenu1">회원 관리</a></li>
				</ul>
			</div>
		</nav>
	</div>
	</div>
	</div>
<script>
	/* 검색을 수행하기 위하여 키워드와 타입을 정한 후 검색 버튼을 클릭하면 링크로 이동 -> 컨트롤러에서 이후의 일을 처리하도록 함 */
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?keyword=" + $('#keyword').val();

		location.href = url;
	});

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, keyword) {
		var url = "${pageContext.request.contextPath}/admin";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
</script>