<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link
	href="./css/default.css"
	rel="stylesheet"
	type="text/css">
<link
	href="./css/subpage.css"
	rel="stylesheet"
	type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
			<jsp:include page="../inc/top.jsp" />
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
			<jsp:include page="../inc/left.jsp" />
		<!-- 왼쪽메뉴 -->
		
		<!-- 게시판 -->
		<article>
			<h1>Notice</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Writer</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
				<c:forEach var="dto" items="${requestScope.dto }">
				<tr>
					<td>${dto.bno }</td>
					<td class="left">
					<c:if test="${dto.re_lev > 0 }">
					<img src="./images/board/level.gif" width="${dto.re_lev * 10 }">
					<img src="./images/board/re.gif">
					</c:if>
					<a href="./BoardContent.bo?bno=${dto.bno }&pageNum=${requestScope.pageNum }&search=${param.search }">
					${dto.subject }</a>
					<c:if test="${!empty dto.file }">
						<img src="./images/board/save.png">
					</c:if>
					</td>
					<td>${dto.name }</td>
					<td class="cdate">${dto.date }</td>
					<td>${dto.readcount }</td>
					
				</tr>
				</c:forEach>
			</table>
			<div id="table_search">
				<form action="./BoardList.bo" method="get"> <!-- 데이터 조회 : get 방식 -->
					<input type="text" name="search" class="input_box"> 	
					<input type="submit" value="search" class="btn">			
				</form>
			</div>
			<div class="clear"></div>
			<div id="page_control">
				<c:if test="${requestScope.startPage > requestScope.pageBlock }">
					<a href="./BoardList.bo?pageNum=${requestScope.startPage - requestScope.pageBlock }&search=${param.search }"><button type="button">Prev</button></a>
				</c:if>
				
				<c:forEach var="i" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
					<a href="./BoardList.bo?pageNum=${i }&search=${param.search }">${i }</a>
				</c:forEach>
				
				<c:if test="${requestScope.endPage < requestScope.pageCount }">
					<a href="./BoardList.bo?pageNum=${requestScope.startPage + requestScope.pageBlock }&search=${param.search }"><button type="button">Next</button></a>
				</c:if>
			</div>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<footer>
			<hr>
			<div id="copy">
				All contents Copyright 2011 FunWeb 2011 FunWeb Inc. all rights reserved<br> Contact mail:funweb@funwebbiz.com Tel +82 64 123 4315 Fax +82 64 123 4321
			</div>
			<div id="social">
				<img
					src="./images/facebook.gif"
					width="33"
					height="33"
					alt="Facebook"> <img
					src="./images/twitter.gif"
					width="34"
					height="34"
					alt="Twitter">
			</div>
		</footer>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>