<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="petsitterReply.jsp" %>
<div class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 single-content">
				<h1 class="mb-4">
					<c:if test="${not empty petsitter.isSelected}">
						[매칭완료]&nbsp;
					</c:if>
					${petsitter.boardTitle}
				</h1>
				<c:if test="${not empty petsitter.isSelected}">
					<img src="resources/img/lock.png" align="right">
				</c:if>
				<div class="post-meta d-flex mb-5">
					<div class="vcard">
						<span class="d-block">
   							<a href="<c:url value="/userpage">
   							<c:param name="userID" value="${petsitter.userID}"/>
   							</c:url>">${petsitter.userID}</a>
							</span>
						<span class="date-read">
						<fmt:parseDate var="dateString" value="${petsitter.boardDate}" pattern="yyyy-MM-dd HH:mm:ss" />               
						<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm"/>
						조회 ${petsitter.boardHit}</span>
					</div>
				</div>
				<table class="table">
					<tbody>
					<tr align="center">
						<td><span style="font-weight:bold;">크기</span></td>
						<td>${size}</td>
					</tr>
					<tr align="center">
						<td><span style="font-weight:bold;">요일</span></td>
						<td>${day}</td>
					</tr>
					<tr align="center">
						<td><span style="font-weight:bold;">요금</span></td>
						<td>${petsitter.petPrice}</td>
					</tr>
					<tr align="center">
						<td><span style="font-weight:bold;">지역</span></td>
						<td>${petsitter.petLocal}</td>
					</tr>
					<tr><td></td><td></td></tr>
					</tbody>
				</table>
				<br />
				<span style="font-weight:bold;">상세주소</span>
				<div id="map" style="width:400px; height:400px;"></div>
				<br /><br />
				${petsitter.boardContent}
				
				
				<!-- 추가 -->
				<div class="pt-5" align="right">
					<c:if test="${empty petsitter.isSelected}">
					<form>
						<input type="hidden" id="boardNum" name="boardNum" value="${petsitter.boardNum}"/>
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID eq petsitter.userID}">
								<button type="submit" formaction="petsitterForm" class="btn">수정</button>
								<input type="button" class="btn" value="삭제" onclick="del(${petsitter.boardNum})" />
							</c:if>
							<c:if test="${sessionScope.userID eq 'admin'}">
								<input type="button" class="btn" value="삭제" onclick="del(${petsitter.boardNum})" />
							</c:if>
						</c:if>
					</form>
					</c:if>
				</div>

				<div class="pt-5" align="center">
						<c:if test="${sessionScope.userID eq null}">
							<a href="signIn" onclick="alert('로그인이 필요합니다.')">
								<img src="resources/img/love.png" border="0" class="zoom">
							</a>
						</c:if>
						<c:if test="${sessionScope.userID ne null}">
							<c:if test="${sessionScope.userID ne petsitter.userID}">
								<a href="javascript:void(0);" onclick="checkLike();">
									<img src="resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
							<c:if test="${sessionScope.userID eq petsitter.userID}">
								<a href="#" onclick="alert('자신의 글에는 추천을 누를 수 없습니다.')">
									<img src="resources/img/love.png" border="0" class="zoom">
								</a>
							</c:if>
						</c:if>
						<div id="boardLike">
							추천 수 : ${petsitter.boardLike}
						</div>
				</div>
				<div class="pt-5" align="center">
					<a href="petsitterList"><input type="button" value="목록" class="btn" /></a>
				</div>
				
				<!-- comment 작성 부분 -->
				<c:if test="${empty petsitter.isSelected}">
					<div class="comment-form-wrap pt-5">
						<div class="replySection-title">
							<h2 class="mb-5">Leave a comment</h2>
						</div>
	       				<form id="replyForm" class="p-5 bg-light">
				           <div class="form-group">
				           	   <input type="hidden" name="boardNum" id="boardNum" value="${petsitter.boardNum}"/>
				               <textarea class="form-control" cols="10" rows="5" id="replyContent" name="replyContent" placeholder="내용을 입력하세요."></textarea>
				               <c:if test="${sessionScope.userID ne null}">
					               <div class="form-group">	
					               		<button type="button" name="btnReply" id="btnReply" class="btn btn-primary py-3">등록</button>
					               </div>
				               </c:if>
				               <c:if test="${sessionScope.userID eq null}">
				               		<a href="signIn" onclick="alert('로그인이 필요합니다.')"><input type="button" class="btn" value="등록" /></a>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
//커스텀 마커 생성
var imageSrc = 'resources/img/marker.png',
	imageSize = new kakao.maps.Size(64, 64), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)};
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('${petsitter.petAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = coords;
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            position: coords,
            image:markerImage,
            clickable: true
        });

        var options = { //지도를 생성할 때 필요한 기본 옵션
				center: coords, //지도의 중심좌표.
				level: 3, //지도의 레벨(확대, 축소 정도)
			};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		marker.setMap(map);
		var iwContent = '<div style="padding:15px;"><span style="font-weight:bold;">펫시팅주소</span><br/>${petsitter.petAddress}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true;
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

function checkLike() {
	var boardNum = '${petsitter.boardNum}';
	$.ajax({
		url : '/petMate/petsitterLike',
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
			location.href='petsitterDetail/delete?boardNum='+boardNum;
		}
	}	
</script>