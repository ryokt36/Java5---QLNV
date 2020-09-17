
<%@page import="org.springframework.ui.ModelMap"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 


<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/add_department">Add Department</a>

<a></a>
<form>
	<c:set var="phongban" value="${sessionScope.Phongban}"/>
        <c:if test="${not empty phongban}"/>
	<table class="table table-hover" style="text-align: center">
		<thead>
			<tr>
				<th>ID</th>
				<th>Department Name</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="count" value="0" />
			<c:forEach var="rows" items="${phongban}">
				<c:set var="count" value="${count +1}" />
				<tr>
					<td>${rows.maphongban}</td>
					<td>${rows.tenphongban}</td>
					<td>
						<a class="w3-button w3-yellow" href="${pageContext.request.contextPath}/edit_department?maphongban=${rows.maphongban}">Edit</a>
						
						<a class="w3-button w3-red" href="${pageContext.request.contextPath}/delete_department?maphongban=${rows.maphongban}">Delete</a>
						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<script type="text/javascript">
var success = "${sessionScope.success}";
var message = "${sessionScope.message}";
if (success!="") {
	swal(success, message, "success");
}
<%
session.removeAttribute("success");
session.removeAttribute("message");
%>
</script>
