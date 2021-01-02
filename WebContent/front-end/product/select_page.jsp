<%@page import="java.util.List"%>
<%@page import="com.product.model.ProductVO"%>
<%@page import="com.product.model.ProductService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Product: Band</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #dee2e6;
	margin-top: 5px;
	margin-bottom: 5px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
    margin:0px auto;
  }
  table#table-1 h1{
	color: #4f5d75;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  
  button#searchTable{
  background-color: #dee2e6;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 12px;;
  }
  button#searchTable a{
  color: #4f5d75;
  font-size: 25px;
  text-decoration: none;
  }
</style>

</head>
<body bgcolor='#f8f9fa'>

<table id="table-1">
   <tr><td><h1>�ֹΰӫ~����</h1></td></tr>
</table>

<div>
<button id="searchTable"><a href='<%=request.getContextPath()%>/front-end/product/listAllProduct.jsp'>�C�X�����ӫ~</a></button>
<button id="searchTable"><a href='<%=request.getContextPath()%>/front-end/product/addProduct.jsp'>�s�W�ӫ~</a></button>
<button id="searchTable"><a href='<%=request.getContextPath()%>/front-end/orders/listAllOrdersBandView.jsp'>�C�X�ӫ~�q��</a></button>
<button id="searchTable"><a href='<%=request.getContextPath()%>/front-end/orders/listAllTicketBandView.jsp'>�C�X�����q��</a></button>
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

</body>
</html>