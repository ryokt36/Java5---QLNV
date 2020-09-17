
<%@page import="org.springframework.ui.ModelMap"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/add_account">Add Account</a>
<script type="text/javascript">
var success = "${success}";
var message = "${message}";
if (success!="") {
	swal(success, message, "success");
}

var error = "${error}";
var message = "${message}";
if (error!="") {
	swal(error, message, "error");
}
<%
session.removeAttribute("success");
session.removeAttribute("message");
	ModelMap model = new ModelMap();
	model.remove("error");
	model.remove("message");
%>
</script>
<a></a>
<form>
	<c:set var="taikhoan" value="${sessionScope.Taikhoan}"/>
        <c:if test="${not empty taikhoan}"/>
	<table class="table table-hover" style="text-align: center">
		<thead>
			<tr>
				<th>Username</th>
				<th>Permission</th>
				<th>Name</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="count" value="0" />
			<c:forEach var="rows" items="${taikhoan}">
				<c:set var="count" value="${count +1}" />
				<tr>
					<td>${rows.tendangnhap}</td>
					<td>${rows.quyen}</td>
					<td>${rows.hoten}</td>
					<td>
						<a class="w3-button w3-yellow" href="${pageContext.request.contextPath}/edit_account?tendangnhap=${rows.tendangnhap}">Edit</a>
						<a class="w3-button w3-red" href="${pageContext.request.contextPath}/delete_account?tendangnhap=${rows.tendangnhap}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
