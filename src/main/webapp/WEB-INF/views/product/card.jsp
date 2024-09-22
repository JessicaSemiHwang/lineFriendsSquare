<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 천단위로 변경 -->
    
	<!-- Card -->
		<div class="card me-3 p-1" style="width:200px">
		
			<!-- 사진업로드 -->
		  <a href="UprodView.do?pnum=${pDto.pnum}&pSpec=${pDto.pspec}" style="height:240px;overflow:hidden">
			  <img class="card-img-top" 
				  src="<c:url value="/resources/fileRepo/${pDto.pimage}"/>" 
				  alt="Card image" style="width:100%">
		  </a>
		  <div class="card-body">
		    <h6 class="card-title"><b>${pDto.pname}</b></h6>
		    <p></p>
		    <p class="card-text">가격 : <fmt:formatNumber value="${pDto.price}"/></p> <!-- 천단위로 변경 -->
		    <p class="card-text">포인트 : <fmt:formatNumber value="${pDto.point}"/></p> <!-- 천단위로 변경 -->
		    
		    <!-- 로그인이 되어있을경우 -->
		    <c:if test="${sessionScope.loginDTO.id != null}">
		    	<a href="addCart.do?pnum=${pDto.pnum}&pqty=1&pspec=${pDto.pspec}" 
		    		class="btn btn-primary" style="width:100%">장바구니 담기</a>
		    </c:if>
		    <!-- 로그인이 안되어있을경우 -->
		    <c:if test="${sessionScope.loginDTO.id == null}">
		    	<a href="javascript:alert('로그인이 필요합니다')"
		    		 class="btn btn-primary" style="width:100%">장바구니 담기</a>
		    </c:if>
		    
		  </div>
		</div>
	<!-- Card End -->