<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="reviewReply.jsp" %>
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 single-content">
				<h1 class="mb-4">${review.boardTitle}</h1>
				<div class="post-meta d-flex mb-5">
					<div class="vcard">
						<span class="d-block"><a href="<c:url value="/userpage"><c:param name="userID" value="${review.userID}"/></c:url>">${review.userID}</a></span>  
						<span class="date-read"><fmt:parseDate var="dateString" value="${review.boardDate}" pattern="yyyy-MM-dd HH:mm:ss" />               
						<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/> 
						<span class="mx-1">&bullet;</span>조회 ${review.boardHit} <span class="icon-star2"></span></span>
						<!-- 별점표시하기 -->
					</div>
				</div>
				<div class="post-meta d-flex mb-5">
				<div id="starRating">
						<c:set var="rating" value="${review.rating}" />
							<c:choose>
								<c:when test="${rating == 5.0}">
									<% for(int i = 1; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%>
								</c:when>
								<c:when test="${rating == 4.5}">
									<% for(int i = 1; i < 10; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%> 
									<% for(int i = 10; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:when test="${rating == 4.0}">
									<% for(int i = 1; i < 9; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%> 
									<% for(int i = 9; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:when test="${rating == 3.5}">
									<% for(int i = 1; i < 8; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%> 
									<% for(int i = 8; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%>   
								</c:when>
								<c:when test="${rating == 3.0}">
									<% for(int i = 1; i < 7; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%>
									<% for(int i = 7; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%>   
								</c:when>
								<c:when test="${rating == 2.5}">
									<% for(int i = 1; i < 6; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%>
									<% for(int i = 6; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:when test="${rating == 2.0}">
									<% for(int i = 1; i < 5; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%> 
									<% for(int i = 5; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:when test="${rating == 1.5}">
									<% for(int i = 1; i < 4; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%>  
									<% for(int i = 4; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:when test="${rating == 1.0}">
									<% for(int i = 1; i < 3; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 on" <%}%><% else {%> "starR1 on" <% }%>id= star<%=i%> ></span><% }%>  
									<% for(int i = 3; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%> 
								</c:when>
								<c:otherwise>
									<span class="starR1 on" id="star1">0.5</span>
									<% for(int i = 2; i < 11; i++) {%><span class=<% if (i % 2 == 0) {%> "starR2 " <%}%><% else {%> "starR1 " <% }%>id= star<%=i%> ></span><% }%>    
								</c:otherwise>
							</c:choose>
						</div>
				</div>
				
				<p style="font-weight: bold; font-size: 20px;">펫시터: ${review.petsitterName}님 </p>
				<hr class="dashed">
				${review.boardContent}
				
				
				<!-- 추가 -->
				<div class="pt-5" align="right">
					<form>
						<input type="hidden" id="boardNum" name="boardNum" value="${review.boardNum}"/>
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID eq review.userID}">
								<button type="submit" formaction="reviewForm" class="btn">수정</button>
								<input type="button" class="btn" value="삭제" onclick="del(${review.boardNum})" />
							</c:if>
							<c:if test="${sessionScope.userID eq 'admin'}">
								<input type="button" class="btn" value="삭제" onclick="del(${review.boardNum})" />
							</c:if>
						</c:if>
					</form>
				</div>

				<div class="pt-5" align="center">
						<!-- 수정 필요 -->
						<c:if test="${sessionScope.userID eq null}">
							<a href="signIn" onclick="alert('로그인이 필요합니다.')">
								<img src="resources/img/love.png" border="0" class="zoom">
							</a>
						</c:if>
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID ne review.userID}">
								<a href="javascript:void(0);" onclick="checkLike();">
									<img src="resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
							<c:if test="${sessionScope.userID eq review.userID}">
								<a href="#" onclick="alert('자신의 글에는 추천을 누를 수 없습니다.')">
									<img src="resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
						</c:if>
						<div id="boardLike">
							추천 수 : ${review.boardLike}
						</div>
				</div>
				<div class="pt-5" align="center">
					<a href="review"><input type="button" value="목록" class="btn" /></a>
				</div>

				<!-- comment 작성 부분 -->
					<div class="comment-form-wrap pt-5">
						<div class="replySection-title">
							<h2 class="mb-5">Leave a comment</h2>
						</div>
	       				<form id="replyForm" class="p-5 bg-light">
				           <div class="form-group">
				           	   <input type="hidden" name="boardNum" id="boardNum" value="${review.boardNum}"/>
				               <textarea class="form-control" cols="10" rows="5" id="replyContent" name="replyContent" placeholder="내용을 입력하세요."></textarea>
				               <c:if test="${sessionScope.userID ne null}">
					               <div class="form-group">	
					               		<button type="button" name="btnReply" id="btnReply" class="btn btn-primary py-3">등록</button>
					               </div>
				               </c:if>
				               <c:if test="${sessionScope.userID eq null}">
				               		<a href="signIn" onclick="alert('로그인이 필요합니다.')"><input type="button" class="btn" value="글 작성" /></a>
				               </c:if>
				            </div>
				        </form>
			    	</div>
				<!-- comment 시작 부분 -->
				<div class="pt-5">
					<div class="replySection-title">
						<h2 class="mb-5">Comments</h2>
					</div>
					<ul class="comment-list">
						<div id="replyList"></div>
					</ul>
					<!-- END comment-list -->

				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function checkLike() {
		var boardNum = '${review.boardNum}';
		$.ajax({
			url : '/petMate/reviewLike',
			type : 'post',
			data : {'boardNum' : boardNum},
			dataType : 'json',
			success : function(data) {
				var html = ''; 
				if (data.count == 0) {
					alert('추천되었습니다.');
				} else {
					alert('추천이 취소되었습니다.');
				}
				html += '추천 수: ' + data.boardLike;
				$("#boardLike").html(html);
			}
		});
	}
	function del(boardNum) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='reviewDelete?boardNum='+boardNum;
		}
	}	
</script>
<style>
	.starR1{
	    background: url('resources/img/rating.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR2{
	    background: url('resources/img/rating.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}
</style>
<style>
hr.dashed {
  border-top: 3px dashed #bbb;
}
</style>