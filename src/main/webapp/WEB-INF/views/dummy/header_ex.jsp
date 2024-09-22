<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>                                               
<html>                                                        
  <head>                                                        
    <title>ADMIN</title>                            
    <meta charset='utf-8'>                                      
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">                                     
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> -->                                     
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js'></script>
    
    <!-- css -->
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
      
  </head>
<body>
<header>
   		<div class="logo p-3" style="background-color:white; width=100%">
		  <ul class="navbar-nav w-100">
			<li class="nav-item">
			<a href="<c:url value="/"/>" target="_self" style="text-decoration:none; color:black; word-spacing: 10px; font-size:25px; font-weight: bolder">
			    <!-- <img src="./imgs/logo.png" alt="logo"> -->
			    LINE FRIENDS SQUARE
			</a>  
			</li>
			</ul>			
		</div> 
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		  <div class="container-fluid">
		    <ul class="navbar-nav w-100">
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value="/"/>">HOME</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="catInput.do">카테고리 등록</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="catList.do">카테고리 리스트</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="prodInput.do">상품등록</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="prodList.do">상품리스트</a>
		      </li> 
		     <li class="nav-item">
		        <a class="nav-link" href="boardList.do">게시판</a>
		      </li>
 		      <li class="nav-item">
		        <a class="nav-link" href="memberList.do">회원리스트</a>
		      </li> 
		      <li class="nav-item ms-auto d-flex">
			  <c:if test="${sessionScope.loginDTO.id == null}">			      
		        <a class="nav-link btn btn-outline-light login me-2" href="memberLogin.do">로그인</a>
		        <a class="nav-link btn btn-outline-light register me-2" href="memberRegister.do">회원가입</a>
		        <a class="nav-link btn btn-outline-light acess_admin" href="adminLogin.do">Admin</a>
		        
		      </c:if>  
		      
			  <c:if test="${sessionScope.loginDTO.id != null}">
			  <a class="me-3 myProfile" type="button" href="<c:url value="/member/myProfile.do"/>"><i class="fa fa-user-circle"></i>	 
		        <a class="nav-link btn btn-outline-light login" href="javascript:logout()">로그아웃</a>
		      </c:if>   

		      <c:if test="${sessionScope.loginDTO.id != null && sessionScope.mode == 'admin'}">
		        	<li class="nav-item ms-auto d-flex"><i class="fas fa-user-circle">&nbsp;</i>
		        			관리자 : ${sessionScope.loginDTO.id} 님&nbsp;&nbsp;
				  		<a class="nav-link" href="adminMain.do"><i class="fas fa-user-shield">&nbsp;</i>관리자 홈</a>&nbsp;&nbsp;
				  		<a class="nav-link" href="adminLogout.do"><i class="fas fa-user-times">&nbsp;</i>관리자 로그아웃</a>&nbsp;&nbsp;
				  		<a class="nav-link" href="javascript:alert('테스트 user_ID로 접속하세요!!')">
		  				<i class="fas fa-shopping-cart"></i> 관리자 장바구니</a>&nbsp;&nbsp;
	  				</li>
		      </c:if>
		      		        
		      </li>
		    </ul>
		  </div>
		</nav>
	<script>
		function logout(){
			location.href="<c:url value="/member/logout.do"/>";
		}			
	</script>	
</header>          








                                
