<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="site-section bg-light">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title mb-5">
					<h2>회원가입</h2>
				</div>
				<form:form modelAttribute="registerForm" action="signUp" method="post">
					<div class="row">
						<div class="col-md-6 form-group">
							<form:label path="userID">아이디</form:label>
								<c:if test="${!registerForm.newAccount}">
									<div class="form-control form-control-lg">
										<c:out value="${registerForm.userID}" />
									</div>
	            				</c:if>
	            			<c:if test="${registerForm.newAccount}">		
								<form:input path="userID" class="form-control form-control-lg" />
								<form:errors path="userID"/>
							</c:if>
						</div>
					</div>
					<div class="div-id" id= "id_check"></div>
					<div class="row">
						<div class="col-md-6 form-group">
							<form:label path="pwd">비밀번호</form:label>
							<form:password path="pwd" class="form-control form-control-lg" />
							<form:errors path="pwd"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<form:label path="confirmPwd">비밀번호 확인</form:label>
							<form:password path="confirmPwd" class="form-control form-control-lg" />
							<form:errors path="confirmPwd"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<form:label path="email">이메일</form:label>	
							<form:input path="email" class="form-control form-control-lg"/>
							<form:errors path="email"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<c:if test="${registerForm.newAccount}">
								<form:label path="userType">회원 타입</form:label>
									펫시터<form:radiobutton path="userType" value="0"/>
									&nbsp&nbsp
									일반회원<form:radiobutton path="userType" value="1"/>
							</c:if>
							<c:if test="${!registerForm.newAccount}">
								<c:if test="${!registerForm.userType}">
									현재 회원님은 "펫시터" 입니다.
								</c:if>
								<c:if test="${registerForm.userType}">
									현재 회원님은 "일반 회원" 입니다.
								</c:if>
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<c:if test="${registerForm.newAccount}">
								<input type="submit" value="회원가입"
								class="btn btn-primary py-3 px-5">
							</c:if>
							<c:if test="${!registerForm.newAccount}">
								<input type="submit" value="회원정보 수정"
								class="btn btn-primary py-3 px-5">
							</c:if>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
/* 아이디 중복 확인 및 조건 확인 */
$(document).ready(function(){
	$("#userID").on("blur", function(){
		var userID = $("#userID").val();
		if ($("#userID").val() != "") {
	    $.ajax({
	    	async: true,
	    	type : 'GET',
	    	url : "/petMate/checkID?userID="+userID,
	    	success : function(data) {
	             if (data == 1) {
	             	$("#id_check").text("사용 중인 아이디입니다");
	 				$("#id_check").css("color", "#EC7063");
	                $("#userID").focus();
	             } else {
		             if(userID.length < 20) {
		            	$("#id_check").text("사용 가능한 아이디입니다");
			 			$("#id_check").css("color", "#2980B9");
			            $("#userpwd").focus();
				     }
		             else {
		            	$("#id_check").text("아이디는 숫자와 문자 조합으로 20자까지 입력할 수 있습니다.");
			 			$("#id_check").css("color", "#EC7063");
			            $("#userID").focus();
			         }
	             }
	         },
	         error:function(request,status,error){
	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	    });
		}
	});	
});
</script>