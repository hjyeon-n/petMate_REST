<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="site-section bg-light">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
			
				<div class="section-title mb-5">
					<h2>결제 폼</h2>
				</div>
				
          		<a data-toggle="collapse" data-target="#table"><span style="color:black">주문 상품 정보 ▼</span><span class="caret"></span></a><br />
	          		<br />
	          		<div class="table-wrapper collapse" id="table">
						<table class="table table-striped">
							<c:forEach var="cart" items="${cartList}">
								<tr>
									<td ><a href="<c:url value="/gpurchaseDetail">
										<c:param name="boardNum" value="${cart.boardNum}"/></c:url>">
										<img src="resources/img/dog-food.png" border="0"> &nbsp;
										${cart.boardTitle}</a>
									</td>
									<td>수량 : 1</td>
									<td>${cart.price}</td>
									<td><input type="hidden" name="price" value="${cart.price}" />
								</tr>
							</c:forEach>
						</table>
					</div>
				<br />
				
				<a data-toggle="collapse" data-target="#od"><span style="color:black">결제 정보 ▼</span><span class="caret"></span></a><br />
				<br />
				<div class="table-wrapper collapse show" id="od">
					<form:form modelAttribute="gpurchaseOrder" action="gpurchaseOrder">
						
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="bank">은행명</label> &nbsp; &nbsp;
								<form:select items="${bankList}" path="bank" class="form-control form-control-sm" style="width : 20%"/>
								<br />
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="cardNum">카드번호</label>
								<form:input path="cardNum" class="form-control form-control-lg" style="width : 70%"
									placeholder="****-****-****-****" />
								<form:errors path="cardNum" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="cvc">CVC 번호</label>
								<form:input path="cvc" class="form-control form-control-lg" style="width : 70%"
								placeholder="***" />
								<form:errors path="cvc" />
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 form-group">
								<label for="expireDate">유효기간</label>
								<form:input path="expireDate" class="form-control form-control-lg" style="width : 70%"
								placeholder="MM/YY"/>
								<form:errors path="expireDate" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12 form-group">
								<label for="address">주소</label>
								<form:input path="address" class="form-control form-control-lg" style="width : 70%"
								placeholder="주소를 입력해주세요."/>
							</div>
						</div>
						
						<form:hidden path="price" class="form-control form-control-lg"/>
					
				</div>
				<br />
				
				<a data-toggle="collapse" data-target="#pr"><span style="color:black">최종 결제 금액 ▼</span><span class="caret"></span></a><br />
	          		<br />
	          		<div class="collapse" id="pr">
	          			<span style="color:red">&nbsp;&nbsp; ${gpurchaseOrder.price}원</span><span class="caret">
					</div>
				<br />
				<div class="row">
							<div class="col-12">
								<input type="submit" value="order" class="btn btn-primary py-3 px-5">
							</div>
						</div>
				</div>
			</form:form>
		</div>


	</div>
</div>