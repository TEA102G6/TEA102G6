<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>  
<%@ page import="com.ticket.model.*"%>  
<%@ page import="com.product.model.*"%> 
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
	ProductService ProductSvc = new ProductService();
    List<TicketVO> list = ProductSvc.getEOrder(memberVo.getBandId());
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>�����q����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/front-end/header_footer/header.jsp"%>
<%@ include file="/css/member/member_center_top.file"%>
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

<div class="table" align="center">
<table>
	<%@ include file="page1.file" %> 
	<c:forEach var="ticketVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
	<tr>
		<th>���ʲ���s��</th>
		<th>���ʽs��</th>
		<th>���ʲ��ئW��</th>
		<th>���رi��</th>
		<th>��i���B</th>
		<th>�`���B</th>
	</tr>
		<tr>
			<td>${ticketVO.ticket_id}</td>
			<td>${ticketVO.event_id}</td>
			<td>${ticketVO.ticket_name}</td>
			<td>${ticketVO.ticket_amount}</td>		
			<td>${ticketVO.ticket_price}</td>
			<td>${ticketVO.ticket_amount*ticketVO.ticket_price }</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
<%@ include file="/css/member/member_center_bottom.file"%>
	<jsp:include page="/front-end/header_footer/footer.jsp" flush="true" />
</body>
</html>