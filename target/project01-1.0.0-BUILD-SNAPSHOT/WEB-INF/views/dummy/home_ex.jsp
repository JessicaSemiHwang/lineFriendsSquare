<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<!-- msg 띄우는 것 -->
<c:if test="${requestScope.msg != null}">
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>

	<!-- <div class="container ms-5"> -->
	<div class="container-fluid p-0 visual-area">
			<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
		
		  <!-- Indicators/dots -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
		    
		  </div>
		
		  <!-- The slideshow/carousel -->
		  <div class="carousel-inner container-fluid p-0">
		    <div class="carousel-item active">
		      <img src="resources/imgs/1.jpg" alt="bunnies" class="d-block w-100">
				  <div class="carousel-caption">
				    		<h3>BUNNIES!!</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/2.jpg" alt="line_friends" class="d-block w-100">
				  <div class="carousel-caption">
				    		<h3>Line Friends</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/3.jpg" alt="new_jeans" class="d-block w-100">
				  <div class="carousel-caption">
				    		<h3>New Jeans</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/4.jpg" alt="la" class="d-block w-100">
				  <div class="carousel-caption">
				   		 	<h3>Los Angeles</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		  </div>
		  
		
		  <!-- Left and right controls/icons -->
		  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </button>
	</div>
	<br>
	

	<!-- 유효성검사 메인에서 뜨는 상품 인기,추천,신규상품이 없다면, 있다면 -->
	<!-- <div class="container ms-5"> -->
	
	<div class="container">
		 <c:forEach var="key" items="${key}">
			<c:if test="${map[key].size() != 0 }">
				<h4 class="mt-3">${key} 상품</h4>
				<div class="d-flex">
					<c:set var="cnt" value="0"/>	<!-- 4배수 일 경우 줄내리고 다음포문 새로시작 - 4배수 카운트 -->
					<c:forEach var="pDto" items="${map[key]}">		
						<c:set var="cnt" value="${cnt+1}"/>	<!-- 4배수 일 경우 줄내리고 다음포문 새로시작 - 4배수 카운트 +1 -->
						<!-- Card -->
							<%@include file="./product/card.jsp" %>
						<!-- Card End -->
						<c:if test="${cnt%5==0}">
							</div>
							<div class="d-flex mt-5"> <!-- div테그 종료/재시작, 4배수 일 경우 줄내리고 다음포문 새로시작 -->
						</c:if>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${map[key].size() == 0 }">
				<br>${key} 상품이 없습니다!!<br>
			</c:if>
		</c:forEach>
	</div> 
<!-- </div> -->		
<%@ include file="../include/footer.jsp" %>
 --%>