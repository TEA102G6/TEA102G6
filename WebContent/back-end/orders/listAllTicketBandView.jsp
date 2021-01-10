<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ticket.model.*"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	TicketService TicketSvc = new TicketService();
    List<TicketVO> list = TicketSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<meta charset="BIG5">
<title>listAllTicketBandView.jsp</title>
</head>
<body>


<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>���ʲ���s��</th>
		<th>���ʽs��</th>
		<th>���رƧ�</th>
		<th>���ʲ��ئW��</th>
		<th>���رi��</th>
		<th>��i���B</th>
		<th>��X�ɶ�</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="ticketVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${ticketVO.ticket_id}</td>
			<td>${ticketVO.event_id}</td>
			<td>${ticketVO.ticket_sort}</td>
			<td>${ticketVO.ticket_name}</td>
			<td>${ticketVO.ticket_amount}</td>
			<td>${ticketVO.ticket_price}</td>
			<td>${productVO.ticket_onsale_time}</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>