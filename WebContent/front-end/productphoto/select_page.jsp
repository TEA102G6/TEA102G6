<%@page import="java.util.List"%>
<%@page import="com.productphoto.model.ProductPhotoVO"%>
<<<<<<< HEAD
=======
<%@page import="com.productphoto.model.ProductPhotoService"%>
>>>>>>> sam
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>ProductPhoto: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>�ӫ~�Ӥ�����</h3><img src="<%=request.getContextPath()%>/images/pic3.jpg" width="400" height="250" border="0"></td></tr>
</table>

<p>�o�O�ӫ~�Ӥ�����</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/productphoto/listAllProductPhoto.jsp'><b>�Ҧ��Ӥ����</b> </a></li>
  
  <jsp:useBean id="productPhotoSvc" scope="page" class="com.productphoto.model.ProductPhotoService" />
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/productphoto/productphoto.do" >
        <b>��ܷӤ��s��:</b>
        <select size="1" name="productphoto_id">
         <c:forEach var="productPhotoVO" items="${productPhotoSvc.all}"> 
           <option value="${productPhotoVO.productphoto_id}">${productPhotoVO.productphoto_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">       
    </FORM>
  </li>
 
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/productphoto/productphoto.do" >
       <b>��ܲ��~�s��:</b>
       <select size="1" name="productphoto_id">
         <c:forEach var="productPhotoVO" items="${productPhotoSvc.all}"> 
           <option value="${productPhotoVO.productphoto_id}">${productPhotoVO.product_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
</ul>

<h3>�ӫ~�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/productphoto/addProductPhoto_input.jsp'><b>�s�W�ӫ~�Ӥ�</b></a></li>
</ul>


</body>
</html>