<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>  
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
	if (memberVo == null) {
		response.sendRedirect(request.getContextPath() + "/front-end/member/Login.jsp");
	} ;
	EventService EventSvc = new EventService();
    List<EventVO> list = EventSvc.getEventsByBandId("memberVo.getBandId()");
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>�����q����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/css/member/member_center_top.file" %>
<div align="center" style="position:relative" id="table-1">
	�����q���� 
</div>

<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp')">�^�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllProduct.jsp')">�C�X�����ӫ~</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp')">�s�W�ӫ~</button></a>
</div>
<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp')">�C�X�ӫ~�q��</button></a>
<a href='<%=request.getContextPath()%>/front-end/productphoto/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/productphoto/protect/select_page.jsp')">�ӫ~�Ӥ�����</button></a>
</div>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="table">
<table>
	<%@ include file="page1.file" %> 
	<c:forEach var="eventVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
	<tr>
		<th>���ʽs��</th>
		<th>�ֹνs��</th>
		<th>��������</th>
		<th>���ʱƧ�</th>
		<th>���ʼ��D</th>
		<th>���ʸԱ�</th>
		<th>���ʮ���</th>
		<th>���ʰϰ�</th>
		<th>���ʳ��a</th>
		<th>���ʿ���</th>
		<th>���ʿ�������</th>
		<th>���ʦa�}</th>
	</tr>
		<tr>
			<td>${eventVO.event_id}</td>
			<td>${eventVO.band_id}</td>
			<td>${eventVO.event_type}</td>
			<td>${eventVO.event_sort}</td>
			<td>${eventVO.event_title}</td>
			<td>${eventVO.event_detail}</td>
			<td><img src="<%=request.getContextPath()%>/EventPicController?action=getEventPoster&event_id=${eventVO.event_id}"></td>
			<td>${eventVO.event_area}</td>
			<td>${eventVO.event_place}</td>
			<td>${eventVO.event_city}</td>
			<td>${eventVO.event_cityarea}</td>
			<td>${eventVO.event_address}</td>
		</tr>
		<tr>
		<th>���ʶ}�l�ɶ�</th>
		<th>���ʤW�[�ɶ�</th>
		<th>�̫�ק�ɶ�</th>
		<th>�̫�ק��</th>
		<th>���ʪ��A</th>
		<th>�y���</th>
		</tr>
		<tr>
		<td>${eventVO.event_start_time}</td>
			<td>${eventVO.event_on_time}</td>
			<td>${eventVO.event_last_edit_time}</td>
			<td>${eventVO.event_last_editor}</td>
			<td>${eventVO.event_status}</td>
			<td><img src="<%=request.getContextPath()%>/EventPicController?action=getEventSeat&event_id=${eventVO.event_id}"></td>	
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
<%@ include file="/css/member/member_center_bottom.file" %>
</body>
</html>