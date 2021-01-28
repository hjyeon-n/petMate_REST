<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

      <div class="header-top">
         <div class="container">
            <div class="row align-items-center">
               <div class="col-12 col-lg-6 d-flex">
               	 <img src="${pageContext.request.contextPath}/resources/img/dog.png" width="64px" height="64px"/>
                  <a href="${pageContext.request.contextPath}/index" class="site-logo"> PETMATE </a> <a href="#"
                     class="ml-auto d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                     class="icon-menu h3"></span></a> 
                     <img src="${pageContext.request.contextPath}/resources/img/cat.png" width="64px" height="64px"/>
               </div>
               <div class="col-12 col-lg-6 ml-auto d-flex">
                  <div class="ml-md-auto top-social d-none d-lg-inline-block">
                  <c:choose>
                  	<c:when test="${userID eq null}">
                  		<a href="${pageContext.request.contextPath}/sign-in">로그인</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                       	<a href="${pageContext.request.contextPath}/sign-up">회원가입</a>
                    </c:when>
                    <c:when test="${userID eq 'admin'}">
                    	<div style="margin-top: -45px">관리자 ${userID}</div>
						<a href="${pageContext.request.contextPath}/sign-out">로그아웃</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                       	<a href="${pageContext.request.contextPath}/admin">관리자 페이지</a>
                    </c:when>
                    <c:when test="${userID ne null}">
                    	<div style="margin-top: -45px">안녕하세요 ${userID}님
                    		<img src="${pageContext.request.contextPath}/resources/img/paw.png" width="16px" height="16px"/>
                    	</div>
						<a href="${pageContext.request.contextPath}/sign-out">로그아웃</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                       	<a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
                    </c:when>
                  </c:choose>
                  </div>
          	</div>
          </div>
           <ul class="nav justify-content-between">
           	<li><a href="${pageContext.request.contextPath}/info"><span style="color:black">정보게시판</span></a></li>
          	<li><a href="${pageContext.request.contextPath}/inquiry"><span style="color:black">질문게시판</span></a></li>
          	<li><a href="${pageContext.request.contextPath}/gpurchase"><span style="color:black">공구게시판</span></a></li>
          	<li><a href="${pageContext.request.contextPath}/secondhand"><span style="color:black">중고게시판</span></a></li>
          	<li class="dropdown">
          		<a class="dropdown-toggle" data-toggle="dropdown"><span style="color:black">펫시터게시판</span><span class="caret"></span></a>
          		<ul class="dropdown-menu">
          			<li><a href="${pageContext.request.contextPath}/petsitter"><span style="color:black">매칭게시판</span></a></li>
          			<li><a href="${pageContext.request.contextPath}/review"><span style="color:black">리뷰게시판</span></a></li>
          		</ul>
          </ul>
		</div>
	</div>
</div>