<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css?new">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form:form modelAttribute="signInCommand" action="signIn" method="post"
				class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32"> Account Login </span> 
					<span class="txt1 p-b-11"> 
						<form:label path="userID">아이디</form:label>
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<form:input path="userID" class="input100"/>
						<form:errors path="userID" style="color:red"/>
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11"> 
						<form:label path="pwd">비밀번호</form:label> 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<form:password path="pwd" class="input100" />
						<form:errors path="pwd" style="color:red"/>
						<span class="focus-input100"></span>
					</div>

					<form:errors style="color:red"/>
					<div class="container-login100-form-btn">
						<input type="submit" value="로그인"
								class="login100-form-btn">
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>