<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>LINE FRIENDS SQUARE</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  										<!-- Ajax -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
  										<!-- 폰트어썸 -->
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  	<!-- bootstrap -->       
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"/>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- css폴더에서 main.css 색상정하기 : css customize를 하려면 가장 밑에 bootstrap 밑에 적기 -->
	<link href="<c:url value="resources/css/main.css"/>" rel="stylesheet"/>
	<%-- <link href="<c:url value="resources/css/style.css"/>" rel="stylesheet"/> --%>
</head>
	<!-- favicon.ico 404 (Not Found) -->
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link href="<c:url value="resources/css/mega_menu.css"/>" rel="stylesheet"/>
    
<style>
	ul{
		list-style:none;	/* - 삭제 */
	}
	
	li>a{
		text-decoration:none;	/* 밑줄 삭제 */
	}
</style>

<body>
<!-- <header> -->

   		<div class="logo p-3" style="background-color:white; width=100%">
		  <ul class="navbar-nav w-100">
			<li class="nav-item">
			<a href="<c:url value="/"/>" target="_self" style="text-decoration:none; color:black; word-spacing: 10px; font-size:25px; font-weight: bolder">
			    <!-- <img src="./imgs/logo.png" alt="logo"> -->
			    LINE FRIENDS SQUARE
			</a>  
			</li>
			</ul>			
		</div> 						<!-- sticky-top : 스티키 옵션, <body> 안에 <header>를 빼줘야함 -->
		<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top"> -->
		<nav class="navbar navbar-expand-sm menubar">  <!-- css폴더에서 main.css 색상정하기 <head>에 link 넣어주기 -->
