<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="section-title">
		<h2>매칭게시판</h2>
</div>
	<form:form modelAttribute="filtering" action="petsitterList" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td align="center"><span style="font-weight:bold;">크기</span></td>
				<td align="center">
					<form:checkboxes items="${sizeCodes}" itemLabel="label" itemValue="code" path="sizeCodes" />
					<br />
					<form:errors path="sizeCodes" />					
				</td>
			</tr>
			<tr>
				<td align="center"><span style="font-weight:bold;">요일</span></td>
				<td align="center">
					<form:checkboxes items="${dayCodes}" itemLabel="label" itemValue="code" path="dayCodes" />
					<br />
					<form:errors path="dayCodes" />
				</td>
			</tr> 
			<tr>
				<td align="center"><span style="font-weight:bold;">요금</span></td>
				<td align="center">
					<label class="radio-inline">
						<input type="radio" name="petPrice" id="petPrice" value="1"> \15000-\17000
					</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="petPrice" id="petPrice" value="2"> \17001-\19000
					</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="petPrice" id="petPrice" value="3"> \19001-\21000
					</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="petPrice" id="petPrice" value="4"> \21001-\23000
					</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="petPrice" id="petPrice" value="5"> \23001-\25000
					</label>
				</td>
			</tr>
			<tr>
				<td align="center"><span style="font-weight:bold;">지역</span></td>
				<td align="center">
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="서울"> 서울
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="경기도"> 경기도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="강원도"> 강원도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="충청남도"> 충청남도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="충청북도"> 충청북도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="전라남도"> 전라남도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="전라북도"> 전라북도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="경상남도"> 경상남도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="경상북도"> 경상북도
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label class="radio-inline">
			  					<input type="radio" name="petLocal" id="petLocal" value="제주도"> 제주도
							</label>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="선택한 조건으로 검색하기" class="btn">
				</td>
			</tr>
		</tbody>
	</table>
	</form:form>
</div>
<div class="site-section">
	<div class="container">
		<div class="table-wrapper">
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
				<c:forEach var="petsitterList" items="${petsitterList}">
					<tr>
						<td width=100 style="word-break:break-all">${petsitterList.boardNum}</td>
						<td width=500 style="word-break:break-all"><a href="<c:url value="/petsitterDetail">
						<c:param name="boardNum" value="${petsitterList.boardNum}"/>
						</c:url>">
						<c:if test="${not empty petsitterList.isSelected}">
							[매칭완료] &nbsp;
						</c:if>
						${petsitterList.boardTitle}</a></td>
						<td width=150 style="word-break:break-all">${petsitterList.userID}</td>
						<td>${petsitterList.replyCnt}</td>
						<td>${petsitterList.boardLike}</td>
						<td width=60 style="word-break:break-all">${petsitterList.boardHit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<table class="text-right" align="right">
				<tr>
					<td>
						<c:if test="${petsitterChk < 0}" >
							<a href="signIn" onclick="alert('로그인이 필요합니다.')"><input type="submit" class="btn" value="글 작성" /></a>
						</c:if>
						<c:if test="${petsitterChk == 1}">
							<a href="#" onclick="alert('펫시터 회원만 작성할 수 있습니다.')"><input type="submit" class="btn" value="글 작성" /></a>
						</c:if>
						<c:if test="${petsitterChk == 0}">
							<a href="petsitterForm"><input type="submit" class="btn" value="글 작성" /></a>
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
	</div>
</div>
<script>
	/* 검색을 수행하기 위하여 키워드와 타입을 정한 후 검색 버튼을 클릭하면 링크로 이동 -> 컨트롤러에서 이후의 일을 처리하도록 함 */
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/petsitterList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;
	});

	/* 페이지 인덱스를 누를 때마다 해당 인덱스로 페이지가 전환 */
	function fn_pagination(pageNum, contentNum, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/petsitterList";
		url = url + "?pageNum=" + pageNum;
		url = url + "&contentNum=" + contentNum;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
	}
</script>