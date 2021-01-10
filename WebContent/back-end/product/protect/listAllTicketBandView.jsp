<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	EventService EventSvc = new EventService();
    List<EventVO> list = EventSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>�����q����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/fontawesome-free/css/all.min.css"
 rel="stylesheet" type="text/css">
<link
 href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
 rel="stylesheet">

<!-- Custom styles for this template -->
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/css/sb-admin-2.min.css"
 rel="stylesheet">

<!-- Custom styles for this page -->
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/datatables/dataTables.bootstrap4.min.css"
 rel="stylesheet">
</head>
<body bgcolor='white'>
<%@ include file="/back-end/headerNfooter/header.file" %>
<div align="center" style="position:relative" id="table-1">
	�����q���� 
</div>

<div align="center" id="select">
<a href='<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp')">�^��x�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllProductManagement.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllProductManagement.jsp')">�C�X�����ӫ~</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllProductUnapproval.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllProductUnapproval.jsp')">�ӫ~�f��</button></a>
</div>
<div align="center" id="select">
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllOrdersMView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllOrdersMView.jsp')">�C�X�ӫ~�q��</button></a>
<a href='<%=request.getContextPath()%>/back-end/productphoto/listAllProductPhoto.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/productphoto/listAllProductPhoto.jsp')">�C�X�ӫ~�Ӥ�</button></a>
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
	<tbody>
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
</div>
<%@ include file="page2.file" %>
<%@ include file="/back-end/headerNfooter/footer.file" %>
</body>
</html>