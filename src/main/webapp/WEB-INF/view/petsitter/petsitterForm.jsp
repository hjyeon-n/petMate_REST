<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.p1 {
	margin-top:8px;
}
</style>
<div class="site-section bg-light">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title mb-5">
					<h2>펫시터 매칭 폼</h2>
				</div>
				<form:form name="form" modelAttribute="petsitter" action="petsitterForm" method="post">
					<input type="hidden" name="size" id="size" value="${petsitter.petSize}" />
					<input type="hidden" name="day" id="day" value="${petsitter.petDay}" />
					<input type="hidden" name="local" id="local" value="${petsitter.petLocal}" />
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="boardTitle">제목</label> 
							<form:input path="boardTitle" class="form-control form-control-lg" />
							<form:errors path="boardTitle" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							크기
							<br />
							<form:checkboxes items="${sizeCodes}" itemLabel="label" itemValue="code" path="sizeCodes" />
							<br />
							<form:errors path="sizeCodes" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="petDay">요일</label>
							<br />
							<form:checkboxes items="${dayCodes}" itemLabel="label" itemValue="code" path="dayCodes" />
							<br />
							<form:errors path="dayCodes" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="petPrice">가격</label> 
							<form:input path="petPrice" class="form-control form-control-lg" />
							<br />
							<form:errors path="petPrice" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="petLocal">지역</label>
							<br />
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
							<br />
							<form:errors path="petLocal" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
 							<form:input path="petAddress" class="form-control form-control-lg" id="petAddress"  placeholder="도로명 주소를 입력하세요." />
 							<form:errors path="petAddress" />
						</div>
						<div class="col-md-6 form-group">
							<p class="p1"><a onClick="searchAddress()">
								<input type="button" class="btn" id="searchAddress" value="상세주소 검색하기" /></a></p>
						</div>
						<div id="map"></div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="boardContent">글 쓰기</label>
							<form:textarea path="boardContent" id="boardContent" cols="30" rows="10"
								class="form-control" style="width:120%" />
							<form:errors path="boardContent" />
						</div>
					</div>
					<c:choose>
						<c:when test="${not empty petsitter.boardNum}">
							<div class="pt-5" align="right">
									<input type="hidden" id="boardNum" name="boardNum" value="${petsitter.boardNum}"/>
									<button type="submit" class="btn" id="btn">수정</button>
							</div>
						</c:when>
						<c:when test="${empty petsitter.boardNum}">
							<div class="row" align="right">
								<div class="col-12">
									<button type="submit" value="등록" class="btn" id="btn">등록</button>
								</div>
							</div>
						</c:when>
					</c:choose>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services"></script>
<script type="text/javascript">
function searchAddress() {
	var petAddress = $("#petAddress").val();
	if (petAddress == "") {
		alert("주소를 입력하세요!");
	}
	else {
		$('div#map').css({
	        'width': '400px',
	        'height': '400px'
	    });
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		//커스텀 마커 생성
		var imageSrc = 'resources/img/marker.png',
			imageSize = new kakao.maps.Size(64, 64), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)};
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(petAddress, function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		        markerPosition = coords;
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            position: coords,
		            image:markerImage
		        });

		        var options = { //지도를 생성할 때 필요한 기본 옵션
						center: coords, //지도의 중심좌표.
						level: 3, //지도의 레벨(확대, 축소 정도)
					};
				
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				marker.setMap(map);
		        
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	} 
}
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "boardContent",
		sSkinURI: "resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});

	 $(document).on('click', '#btn', function(e){
         oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);
	      var text = $("#boardContent").val().replace(/[<][^>]*[>]/gi, "");
	      if(text == ""){
	         alert("글 내용을 입력해 주세요.");
	         oEditors.getById["boardContent"].exec("FOCUS");
	         return false;
	      } 
	      if(text.length > 1500){
	         alert("글 내용은 1500자 내로 입력해 주세요.");
	         oEditors.getById["boardContent"].exec("FOCUS");
	         return false;
	      } 
	      $("#form").submit();
     });

	// 펫시터 게시판에서 수정시 체크박스와 라디오박스에 체크가 되어있기 위함. 
	 $(function(){
		var size = $("#size").val();
	 	var day = $("#day").val();
	 	var local = $("#local").val();

		if((size & 1) != 0) {
			$("input:checkbox[id='sizeCodes1']").prop("checked", true);
		}
	 	
		if ((size & 2) != 0) {
			$("input:checkbox[id='sizeCodes2']").prop("checked", true);
		}
		
		if ((size & 4) != 0) {
			$("input:checkbox[id='sizeCodes3']").prop("checked", true);
		}

		if((day & 1) != 0) {
			$("input:checkbox[id='dayCodes1']").prop("checked", true);
		}

		if((day & 2) != 0) {
			$("input:checkbox[id='dayCodes2']").prop("checked", true);
		}

		if((day & 4) != 0) {
			$("input:checkbox[id='dayCodes3']").prop("checked", true);
		}

		if((day & 8) != 0) {
			$("input:checkbox[id='dayCodes4']").prop("checked", true);
		}

		if((day & 16) != 0) {
			$("input:checkbox[id='dayCodes5']").prop("checked", true);
		}

		if((day & 32) != 0) {
			$("input:checkbox[id='dayCodes6']").prop("checked", true);
		}

		if((day & 64) != 0) {
			$("input:checkbox[id='dayCodes7']").prop("checked", true);
		}

		if (local == '서울') {
			$("input:radio[name='petLocal']:radio[value='서울']").prop('checked', true);
		}

		if (local == '경기도') {
			$("input:radio[name='petLocal']:radio[value='경기도']").prop('checked', true);
		}

		if (local == '강원도') {
			$("input:radio[name='petLocal']:radio[value='강원도']").prop('checked', true);
		}

		if (local == '충청남도') {
			$("input:radio[name='petLocal']:radio[value='충청남도']").prop('checked', true);
		}

		if (local == '충청북도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}

		if (local == '전라남도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}

		if (local == '전라북도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}

		if (local == '경상남도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}

		if (local == '경상북도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}

		if (local == '제주도') {
			$("input:radio[name='petLocal']:radio[value='충청북도']").prop('checked', true);
		}
	 });     
</script>