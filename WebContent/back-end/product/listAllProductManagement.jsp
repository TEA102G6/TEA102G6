<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>  
<%@ page import="com.productphoto.model.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ProductService ProductSvc = new ProductService();
    List<ProductVO> list = ProductSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<%
  ProductPhotoVO productPhotoVO = (ProductPhotoVO) request.getAttribute("productPhotoVO"); //ProductPhotoServlet.java(Controller), �s�Jreq��ProductPhotoVO����
%>

<html>
<head>
<title>�Ҧ��ӫ~��� - listAllProductManagement.jsp</title>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  } 
  #submit{
  color: red;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��ӫ~��� - listAllProductManagement.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/product/select_page.jsp"><img src="<%=request.getContextPath()%>/images/pic.jpg" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
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
		<th>�ӫ~�s��</th>
		<th>�ֹνs��</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~²��</th>
		<th>�ӫ~�Բӻ���</th>
		<th>�ӫ~���</th>
		<th>�ӫ~�w�s�q</th>
		<th>�f�֪��A</th>
		<th>�W�U�[���A</th>
		<th>�w�p�W�[�ɶ�</th>
		<th>�w�p�U�[�ɶ�</th>
		<th>����ɶ�</th>
		<th>�馩</th>
		<th>�馩�}�l�ɶ�</th>
		<th>�馩�����ɶ�</th>
		<th>�̫�ק�ɶ�</th>
		<th>�̫�ק��</th>

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${productVO.product_id}</td>
			<td>${productVO.band_id}</td>
			<td>${productVO.product_type}</td>
			<td>${productVO.product_name}</td>
			<td>${productVO.product_intro}</td>
			<td>${productVO.product_detail}</td>
			<td>${productVO.product_price}</td>
			<td>${productVO.product_stock}</td>
			<td>
			<c:choose>
				<c:when test="${productVO.product_check_status == 1}">
				  �w�f��
				</c:when>
				<c:otherwise>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�I���T�{�f��" id="submit">
			     <input type="hidden" name="product_id"  value="${productVO.product_id}">
			     <input type="hidden" name="action"	value="approval"></FORM>
				</c:otherwise>
				</c:choose>
			</td>
			<td>
			<c:choose>
			<c:when test="${productVO.product_status == 1}">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" style="margin-bottom: 0px;">
			     �w�W�[
			     <input type="submit" value="�����U�[" id="submit" >
			     <input type="hidden" name="product_id"  value="${productVO.product_id}">
			     <input type="hidden" name="action" value="dislaunch"></FORM>
			</c:when>
			<c:otherwise>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" style="margin-bottom: 0px;">
			      �w�U�[
			     <input type="submit" value="�����W�[" id="submit">
			     <input type="hidden" name="product_id"  value="${productVO.product_id}">
			     <input type="hidden" name="action" value="launch"></FORM>
			</c:otherwise>
			</c:choose>
			</td>
			<td><fmt:formatDate value="${productVO.product_on_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_off_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_add_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${productVO.product_discount}</td>
			<td><fmt:formatDate value="${productVO.product_discount_on_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_discount_off_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_last_edit_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${productVO.product_last_editor}</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>