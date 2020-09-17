 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/add_staff">Add Staff</a>

	<a></a>
	<form>
		<c:set var="nhanvien" value="${sessionScope.Nhanvien}" />
		<c:if test="${not empty nhanvien}" />
		<table class="table table-hover" style="text-align: center">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Image</th>
					<th>Birthday</th>
					<th>Salary</th>
					<th>Level</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Note</th>
					<th>Department ID</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="count" value="0" />
				<c:forEach var="rows" items="${nhanvien}">
					<c:set var="count" value="${count +1}" />
					<tr>
						<td>${rows.manhanvien}</td>
						<td>${rows.hoten}</td>
						<td class="gt">${rows.gioitinh}</td>
						<td><img src="${rows.hinhanh}" style="width: 100px; height: 100px;"/></td>
						<td>${rows.ngaysinh}</td>
						<td>${rows.luong}</td>
						<td>${rows.capdo}</td>
						<td>${rows.email}</td>
						<td>${rows.sdt}</td>
						<td>${rows.ghichu}</td>
						<td>${rows.phongban.tenphongban}</td>
						<td><a class="w3-button w3-yellow" href="${pageContext.request.contextPath}/edit_staff?manhanvien=${rows.manhanvien}">Edit</a>
							
							<a class="w3-button w3-red" href="${pageContext.request.contextPath}/delete_staff?manhanvien=${rows.manhanvien}">Delete</a>
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
<script type="text/javascript">
	var gioitinh = document.getElementsByClassName("gt");
	for(var i=0; i<gioitinh.length; i++){
		if(gioitinh[i].innerText == "1"){
			gioitinh[i].innerText = "Nam";
		}
		if(gioitinh[i].innerText == "0"){
			gioitinh[i].innerText = "Nữ";
		}
	}
</script>
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