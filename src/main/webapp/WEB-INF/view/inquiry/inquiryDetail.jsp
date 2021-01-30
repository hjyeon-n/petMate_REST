<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="answer.jsp" %>
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 single-content">
				<h1 class="mb-4">
				<c:if test="${inquiry.isSelected eq 1}">[채택완료] &nbsp;</c:if>${inquiry.boardTitle}</h1>
				<c:if test="${inquiry.isSelected eq 1}">
					<img src="${pageContext.request.contextPath}/resources/img/lock.png" align="right">
				</c:if>
				<div class="post-meta d-flex mb-5">
					<div class="vcard">
						<span class="d-block"><a href="<c:url value="/user-page"><c:param name="userID" value="${inquiry.userID}"/></c:url>">${inquiry.userID}</a></span>
						<span class="date-read"><fmt:parseDate var="dateString" value="${inquiry.boardDate}" pattern="yyyy-MM-dd HH:mm:ss" />               
						<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/> 
						<span class="mx-1">&bullet;</span> 조회 ${inquiry.boardHit} <span class="icon-star2"></span></span>
					</div>
				</div>
				${inquiry.boardContent}	
				<!-- 추가 -->
				<div class="pt-5" align="right">
					<form>
						<input type="hidden" id="boardNum" name="boardNum" value="${inquiry.boardNum}"/>
						<c:if test="${inquiry.isSelected ne 1}">
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID eq inquiry.userID}">
								<button type="submit" formaction="post" class="btn">수정</button>
								<input type="button" class="btn" value="삭제" onclick="del(${inquiry.boardNum})"/>
							</c:if>
						</c:if>	
							<c:if test="${sessionScope.userID eq 'admin'}">
								<input type="button" class="btn" value="삭제" onclick="del(${inquiry.boardNum})" />
							</c:if>
						</c:if>
					</form>
				</div>

				<div class="pt-5" align="center">
						<!-- 수정 필요 -->
						<c:if test="${sessionScope.userID eq null}">
							<a href="signIn" onclick="alert('로그인이 필요합니다.')">
								<img src="${pageContext.request.contextPath}/resources/img/love.png" border="0" class="zoom">
							</a>
						</c:if>
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID ne inquiry.userID}">
								<a href="javascript:void(0);" onclick="checkLike();">
									<img src="${pageContext.request.contextPath}/resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
							<c:if test="${sessionScope.userID eq inquiry.userID}">
								<a href="#" onclick="alert('자신의 글에는 추천을 누를 수 없습니다.')">
									<img src="${pageContext.request.contextPath}/resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
						</c:if>
						<div id="boardLike">
							추천 수 : ${inquiry.boardLike}
						</div>
				</div>
				<div class="pt-5" align="center">
					<a href="${pageContext.request.contextPath}/inquiry"><input type="button" value="목록" class="btn" /></a>
				</div>
				
				<!-- comment 작성 부분 -->
				<c:if test="${inquiry.isSelected ne 1}">
					<div class="comment-form-wrap pt-5">
						<div class="replySection-title">
							<h2 class="mb-5">Leave a comment</h2>
						</div>
	       				<form id="answerForm" class="p-5 bg-light">
				           <div class="form-group">
				           	   <input type="hidden" name="boardNum" id="boardNum" value="${inquiry.boardNum}"/>
				               <textarea class="form-control" cols="10" rows="5" id="answerContent" name="answerContent" placeholder="내용을 입력하세요."></textarea>
				               <c:if test="${sessionScope.userID ne null}">
					               <div class="form-group">	
					               		<button type="button" name="btnAnswer" id="btnAnswer" class="btn btn-primary py-3">등록</button>
					               </div>
				               </c:if>
				               <c:if test="${sessionScope.userID eq null}">
				               		<a href="sign-in" onclick="alert('로그인이 필요합니다.')"><input type="button" class="btn" value="글 작성" /></a>
				               </c:if>
				            </div>
				        </form>
			    	</div>
			    </c:if>
				<!-- comment 시작 부분 -->
				<div class="pt-5">
					<div class="replySection-title">
						<h2 class="mb-5">Comments</h2>
					</div>
					<ul class="comment-list">
						<div id="answerList"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function checkLike() {
		var boardNum = '${inquiry.boardNum}';
		$.ajax({
			url : '${pageContext.request.contextPath}/inquiry-like/'+boardNum,
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
			$.ajax({
				url : '${pageContext.request.contextPath}/inquiry/'+boardNum,
				type : 'delete',
				data : {'boardNum' : boardNum},
				dataType : 'text',
				success : function(data) {
					if (data == "success") {
						location.href = "${pageContext.request.contextPath}/inquiry";
					}
				},
				error: function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
	} 
</script>