<!-- 		  <div class="container fluid"> -->
		  <div class="container menu_container" style="border: 1px solid red">
		    <ul class="navbar-nav w-100 menus">
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value="userMainForm.do"/>"><i class="fas fa-home white">&nbsp;</i>HOME</a> <!-- "nav-link active" 삭제 -->
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value="#"/>">|</a>
		      </li>

		      <li class="nav-item menu">
		      	<a class="nav-link" href="#">카테고리</a>
          		<ul class="sub-list">
					<c:forEach var="dto" items="${categorylist}">
						 <li><a href="UcatList.do?cat_num=${dto.cat_num}&code=${dto.code}&cat_name=${dto.cat_name}">${dto.cat_name}</a></li>
				   	</c:forEach>
          		</ul>
		      </li>
		      
		      <li class="nav-item menu">
		      	<a class="nav-link" href="#">베스트</a>
          		<ul class="sub-list">
					<c:forEach var="spec" items="${pdSpecs}">
						<li>
							<a href="UspecList.do?pSpec=${spec.name()}">${spec.value}상품</a>
		                </li>									
		          	</c:forEach>
          		</ul>
		      </li>
		      
		      <c:if test="${sessionScope.loginDTO.id == null}">
			      <li class="nav-item ms-auto d-flex"><!-- 부모 li의 w-100을 줘야지 ms-auto가 먹음 -->
			      	<a class="nav-link login" href="<c:url value="/memberLogin.do"/>"><i class="fas fa-user">&nbsp;</i>로그인</a>&nbsp;&nbsp;
	  				<a class="nav-link register" href="<c:url value="/memberRegister.do"/>"><i class="fas fa-user-plus">&nbsp;</i>회원가입</a>&nbsp;&nbsp;
	  				<a class="nav-link" href="javascript:alert('로그인이 필요합니다!!')"><i class="fas fa-shopping-cart">&nbsp;</i>장바구니</a>&nbsp;&nbsp;
				      <%-- <a class="nav-link btn btn-sm btn-outline-light login" href="<c:url value="/memberLogin.do"/>">로그인</a>&nbsp;&nbsp;
				      <a class="nav-link btn btn-sm btn-outline-light register" href="<c:url value="/memberRegister.do"/>">회원가입</a> --%>
			      </li>
		      </c:if>
		      
		      <c:if test="${sessionScope.loginDTO.id != null && sessionScope.mode == 'user'}">
			      <li class="nav-item ms-auto d-flex"><!-- 부모 li의 w-100을 줘야지 ms-auto가 먹음 -->
			      	<a class="me-3 myProfile" type="button" href="<c:url value="/memberInfo.do?find=info&no=${sessionScope.loginDTO.no}"/>">
			      		<i class="fa fa-user-circle">&nbsp;</i>${sessionScope.loginDTO.id} 님 즐거운 하루되세요!!</a>&nbsp;&nbsp;
			      	<a class="nav-link" href="<c:url value="/memberInfo.do?find=pwch&no=${sessionScope.loginDTO.no}"/>"><i class="fas fa-user-edit">&nbsp;</i>내정보관리</a>&nbsp;&nbsp;
	  				<a class="nav-link login" href="<c:url value="javascript:logout()"/>"><i class="fas fa-user-times">&nbsp;</i>로그아웃</a>&nbsp;&nbsp;
	  				<a class="nav-link" href="<c:url value="cartList.do"/>"><i class="fas fa-shopping-cart">&nbsp;</i>장바구니</a>&nbsp;&nbsp;
			        <%--   <a class="nav-link btn btn-sm btn-outline-light login" href="<c:url value="javascript:logout()"/>">로그아웃</a> --%>
			      </li>
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
		      
		      <li class="nav-item">
		        <a class="nav-link"  href="<c:url value="boardList.do"/>"><i class="fas fa-comments">&nbsp;</i>고객센터</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="<c:url value="adminLogin.do"/>"><i class="fas fa-user-circle">&nbsp;</i> ADMIN</a>
		      </li>	
		    </ul>
		  </div>
		</nav>

	  <script>
		
		function logout(){
			location.href="<c:url value="memberLogout.do"/>";
		}
		
 	  </script>
	  <script>
	    var menubar = document.querySelector('.menubar');
	    var submenus = document.querySelectorAll('.menu');
 	    var sub_lists = document.querySelectorAll('.sub-list'); 
	    
		
 	    /* submenus안의 각 요소를 submenu 매개변수로 받아서 	    
 	       mouseover와 mouseout이벤트를 등록 시킴 */
	    submenus.forEach(function(submenu) {
	    	/* css hover를 자바스크립트 mouseover, mouseout 이벤트 사용해서 구현 */
	        submenu.addEventListener('mouseover', function() {
	          // 부모 요소의 높이를 키웁니다.
	          menubar.style.height = '200px';
	          
	          //sub_lists안에 각 요소를 sublist매개변수로 받아서 스타일 지정함
 	          sub_lists.forEach(function(sublist) {	  	        	
	  	  	        sublist.style.display = 'block';
	  	  	        sublist.style.height = '140px'; 
	  	  	    
	  	      }); 
	        });

	        submenu.addEventListener('mouseout', function() {
	          // 부모 요소의 높이를 원래대로 돌립니다.
	          menubar.style.height = '';
	          sub_lists.forEach(function(sublist) {
		  		  sublist.style.display = '';
		  		  /* sublist.style.height= 0; */ 
		  	  }); 
	        });
	    });
	    
 	    
	    /* sticky 옵션 javascript로 구현하기 : 상단에 고정시키기 */
	    window.addEventListener('scroll', function() { // scroll 이벤트 발생시
	    	
	    	// 여기서 offsetTop은 menubar가 최상단으로부터 얼만큼 떨어져있는지를 픽셀로 표현
	        var stickyPoint = menubar.offsetTop;  
	        console.log(stickyPoint);

	        // pageYOffset은 페이지 스크롤시 그위치값, 맨위에 있으면 0, 아래로 스크롤하면 스크롤된 픽셀수만큼 값 증가
	        if (window.pageYOffset > stickyPoint) {
	          menubar.classList.add('sticky'); // css class sticky를 menubar에 추가(classList 속성사용)
	        } else {
	          menubar.classList.remove('sticky');
	        }
	      });
  </script>

<!-- 	<div class="container fluid" style="border:5px solid red"> -->
		<%-- <%@ include file="u_left.jsp" %> --%>
		
<!-- </header> -->