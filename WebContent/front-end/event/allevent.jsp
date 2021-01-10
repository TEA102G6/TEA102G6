<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.event.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	if(request.getAttribute("list")==null){
		EventService eventSvc = new EventService();
		List<EventVO> list = eventSvc.getListEventOrderby();
		pageContext.setAttribute("list", list);
	}else{
		request.getAttribute("list");				
}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>listAllBand.jsp</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/band/listAllBand.css">
<style>
</style>
</head>

<body>

	<div class="container">

		<div class="row justify-content-center">
			<div class="event_title">活動總覽</div>
		</div>

		<div class="row justify-content-center">
			<form action="<%=request.getContextPath()%>/event/EventServlet">
				<div class="search_box">
					<input type="hidden" name="action" value="getEvent"> 
					
					<input
						type="text" id="keyword"name="searchKeyWord" placeholder="search">
					<button type="submit" class="btn btn-search" id="searchBtn">
						<i class="fa fa-search"></i>
					</button>
					<span><a href="<%=request.getContextPath()%>/front-end/events/googleMap.jsp"><i class="fas fa-map-marker-alt"></i></a></span>
				</div>
			</form>
		</div>


		<div class="row justify-content-around">
			<c:forEach var="eventVO" items="${list}">
				<div class="flip" data-event_id="${eventVO.event_id}" style="cursor: pointer;"
					onclick="location.href='<%= request.getContextPath() %>/event/EventServlet?';">
					<div class="front"
						style="background-image: url(<%=request.getContextPath()%>/EventPicController?action=getEventPoster&event_id=${eventVO.event_id}" class="card-img-top)">
						<h4 class="text-shadow"><fmt:formatDate value="${eventVO.event_start_time}" pattern="MM-dd"/></h4>
					</div>
					<div class="back">
						<h2>${eventVO.event_title}</h2>
						<p>${eventVO.event_place}</p>
					</div>
				</div>
			</c:forEach>
			<c:if test="${list.size()==0}">
			<h1>查無資料</h1>
			</c:if>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>