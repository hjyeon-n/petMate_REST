<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="secondhandReply.jsp" %>
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 single-content">
				<h1 class="mb-4">${secondhand.boardTitle}</h1>
				<div class="post-meta d-flex mb-5">
					<div class="vcard">
						<span class="d-block">
							<a href="<c:url value="/userpage">
							<c:param name="userID" value="${secondhand.userID}"/>
							</c:url>">${secondhand.userID}</a>
						</span> 
						<span class="date-read">
						<fmt:parseDate var="dateString" value="${secondhand.boardDate}" pattern="yyyy-MM-dd HH:mm:ss" />               
						<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/>
						조회 ${secondhand.boardHit}</span>
					</div>
				</div>
				
				<div style="font-weight: bold; font-size: 15px;">
					상품 가격: ${secondhand.price}  <br>
				</div>
			
				<hr class="dashed">
				<br />
				${secondhand.boardContent} &nbsp;
				<!-- 추가 -->
				<div class="pt-5" align="right">
				<form>
					<input type="hidden" id="boardNum" name="boardNum" value="${secondhand.boardNum}"/>
					<c:if test="${sessionScope.userID ne null}">
						<c:if test="${sessionScope.userID eq secondhand.userID}">
							<button type="submit" formaction="secondhandForm" class="btn">수정</button>
							<input type="button" class="btn" value="삭제" onclick="del(${secondhand.boardNum})" />
						</c:if>
						<c:if test="${sessionScope.userID eq 'admin'}">
							<input type="button" class="btn" value="삭제" onclick="del(${secondhand.boardNum})" />
						</c:if>
					</c:if>
				</form>
				</div>

				<div class="pt-5" align="center">
					<c:choose>
						<c:when test="${sessionScope.userID eq null}">
							<a href="signIn" onclick="alert('로그인이 필요합니다.')">
								<img src="resources/img/cart.png" border="0" class="zoom">
							</a>
						</c:when>
						<c:when test="${secondhand.isSold eq 1}">
								<a href="#" onclick="alert('판매종료 된 상품입니다.')">
									<img src="resources/img/cart.png" border="0" class="zoom">
								</a>
						</c:when>
						<c:when test="${sessionScope.userID ne null}">
							<c:choose>
								<c:when test="${sessionScope.userID ne secondhand.userID}">
									<a href="javascript:void(0);" onclick="checkCart();">
										<img src="resources/img/cart.png" border="0" class="zoom">
									</a>
								</c:when>
								<c:when test="${sessionScope.userID eq secondhand.userID}">
									<a href="#" onclick="alert('자신의 상품은 담을 수 없습니다.')">
										<img src="resources/img/cart.png" border="0" class="zoom">
									</a>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
						<div id="cartAdded">
							장바구니 담은 수 : ${secondhand.cartAdded}
						</div>
				</div>
				
				<div class="pt-5" align="center">
					<a href="secondhand"><input type="button" value="목록" class="btn" /></a>
				</div>
				<!-- comment 작성 부분 -->
				<c:if test="${secondhand.isSold ne 1}">
					<div class="comment-form-wrap pt-5">
							<div class="replySection-title">
								<h2 class="mb-5">Leave a comment</h2>
							</div>
		       				<form id="replyForm" class="p-5 bg-light">
					           <div class="form-group">
					           	   <input type="hidden" name="boardNum" id="boardNum" value="${secondhand.boardNum}"/>
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
			    </c:if>

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
	function checkCart() {
		var boardNum = '${secondhand.boardNum}';
		$.ajax({
			url : '/petMate/secondhandCartAdded',
			type : 'post',
			data : {'boardNum' : boardNum},
			dataType : 'json',
			success : function(data) {
				var html = '';
				if (data.count == 0) {
					alert('장바구니에 추가되었습니다.');
				} else {
					alert('이미 담은 상품입니다.');
				}
				html += '장바구니 담은 수: ' + data.cartAdded;
				$("#cartAdded").html(html);
			}
		});
	}

	function del(boardNum) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='secondhandDetail/delete?boardNum='+boardNum;
		}
	}
</script>
<style>
hr.dashed {
  border-top: 3px dashed #bbb;
}
</style>